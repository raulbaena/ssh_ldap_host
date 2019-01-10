# ssh_ldap_host

# Repositori amb els arxius necesaris per crear les imatges 

# Arquitectura utilitzada

raulbaena/sshd:final --> Servidor SSH amb connexió al servidor LDAP, aquest servidor es podran conectar usuaris locals y LDAP

raulbaena/ldapserver:sshd --> Servidor LDAP amb base de dades dc=edt,dc=org.

raulbaena/hostpam:sshd --> Hostpam amb consexió amb el servidor LDAP

Xarxa virtual creada sshnet

### Comandes necesaries per l'execució de cada maquina

docker network create sshnet

docker run --privileged --rm -h host --name host --network sshnet -it hostpam:sshd

docker run --privileged --rm --name sshd -h sshd -p 1022:1022 --network sshnet -it sshd:server

docker run --rm --network sshnet -h ldap --name ldap -p 389:389 -d ldapserver:sshd
