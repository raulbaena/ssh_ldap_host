# SSHD

# Raul Baena Nocea @edt ASIX M06-ASO Curs 2018-2019

## Maquines utilitzades

raulbaena/sshd:final --> Servidor SSH amb connexió al servidor LDAP, aquest servidor es podran conectar usuaris locals y LDAP

raulbaena/ldapserver:sshd --> Servidor LDAP amb base de dades dc=edt,dc=org.

raulbaena/hostpam:sshd --> Hostpam amb consexió amb el servidor LDAP

## Execucio de la maquina

docker run --privileged --rm --name sshd -h sshd -p 1022:1022 --network sshnet -it sshd:server

## Configuració del Servidor SSH

### Fitxers de configuració utilitzats

Dockerfile

install.sh

ldap.conf

nslcd.conf

nsswitch.conf

pam_mount.conf.xml

sshd server

sshd_config

startup.sh

system-auth


### Directiva de restricció d’accés tipus AllowUsers.

Per implementar aquesta directiva hem d'editar el fitxer de configuració sshd_config, es troba a /etc/ssh/sshd_config

Allowusers anna vladimir pere raul

### Exemple

[root@host docker]# ssh vladimir@172.18.0.3 -p 1022 
Password: Creating directory '/tmp/home/2wiaw/vladimir'. 
id: cannot find name for group ID 651 
[vladimir@sshd ~]$

### Resricció d’accés d’usuaris amb pam_access.so.

Editarem el fitxer sshd del servidor sshd y afegirem la seguent linea

account required pam_access.so accessfile=/etc/security/access.conf

Un cop afegida aquesta linea cerarem un arxiu que en aquest cas es dira access.conf on posarems els grups o els usuaris que volem que no pugin inciar sessió per ssh

#Configuracio on els usuaris que pertanyen al grup dicts no es podran conectar

    : dicts : ALL
    : rajoy : ALL

### Exemple

[root@host docker]# ssh rajoy@172.18.0.3 -p 1022 rajoy@172.18.0.3's password: Permission denied, please try again. rajoy@172.18.0.3's password: Permission denied, please try again. rajoy@172.18.0.3's password: Received disconnect from 172.18.0.3 port 1022:2: Too many authentication failures Disconnected from 172.18.0.3 port 1022

### Resricció d’accés d’usuaris amb pam_listfile.so

Editarem el fitxer sshd del servidor sshd y afegirem la seguent linea

auth required pam_listfile.so onerr=fail item=user sense=deny file=/etc/usuaris

Un cop afegida aquesta linea crearem un arxiu que en aquest cas es dira usuaris on posarem els usuaris que no volem que iniciin sessió

user10 

dani

### Exemple

[root@host docker]# ssh dani@172.18.0.3 -p 1022 dani@172.18.0.3's 

password: Permission denied, please try again. dani@172.18.0.3's

password: Permission denied, please try again. dani@172.18.0.3's 

password: Received disconnect from 172.18.0.3 port 1022:2: 

Too many authentication failures Disconnected from 172.18.0.3 port 1022
