{
  flake.nixosModules.ollama = {pkgs, ...}: {
    services.ollama = {
      enable = true;
      package = pkgs.ollama-cuda;
      # Optional: preload models, see https://ollama.com/library
      loadModels = [];
    };
  };
}
