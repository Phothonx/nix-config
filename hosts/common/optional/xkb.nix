{ ... }:
{
  console.useXkbConfig = true;
  services.xserver.xkb = {
    layout = "fr";
    options = "caps:escape";
  };
}
