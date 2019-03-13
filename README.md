
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

docker run --rm --network sshnet -h ldap --name ldap -p 389:389 -d raulbaena/sshd2:ldap

docker run --privileged --rm --name sshd -h sshd -p 1022:1022 --network sshnet -it raulbaena/sshd2:server

docker run --privileged --rm -h host --name host --network sshnet -it raulbaena/sshd2:host


### Directiva de restricció d’accés tipus AllowUsers.

Per implementar aquesta directiva hem d'editar el fitxer de configuració sshd_config, es troba a /etc/ssh/sshd_config
```
Allowusers anna vladimir pere raul
```
### Exemple
```
[root@host docker]# ssh vladimir@172.18.0.3 -p 1022 
Password: Creating directory '/tmp/home/2wiaw/vladimir'. 
id: cannot find name for group ID 651 
[vladimir@sshd ~]$
```
### Resricció d’accés d’usuaris amb pam_access.so.

Editarem el fitxer sshd del servidor sshd y afegirem la seguent linea

account required pam_access.so accessfile=/etc/security/access.conf

Un cop afegida aquesta linea cerarem un arxiu que en aquest cas es dira access.conf on posarems els grups o els usuaris que volem que no pugin inciar sessió per ssh

#Configuracio on els usuaris que pertanyen al grup dicts no es podran conectar
```
    : dicts : ALL
    : rajoy : ALL
```
### Exemple
```
[root@host docker]# ssh rajoy@172.18.0.3 -p 1022 rajoy@172.18.0.3's password: Permission denied, please try again. rajoy@172.18.0.3's password: Permission denied, please try again. rajoy@172.18.0.3's password: Received disconnect from 172.18.0.3 port 1022:2: Too many authentication failures Disconnected from 172.18.0.3 port 1022
```
### Resricció d’accés d’usuaris amb pam_listfile.so

Editarem el fitxer sshd del servidor sshd y afegirem la seguent linea

auth required pam_listfile.so onerr=fail item=user sense=deny file=/etc/usuaris

Un cop afegida aquesta linea crearem un arxiu que en aquest cas es dira usuaris on posarem els usuaris que no volem que iniciin sessió

user10 

dani

### Exemple
```
[root@host docker]# ssh dani@172.18.0.3 -p 1022 dani@172.18.0.3's 

password: Permission denied, please try again. dani@172.18.0.3's

password: Permission denied, please try again. dani@172.18.0.3's 

password: Received disconnect from 172.18.0.3 port 1022:2: 

Too many authentication failures Disconnected from 172.18.0.3 port 1022
```
