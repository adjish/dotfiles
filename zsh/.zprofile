pidof -q clapboard && killall clapboard

if [ ! -e /tmp/sway ] && ! pidof -q sway;
then
   exec sway > /tmp/sway
fi
