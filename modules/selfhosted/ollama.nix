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
# Started on llama3.2:3b, measured ~2.3G VRAM / 87% util in real use — real
# headroom on the 6G card, so bumped to qwen2.5:7b (~4.5-5G) for better
# quality and notably better French handling. Leaves much less room for
# Jellyfin NVENC / Immich ML to share the card at the same time as a result —
# drop back to a 3B if that contention becomes a real problem.
{
  flake.nixosModules.ollama = {pkgs, ...}: {
    services.ollama = {
      enable = true;
      package = pkgs.ollama-vulkan;
      loadModels = ["qwen2.5:7b"];
    };
  };
}
