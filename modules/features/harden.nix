# Host hardening (Lynis-driven), imported by both hosts. Only native NixOS
# options — no extra agents or scanners to maintain. Everything is mkDefault so
# a host can override any single value without a module-merge conflict.
#
# Deliberately NOT set, despite Lynis asking:
#   kernel.modules_disabled=1        — would block module loading until reboot;
#                                      breaks activating a config that needs a
#                                      new kernel module.
#   net.ipv4.conf.all.forwarding=0   — podman containers (camlann: byparr) and
#                                      libvirt NAT networks (avalon) need it.
#   net.ipv4...rp_filter=1 (strict)  — wg-quick policy routing (qbproton /
#                                      jnms VPNs) can drop packets under strict
#                                      reverse-path filtering; loose (2) is safe.
#   usb_storage blacklist            — kept so USB drives still work.
{
  flake.nixosModules.harden = {lib, ...}: {
    # Lynis only detects legacy iptables; the NixOS firewall was active all
    # along. nftables is the modern backend and is what Lynis looks for.
    # libvirt (avalon) and wg-quick both handle the nftables backend natively;
    # if a NAT'd VM ever loses network, override with lib.mkForce false there.
    networking.nftables.enable = lib.mkDefault true;

    # Rarely-used network protocols with a history of vulnerabilities.
    boot.blacklistedKernelModules = ["dccp" "sctp" "rds" "tipc"];

    # mkOverride 900: wins over NixOS's own mkDefault (1000) sysctls, but any
    # plain assignment in a host config (priority 100) still overrides us.
    boot.kernel.sysctl = lib.mapAttrs (_: lib.mkOverride 900) {
      "dev.tty.ldisc_autoload" = 0;
      "fs.protected_fifos" = 2;
      "fs.protected_regular" = 2;
      "fs.suid_dumpable" = 0;
      "kernel.kptr_restrict" = 2;
      "kernel.sysrq" = 0;
      "kernel.unprivileged_bpf_disabled" = 1;
      "net.core.bpf_jit_harden" = 2;
      "net.ipv4.conf.all.log_martians" = 1;
      "net.ipv4.conf.default.log_martians" = 1;
      "net.ipv4.conf.all.rp_filter" = 2; # loose, see header
      "net.ipv4.conf.default.accept_redirects" = 0;
      "net.ipv6.conf.all.accept_redirects" = 0;
      "net.ipv6.conf.default.accept_redirects" = 0;
    };

    # Kernel audit framework (ACCT-9628); rules can be added later if wanted.
    security.audit.enable = lib.mkDefault true;
    security.auditd.enable = lib.mkDefault true;

    # Legal banner (BANN-7126).
    environment.etc.issue.text = lib.mkDefault ''
      Unauthorized access to this system is prohibited.
      All activity may be monitored and reported.
    '';
  };
}