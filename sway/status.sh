volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"
volume=$(bc <<<"${volume#* }*100")
echo "${volume%.*}"% 🔊 $(date '+%H:%M %a %d/%m/%y')
