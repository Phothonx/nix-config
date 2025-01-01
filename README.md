# Nix-config

### To-do
- [ ] 🔐 vulnix & lynis check, lanzaboot
- [ ] 💾 disko & impermanence
- [x] 📃 nh easy rebuild & outputs
- [x] 🛠️ Personal devhsells integration
- [ ] 🔋 tlp battery optimisation
- [x] 🧱 Modular nixos config
- [ ] 🌍 Common hosts config
- [ ] 🧹 xdg clean home
- [x] 📚 Add custom lib
- [x] 📦 Add ustom packages & overlays
- [x] 🖼️ Hyprland config
- [x] Hyprland plugins
- [x] Gamma shading
- [ ] 🎚️ Fabric/astal bar & widgets
- [ ] 🤖 nix-on-droid
- [ ] 🐟 Fish & carapace completion
- [ ] 💽 Server VM - wireguard - nextcloud
- [ ] Zen browser
- [ ] Zed code editor & jupyter support ?

*for your viewing pleasure*
![preview.png](./assets/preview.png)

### Deshells
```
# permanent devshells using profile
nix develop --profile ./.profile [FLAKE]#[DEVSHELL]
```

### Agenix
```
# To create a secret ( /!\ don't forget to modify secret.nix)
agenix -e [SECRET NAME].age
```
