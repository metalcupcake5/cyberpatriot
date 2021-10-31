echo "users script"
echo "1. list users"
echo "2. list groups"
echo "3. view user groups"

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
else
    echo "you didn't choose anyting"
fi