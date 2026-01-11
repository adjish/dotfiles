killall clapboard 2> /dev/null

if [ ! -e /tmp/sway ] && ! pidof -q sway;
then
   exec sway > /tmp/sway
fi
