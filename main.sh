if [[ "$EUID" = 0 ]]; then
    echo "(1) already root"
else
    sudo -k # make sure to ask for password on next sudo
    if sudo true; then
        echo "(2) correct password"
    else
        echo "(3) wrong password"
        exit 1
    fi
fi
echo "script"

echo "enabling firewall"
ufw enable

echo "
finding files - check further if time using \"sudo ls -Ra *\"
"

(
    ## pictures
    find ./ -name "*.png" -type f;
    find ./ -name "*.jpg" -type f;
    find ./ -name "*.jpeg" -type f;
    find ./ -name "*.gif" -type f;

    ## video
    find ./ -name "*.mp4" -type f;
    find ./ -name "*.mov" -type f;
    find ./ -name "*.webm" -type f;

    ## audio
    find ./ -name "*.mp3" -type f;
    find ./ -name "*.wav" -type f;

    ## others
    find ./ -name "*.txt" -type f;
    find ./ -name "*.zip" -type f;
    find ./ -name "*.rar" -type f;
    find ./ -name "*.tar.gz" -type f;
    find ./ -name "*.php" -type f;
    find ./ -name "*backdoor*.*" -type f;
) | tee find.txt | grep -v "/\."


echo "
checking for lightdm
"
if sudo test -f "/etc/lightdm/lightdm.conf"; then
    echo "lightdm found"
else
    echo "lightdm not found"
fi

echo "
checking /etc/passwd
"
if test -f "/etc/passwd"; then
    echo "/etc/passwd found"
    echo "------------------
uid 0 users
------------------"
    cat /etc/passwd | grep ":0:"
else
    echo "
    /etc/passwd not found"
fi

echo "
checking /etc/group
"

if test -f "/etc/group"; then
    echo "/etc/group found"
    echo "------------------
admin group:
------------------"
    cat /etc/group | grep "admin"
    echo "------------------
sudo group:
------------------"
    cat /etc/group | grep "sudo"
    echo "------------------
root group:
------------------"
    cat /etc/group | grep "root"
    echo "------------------
wheel group:
------------------"
    cat /etc/group | grep "wheel"

else
    echo "
    /etc/group not found"
fi

echo "
checking /etc/sudoers
"
if test -f "/etc/sudoers"; then
    echo "/etc/sudoers found"
    echo "------------------
wheel without password line
ENSURE THIS IS COMMENTED
------------------"
    cat /etc/sudoers | grep "NOPASSWD"
else
    echo "
    /etc/sudoers not found"
fi

# 
echo "
checking /etc/login.defs
"
if test -f "/etc/login.defs"; then
    echo "/etc/login.defs found"
    echo "------------------
password policies
set to

PASS_MIN_DAYS 7
PASS_MAX_DAYS 90
PASS_WARN_AGE 14
------------------"
    cat /etc/login.defs | grep "PASS_"
else
    echo "
    /etc/login.defs not found"
fi