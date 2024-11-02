{
  writeShellApplication,
  wireplumber,
  dunst,
}:
writeShellApplication {
  name = "volume";
  text = ''
    # usage: volume up 5 #will increase volume by 5%
    # volumte toggle #will toggle mute

    case "$1" in
      up)
        ${wireplumber}/bin/wpctl set-volume --limit 1.1 @DEFAULT_AUDIO_SINK@ "$2"%+
        ;;

      down)
        ${wireplumber}/bin/wpctl set-volume --limit 1.2 @DEFAULT_AUDIO_SINK@ "$2"%-
        ;;

      toggle)
        ${wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        ;;

      *)
        echo ERROR: unknow operator argument
        exit 1
        ;;
    esac

    value=$(${wireplumber}/bin/wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed -E 's/[^0-9.]//g; s/^0*([1-9]*)\.([0-9][0-9])0*$/\1\2/; s/^$/0/')

    if ${wireplumber}/bin/wpctl status | rg MUTED -q
    then
      image=${./assets/volume-mute.svg}
    else
      image=${./assets/volume.svg}
    fi

    ${dunst}/bin/dunstify \
      "Volume $value%" \
      --urgency=low \
      --hints=string:image-path:"$image" \
      --hints=int:value:"$value" \
      --replace=2594 \
      --timeout=1000 \
  '';
}
