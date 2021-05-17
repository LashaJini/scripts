echo -e "Choose: " &&
echo -e "0) normal" &&
echo -e "1) Js" &&
echo -e "2) Py\n" &&

read -p "Which layout? >>> " num

if [ $num -eq 0 ]
then
  setxkbmap -layout us
elif [ $num -eq 1 ]
then
  setxkbmap -layout jini_js
elif [ $num -eq 2 ]
then
  setxkbmap -layout jini_py
fi
