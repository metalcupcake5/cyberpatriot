echo "update script"
echo "1. upgrade specific package"
echo "2. delete package"
echo "3. upgrade everything"

read choice

if [ $choice == 1 ]
then
    echo "updating package listing"
    sudo apt update
    echo "what package?"
    read package
    sudo apt install $package
    sudo apt autoremove
elif [ $choice == 2 ] 
then
    echo "what package?"
    read package
    sudo apt remove $package
    sudo apt autoremove
elif [ $choice == 3 ]
then
    sudo apt update
    sudo apt -y upgrade
    sudo apt -y autoremove
else
    echo "you didn't choose anyting"
fi