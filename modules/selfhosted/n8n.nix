# Workflow automation (mail/listing triage): reads IMAP, calls the local
# Ollama model (see ollama.nix, 127.0.0.1:11434) for classification, acts on
# the result. n8n does the orchestration; Ollama only does inference.
#
# N8N_PROTOCOL/HOST/WEBHOOK_URL are set even though caddy talks plain HTTP to
# n8n internally, because n8n's secure-cookie logic and any generated webhook
# URLs need to reflect the real external scheme (https, via caddy's
# `tls internal`) rather than what n8n itself sees on the wire.
#
# Secret (create with agenix): a stable random string, e.g. `openssl rand -hex 32`
# — this encrypts credentials (IMAP password, etc.) stored in n8n's database.
# Losing/rotating it makes existing stored credentials unreadable, so once
# workflows are configured, keep it stable.
{
  flake.nixosModules.n8n = {config, ...}: {
    age.secrets.n8n-encryption-key.file = ../../secrets/selfhosted/n8n-encryption-key.age;

    services.n8n = {
      enable = true; # 5678
      environment = {
        N8N_ENCRYPTION_KEY_FILE = config.age.secrets.n8n-encryption-key.path;
        N8N_PROTOCOL = "https";
        N8N_HOST = "n8n.camlann.local";
        WEBHOOK_URL = "https://n8n.camlann.local/";
      };
    };

    persist.directories = [
      "/var/lib/n8n"
    ];
  };
}
