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