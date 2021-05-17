alarm_music="/root/Desktop/random_random_random/xo_ravi/AC-DC - Back In Black.mp3"
icon="/root/Desktop/random_random_random/xo_ravi/images/acdc.jpg"

# source stopwatch.sh; jcountdown 60 # 60 seconds
# source stopwatch.sh; stopwatch

countdown(){
  date1=$((`date +%s` + $1));
  while [ "$date1" -ge `date +%s` ]; do 
    ## Is this more than 24h away?
    days=$(($(($(( $date1 - $(date +%s))) * 1 ))/86400))
      echo -ne "$days day(s) and $(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r"; 
  sleep 0.1
    done
  notify-send "Yeah Boi" -i "${icon}"
  mpg321 "${alarm_music}"
}
stopwatch(){
  date1=`date +%s`; 
  while true; do 
    days=$(( $(($(date +%s) - date1)) / 86400 ))
      echo -ne "$days day(s) and $(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
  sleep 0.1
    done
}
