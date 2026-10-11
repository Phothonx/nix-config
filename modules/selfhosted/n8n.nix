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
      "/var/lib/private/n8n"
    ];
  };
}
