#! /bin/bash
# @edt ASIX M06 2018-2019
# instal·lacio 
# - crear usuaris locals
# -------------------------------------------
groupadd locals
groupadd dicts
useradd -g users -G locals pere
useradd -g users -G locals raul
useradd -g users dani
useradd -g users -G locals marta
useradd -g dicts trump
useradd -g dicts puig
useradd -g dicts rajoy
echo "pere" | passwd --stdin pere
echo "raul" | passwd --stdin raul
echo "dani" | passwd --stdin marta
