# Nix-config

### To-do
- [ ] 🔐 vulnix & lynis check, lanzaboot
- [ ] 💾 disko & impermanence
- [x] 📃 nh easy rebuild & outputs
- [ ] 🛠️ Personal devhsells integration
- [ ] 🔋 tlp battery optimisation
- [x] 🧱 Modular nixos config
- [ ] 🌍 Common hosts config
- [ ] 🧹 xdg clean home
- [x] 📚 Add custom lib
- [x] 📦 Add ustom packages & overlays
- [x] 🖼️ Hyprland config
- [x] Hyprland plugins
- [x] Gamma shading
- [ ] 🎚️ Fabric bar & widgets
- [ ] 🤖 nix-on-droid
- [ ] 🐟 Fish & carapace completion
- [ ] 💽 Server VM - wireguard - nextcloud
- [ ] Zen browser
- [ ] Zed code editor & jupyter support ?

*for your viewing pleasure*
![preview.png](./assets/preview.png)

### Agenix
```
# To create a secret ( /!\ don't forget to modify secret.nix)
agenix -e [SECRET NAME].age
```

### Borg backup
```
# Timer before next backup
systemctl status borgbackup-job-[JOB NAME].timer

# Get infos
borg-job-[JOB NAME] list
borg-job-[JOB NAME] info

# Restoring files
mkdir mount
borg mount [REPO] ./mount/
borg umount ./mount/
```
