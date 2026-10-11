{
  flake.nixosModules.ollama = {pkgs, ...}: {
    services.ollama = {
      enable = true;
      package = pkgs.ollama-vulkan;
      loadModels = ["qwen2.5:7b"];
    };
  };
}
