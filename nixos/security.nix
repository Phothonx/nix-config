{ ... }:
{
  security = {
    pam.services = {
      swaylock = {};
      hyprlock.text = "auth include login";
      greetd.enableGnomeKeyring = true; # unlock GPG keyring on login
    };

    rtkit.enable = true;
  };
}