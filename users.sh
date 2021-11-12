echo "users script"
echo "1. list users"
echo "2. list groups"
echo "3. view user groups"
echo "4. remove user admin"
echo "5. add user admin"

read choice

if [ $choice == 1 ]
then
    getent passwd | awk '{print $1}' | cut -f1 -d":" > users.txt
elif [ $choice == 2 ] 
then
    getent group | cut -f1 -d":"
elif [ $choice == 3 ]
then
    echo "what user"
    read user
    groups $user
elif [ $choice == 4 ]
then
    echo "what user"
    read user
    gpasswd -d $user sudo
    gpasswd -d $user adm
    gpasswd -d $user lpadmin
    gpasswd -d $user sambashare
elif [ $choice == 5 ]
then
    echo "what user"
    read user
    gpasswd -a $user sudo
    gpasswd -a $user adm
    gpasswd -a $user lpadmin
    gpasswd -a $user sambashare
else
    echo "you didn't choose anyting"
fi