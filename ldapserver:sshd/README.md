# ldapserver:tmp

## @edt ASIX M06-ASO 2018-2019

ldapserver 2018-2019 edt.org cn

Comandes:

 * **server** docker run --rm --network netldap -h ldapserver --name ldapserver -p 389:389 -d ldapserver:tmp
 * **client** docker run --network netldap ---name ldaphost -rm -it fedora:27 /bin/bash



