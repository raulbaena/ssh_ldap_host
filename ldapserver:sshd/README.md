# ldapserver:sshd

## @edt ASIX M06-ASO 2018-2019

## Maquina

raulbaena/ldapserver:sshd --> Maquina servidor ldap amb base de dades dc=edt,dc=org

ldapserver 2018-2019 edt.org cn

Comandes per execució

 * **server** docker run --rm --network sshnet -h ldap --name ldap -p 389:389 -d ldapserver:sshd




