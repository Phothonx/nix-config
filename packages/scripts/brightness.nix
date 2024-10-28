{
  writeShellApplication,
  bc,
  dunst,
  brightnessctl,
}:
writeShellApplication {
  name = "brightness";
  text = '' 
    # usage: brightness up 5 #will increment screen brightness by 5% smoothly 
    
    # time=$(($2*30000)) #takes 0.03s per 1% 

    max=$(${brightnessctl}/bin/brightnessctl max)
    min=$(echo "$max"*0.05 | ${bc}/bin/bc -l)

    case "$1" in
      up)
        ${brightnessctl}/bin/brightnessctl \
        --min-value="$min" \
        set "$2"%+
        ;;

      down)
      ${brightnessctl}/bin/brightnessctl \
        --min-value="$min" \
        set "$2"%-
        ;;

      *)
        echo ERROR: unknow operator argument
        exit 1
        ;;
    esac

    # change regex remove decimals
    actual=$(${brightnessctl}/bin/brightnessctl get)
    value=$(echo "$actual"/"$max" | bc -l | sed -E 's/[^0-9.]//g; s/^0*([1-9]*)\.([0-9][0-9])0*$/\1\2/; s/^$/0/')

    ${dunst}/bin/dunstify \
      "Brightness $value%" \
      --urgency=low \
      --hints=string:image-path:"${./assets/brightness.svg}" \
      --hints=int:value:"$value" \
      --replace 2593 \
      --timeout=1000 \
  '';
}
