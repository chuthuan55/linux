sudo apt update
sudo apt install openssh-server

# 
sudo nano /etc/ssh/sshd_config

# check ssh 
sudo systemctl start sshd
sudo systemctl status sshd
sudo systemctl restart sshd


ss -nlp | grep 22
tcp        0      0 0.0.0.0:22            0.0.0.0:*               LISTEN      -
tcp6       0      0 :::22                 :::*                    LISTEN      -

