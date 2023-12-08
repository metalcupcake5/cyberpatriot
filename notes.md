# SSH
`/etc/ssh/sshd_config` is for the server, `ssh_config` is for the client

- check `/var/log/auth.log` for logins
- `PasswordAuthentication no`
- `AuthenticationMethods publickey`
- `PermitRootLogin no`
- `PubkeyAuthentication yes`
- `PermitEmptyPasswords no`
- `AllowTcpForwarding no`
- `X11Forwarding no`
- `LogLevel VERBOSE`
- change `Port` to anything other than the default of 22
- check for `AllowUsers` and `DenyUsers` as well as `Match User` segments
- check `~/.ssh/authorized_keys`

reference
- https://help.ubuntu.com/community/SSH/OpenSSH/Configuring
- https://manpages.ubuntu.com/manpages/noble/en/man5/sshd_config.5.html
- https://wiki.archlinux.org/title/OpenSSH#Protection

# `/etc/` files
- `/etc/shadow`
    - file for authentication
    - `640` permissions
- `/etc/passwd`
    - stores user info, login shell types, other stuff
    - owned by root
    - `644` permissions
- `/etc/sudoers` and `/etc/sudoers.d/`
    - check for `NOPASSWD`
    - check other permissions
- `/etc/group`
    - stores group data
    - group commands
        - `groups <username>`: display groups for a user
        - `groupadd <group name>`: create a group
        - `groupdel <group name>`: delete a group

openvpn | <https://wiki.archlinux.org/title/OpenVPN#>
- `/etc/openvpn/server/server.conf`
```
ca ca.crt
cert servername.crt
key servername.key
dh dh.pem

tls-crypt ta.key # Replaces tls-auth ta.key 0

user nobody
group nobody
```
```
cipher AES-256-GCM
auth SHA512
tls-version-min 1.3
```

# apt
- list all packages
    - `apt list --installed | grep -v automatic`
- list all files relating to a package
    - `dpkg -L <package name>`

# sudo
https://wiki.archlinux.org/title/Sudo
- check current permissions for current user
    - `sudo -ll`
- check sudo permissions for a user
    - `sudo -lU <user>`
- always use `EDITOR=nano visudo` to edit sudoers file

# polkit
establishes privileges without sudo
<https://wiki.archlinux.org/title/Polkit>
- try installinlg `polkit-explorer`
- actions are in `/usr/share/polkit-1/actions`, use `pkaction` to view quickly