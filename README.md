# ssh_ldap_host

# Repositori amb els arxius necesaris per crear les imatges 

# Arquitectura utilitzada

raulbaena/sshd:final --> Servidor SSH amb connexió al servidor LDAP, aquest servidor es podran conectar usuaris locals y LDAP

raulbaena/ldapserver:sshd --> Servidor LDAP amb base de dades dc=edt,dc=org.

raulbaena/hostpam:sshd --> Hostpam amb consexió amb el servidor LDAP

Xarxa virtual creada sshnet

### Comandes necesaries per l'execució de cada maquina
