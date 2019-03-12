# ssh_ldap_host

# Repositori amb els arxius necesaris per crear les imatges 

# Arquitectura utilitzada

raulbaena/sshd:server --> Servidor SSH amb connexió al servidor LDAP, aquest servidor es podran conectar usuaris locals y LDAP

raulbaena/ldapserver:sshd --> Servidor LDAP amb base de dades dc=edt,dc=org.

raulbaena/hostpam:sshd --> Hostpam amb consexió amb el servidor LDAP

Xarxa virtual creada sshnet

### Descarregar imatges

docker pull raulbaena/sshd2:server

docker pull raulbaena/sshd2:ldap

docker pull raulbaena/sshd2:host

### Comandes necesaries per l'execució de cada maquina

docker network create sshnet

docker run --privileged --rm -h host --name host --network sshnet -it raulbaena/sshd2:host

docker run --privileged --rm --name sshd -h sshd -p 1022:1022 --network sshnet -it raulbaena/sshd2:server

docker run --rm --network sshnet -h ldap --name ldap -p 389:389 -d raulbaena/sshd2:ldap
