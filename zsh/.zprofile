pidof -q sway

if [[ ! -a /tmp/sway && $? -ne 0 ]];
then
   exec sway > /tmp/sway
fi
