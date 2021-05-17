eslintrc_js="/root/github/configs/js/.eslintrc.js"
echo -e "1. ${eslintrc_js}" &&
echo ""

read -p "Choose config: " num

if [ $num -eq 1 ]
then
  cp ${eslintrc_js} .
fi
