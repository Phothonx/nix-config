# Nix-config

## To-do
 - nix ssh config
 - git ssh config
 - change sops keyfile for systemwide
 - generate age key from ssh key
 - add ssh k to sops (make a home specific sops file)
 - astal v3 with python ?

## Notes

### Sops
edit secrets file
```
sops secrets/secrets.yaml
```
update secrets file keys
```
sops updatekeys secrets/example.yaml
```

### Set X keybord mapping anywhere
```
curl -O https://raw.githubusercontent.com/Phothonx/nix-config/refs/heads/main/hosts/common/kblayouts/symbols/nico
mv -v ./nico ~/.config/xkb/symbols/nico
setxkbmap -I$HOME/.config/xkb nico basic
```

### Recovery
Append to boot options:
```
<...> rescue systemd.setenv=SYSTEMD_SULOGIN_FORCE=1
```

## For your viewing pleasure
*v2*
![preview1.png](./assets/preview_v2.png)
*v1*
![preview3.png](./assets/preview_v1.png)
