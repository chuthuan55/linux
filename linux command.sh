#check IP address
  ifconfig
  ip addr
  hostname -I

# fn_ping
#check connection
  ping 10.0.2.15
  ping google.com ~ ping 8.8.8.8

#check username
  whoami

# fn_ls:  
  ls ~
  ls -l: give the list in long format
  # drwxr-xr-x 2 chuthuan chuthuan 4096 Thg 2  21 01:10 Desktop
  ls -a: all files
  ls -al
  ls ..
  ..: 1 step back directory

# fn_cd
  #  change location
  pwd
  cd /home/chuthuan/
  cd .. 
  cd -: quay lai thu muc trc do

# fn_cat
  # read file content
  cat /home/chuthuan/Desktop/test.txt

  cat << 'EOF' > /tmp/nginx.conf
user  nginx;
worker_processes  1;

error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    #gzip  on;

    include /etc/nginx/conf.d/*.conf;
}
# test abc
EOF

# fn_mkdir
  # create directory
  mkdir thuan
  mkdir -p /home/chuthuan/Desktop/abc/xyz # tao thu muc con neu k co thu muc cha

# fn_rm
  # delete directory and file
  cd Desktop
  mkdir -p abc/xyz
  rm -rf /home/chuthuan/Desktop/abc/xyz

# fn_cp 
  # copy files or directory to files or directory
  cp file1.txt file2.txt
  cp -i file1.txt file2.txt abc
  cp -R abc xyz

# fn_mv
  # change location or rename file or directory
  mv /home/chuthuan/Desktop/a /home/chuthuan/Desktop/b/

# fn_clearscreen
  clear
 
# fn_less
  # rut gon noi dung cua file
  less filename.txt

# fn_touch
  # creat file 
  touch abc

# fn_nano
  # creat file, correct content, find something in file...
  nano abc.txt
  ctrl + O: save
  ctrl + W: find
  ctrl + X: exit

# fn_sudo
  # want to executable the command to adminators, install third sofftware

# fn_htop
  # monitor performain
  htop

# fn_kill
# 


# fn_echo
  # test
  var="hello"
  echo $var
  hello

# permission
  # file
    r: This permission give you the authority to open and read a file. ~ 4
    w: The write permission gives you the authority to modify the contents of a file. ~ 2
    x: If the execute permission is not set, you might still be able to see/modify the program code(provided read & write permissions are set), but not run it. ~ 1
  # directory
   r: Read permission on a directory gives you the ability to lists its content.
   w: The write permission on a directory gives you the authority to add, remove and rename files stored in the directory.
   x: If the execute permission is not set, you might still be able to see/modify the program code(provided read & write permissions are set), but not run it.

# fn_chmod
  # allow permission
  chmod u=rwx abc.txt ~ chmod 700 abc.txt

  # chmod
  mkdir -p ./x/y/z/
  nano  abc.txt
  chmod 777 ./a
  ls -l
  -rwx------ 1 chuthuan chuthuan   25 Thg 2  23 14:40 abc.txt

  # chmod -R
  mkdir -p ./a/b/c/
  nano abc.txt
  ls -l
  -rw-rw-r-- 1 chuthuan chuthuan 0 Thg 2  23 14:46 abc.txt

  chmod -R 777 ./a
  ls -l
  -rwxrwxrwx 1 chuthuan chuthuan    0 Thg 2  23 14:46 abc.txt*

  # cấp quyền cho user 
  drwxr-xr-x. 3 root root   20 Mar 17 15:50 nginx
  chown -R /root/webserver/nginx
  drwxr-xr-x. 3 nginx nginx   20 Mar 17 15:50 nginx

# fn_which
  # show link to command directory
  which ls
  /usr/bin/ls

# fn_useradd
  sudo useradd -m thuan
  sudo passwd thuan
  cat /etc/passwd
  thuan:x:1001:1001::/home/thuan:/bin/sh

  -m, --create-home             create the users home directory

# fn_userdel
  sudo userdel --help
  Usage: userdel [options] LOGIN

  Options:
  -f, --force                   force removal of files,
                                even if not owned by user
  -r, --remove                  remove home directory and mail spool

  sudo userdel -fr thuan
  userdel: user thuan is currently used by process 4189
  userdel: thuan mail spool (/var/mail/thuan) not found
  userdel: thuan home directory (/home/thuan) not found

# fn_id
  # 
  id thuanchu
  uid=1002(thuanchu) gid=1002(thuanchu) groups=1002(thuanchu)

  id chuthuan
  uid=1000(chuthuan) gid=1000(chuthuan) groups=1000(chuthuan),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),120(lpadmin),131(lxd),132(sambashare)

# fn_groups
  # allow to see which groups the user in
  groups chuthuan
  chuthuan : chuthuan adm cdrom sudo dip plugdev lpadmin lxd sambashare

# fn_groupadd

# fn_groupdel

# fn_du
  du -sh /home/chuthuan/Desktop/
  44K     /home/chuthuan/Desktop/

  du -sh /home/chuthuan
  7,3M    /home/chuthuan
  -h, --human-readable  print sizes in human readable format (e.g., 1K 234M 2G)
  -s, --summarize       display only a total for each argument

# fn_df
  df -h
  /dev/sda5        20G  6,4G   12G  35% /

# fn_watch
  # see the changes in every 2s
  watch free

# fn_head
  # show 10 lines start

# fn_tail
  # show 10 lines end


# fn_find
  # find the file or directory you don't know the location
  find /home/chuthuan/ -name xyz.txt
  /home/chuthuan/Desktop/a/b/c/xyz.txt

# fn_wc 
  nano x.txt
  wc x.txt
  3  4 23 x.txt

# fn_cal
  # show the calendar

# fn_date
  # show and change time

# fn_ apt-get
  # to install, remove, update the packet

# fn_tar
  # same winrar in Windows
  tar -cf abc.tar abc

  -c: to create tar
  -f: to specify the file name

# fn_grep
  # to find the word, number, sentence,.. of text file
  grep "a" a.txt
  asd
  adgfdb
  asdsfsewa
  aloalo
  sdfas

  grep "s" a.txt
  asd
  sdf
  asdsfsewa
  sdfas

  cat a.txt  | grep "s"
  asd
  sdf
  asdsfsewa
  sdfas


# fn_netstat
  # network statistic

  netstat -nlp ~ ss -nlp
  unix  2      [ ACC ]     STREAM     LISTENING     33147    1367/gnome-session-  @/tmp/.ICE-unix/1367

  -n: dont resolve names
  -l: listening state
  -p: programs

# fn_restart
  sudo reboot

# fn_ssh
  ssh user@ipaddress -p port

# ctrl r: find command

# fn_shutdown
  shutdown -h now

# systemctl stop firewalld
  # turn off firewall

# disable SElinux
  sentenforce 0

# 
  firewall-cmd --add-port=80/tcp --permanent
  firewall-cmd --add-port=8080/tcp --permanent
  firewall-cmd --reload

# fn_yum
  yum install -y nano

# fn_crontab
# set auto job
  # list job
    crontab -l

  # crontab.guru
    to know the time to set in crontab

  # edit
    crontab -l
    40 16 * * * wget -O - https://bkpos.baokim.vn:9106/api/v1/cross-check/ten-day > /dev/null 2>&1
    crontab -e
    shift + P + G
    - i 
    edit
    press esc
    :wq! 
# fn_dd
# to know I/O speed
  dd if=./latest.tar.gz of=/tmp/latest.tar.gz
  30756+1 records in
  30756+1 records out
  15747536 bytes (16 MB) copied, 0.35811 s, 44.0 MB/s

# ssh-timeout
   vi /etc/ssh/sshd_config
   /ClientAliveInterval

# Để chạy php artisan ... thì vào container php5.6 hoặc php7.3 7.4 tùy theo project đó chạy gì
  docker ps #check php container name
  docker exec -it php74-esxi01-prod01 bash
  cd /var/www/pincode/admin_9602/
  php artisan migrate
