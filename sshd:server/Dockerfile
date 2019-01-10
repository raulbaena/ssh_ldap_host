# Version: 0.0.1
# edt M06 2018-2019
# examen
#-------------------------------------------------
FROM edtasixm06/exam:latest
LABEL author="@edt ASIX M06 2018-2019"
LABEL description="Maquina ssh PAM 2018-2019"
RUN dnf -y install procps vim passwd openldap-clients nss-pam-ldapd pam_mount openssh-server openssh-clients
RUN /usr/bin/ssh-keygen -A
RUN mkdir /opt/docker
COPY * /opt/docker/
RUN chmod +x /opt/docker/*.sh
RUN  cp /opt/docker/ldap.conf /etc/openldap/ldap.conf
RUN  cp /opt/docker/nsswitch.conf /etc/nsswitch.conf
RUN  cp /opt/docker/nslcd.conf /etc/nslcd.conf
RUN  cp /opt/docker/system-auth /etc/pam.d/system-auth
RUN cp /opt/docker/pam_mount.conf.xml /etc/security/pam_mount.conf.xml
RUN cp /opt/docker/sshd_config /etc/ssh/sshd_config
RUN cp /opt/docker/sshd /etc/pam.d/sshd
RUN cp /opt/docker/usuaris /etc/usuaris
RUN cp /opt/docker/access.conf /etc/security/access.conf
WORKDIR /opt/docker
CMD ["/opt/docker/startup.sh"]
