Logs into a server with private key then executes `df -h && cd / && ls -l` from entrypoint and sends the output via telegram.

Takes id_rsa and telegram-send.conf from config folder.