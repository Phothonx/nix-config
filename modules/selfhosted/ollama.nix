# Local LLM inference (GTX 1660 Ti) for n8n's automations (mail/listing
# triage). Listens on 127.0.0.1:11434, called directly by n8n's HTTP/Ollama
# node — no reverse proxy, this is internal-only.
#
# Vulkan, not CUDA: cudaPackages.cuda_compat is currently broken on x86_64 in
# this nixpkgs pin (it's an aarch64/Jetson-only redistributable that gets
# pulled into the dependency chain anyway and has no source for x86_64 —
# https://github.com/NixOS/nixpkgs/issues/458799). Vulkan still gets real GPU
# acceleration on the 1660 Ti via the NVIDIA driver's own Vulkan ICD, without
# touching the broken CUDA redistributable tree at all.
#
# llama3.2:3b to start: the 1660 Ti (6G VRAM) also does Jellyfin NVENC and
# Immich's ML, so a small model leaves headroom instead of a 7B model eating
# most of the card on its own. Bump to a 7B (e.g. qwen2.5:7b) later if real
# usage shows the card has room.
{
  flake.nixosModules.ollama = {pkgs, ...}: {
    services.ollama = {
      enable = true;
      package = pkgs.ollama-vulkan;
      loadModels = ["llama3.2:3b"];
    };
  };
}
