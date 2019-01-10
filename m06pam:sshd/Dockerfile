# Version: 0.0.1
# edt M06 2018-2019
# examen
#-------------------------------------------------
FROM edtasixm06/exam:latest
LABEL author="@edt ASIX M06 2018-2019"
LABEL description="examen PAM 2018-2019"
RUN dnf -y install procps vim passwd openldap-clients nss-pam-ldapd pam_mount 
RUN mkdir /opt/docker
COPY * /opt/docker/
RUN chmod +x /opt/docker/*.sh
RUN  cp /opt/docker/ldap.conf /etc/openldap/ldap.conf
RUN  cp /opt/docker/nsswitch.conf /etc/nsswitch.conf
RUN  cp /opt/docker/nslcd.conf /etc/nslcd.conf
RUN  cp /opt/docker/system-auth /etc/pam.d/system-auth
RUN cp /opt/docker/pam_mount.conf.xml /etc/security/pam_mount.conf.xml
RUN bash /opt/docker/install.sh
RUN bash /opt/docker/startup.sh
WORKDIR /opt/docker
CMD ["/opt/docker/startup.sh"]
