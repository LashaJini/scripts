echo -e "Which?" &&
echo -e "1) ljini" &&
echo -e "2) 109149"

echo ""

read -p "Choose config: " num

NAME=""
EMAIL=""

if [ $num -eq 1 ]
then
  NAME="jiniusss"
  EMAIL="ljini17@freeuni.edu.ge"
elif [ $num -eq 2 ]
then
  NAME="109149"
  EMAIL="109149qwe@gmail.com"
else
  echo -e "\nWTF MAN >:("
  exit
fi

git config --global user.name $NAME
git config --global user.email $EMAIL

echo ""

git config --list
