#!/bin/bash
#
# Script para coleta de informações do sistema
#
# Autor: Luiz Filipe Souza (lsouzadev)
# Versão: 1.1
# Github: https://github.com/lsouzadev/scanfo
#
# LICENSE: MIT
#
filename="info.txt"
echo -e "\n███████╗ ██████╗ █████╗ ███╗   ██╗███████╗ ██████╗ "
echo -e "██╔════╝██╔════╝██╔══██╗████╗  ██║██╔════╝██╔═══██╗"
echo -e "███████╗██║     ███████║██╔██╗ ██║█████╗  ██║   ██║"
echo -e "╚════██║██║     ██╔══██║██║╚██╗██║██╔══╝  ██║   ██║"
echo -e "███████║╚██████╗██║  ██║██║ ╚████║██║     ╚██████╔╝"
echo -e "╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝      ╚═════╝ "
echo -e "//////////////////// Versão 1.1 ////////////////////" | tee -a $filename
echo -e "=================== DADOS DO SISTEMA ALVO ===================" | tee -a $filename
date "+[+] Data e Hora da Coleta: %d/%m/%Y %H:%M" | tee -a $filename
echo -e "[+] Sistema: $(uname)" | tee -a $filename
echo -e "[+] Kernel: $(uname -r)" | tee -a $filename
echo -e "[+] Arquitetura: $(uname -m)" | tee -a $filename
echo -e "[+] Usuário (Nome): $(echo $USER)" | tee -a $filename
echo -e "[+] Usuário (ID): $(id -u)" | tee -a $filename
echo -e "[+] Usuário (Pasta): $(echo $HOME)" | tee -a $filename
echo -e "[+] Endereço IP (Externo/curl/ifconfig.me) : $(curl ifconfig.me)" | tee -a $filename
echo -e "=================== DISPOSITIVOS CONECTADOS ===================" | tee -a $filename
lsusb | tee -a $filename
echo -e "=================== USUARIOS CONECTADOS ===================" | tee -a $filename
w
echo -e "=================== Conexões de Rede ===================" | tee -a $filename
netstat -antup | tee -a $filename
echo -e "=================== Arquivos Abertos ===================" | tee -a $filename
lsof | tee -a $filename
echo -e "=================== Processos do Sistema ===================" | tee -a $filename
ps -elyLF | tee -a $filename
echo -e "=================== Interfaces de Rede ===================" | tee -a $filename
ifconfig -a -v
echo -e "=================== Ultimos Logins ===================" | tee -a $filename
last -adix | tee -a $filename
echo -e "=================== /etc/passwd ===================" | tee -a $filename
cat /etc/passwd | tee -a $filename
echo -e "=================== /etc/groups ===================" | tee -a $filename
cat /etc/groups | tee -a $filename
echo -e "=================== /etc/shadow ===================" | tee -a $filename
cat /etc/shadow | tee -a $filename
echo -e "=================== Crontab ROOT ===================" | tee -a $filename
crontab -u root -l | tee -a $filename
echo -e "=================== Crontab USER ===================" | tee -a $filename
crontab -l | tee -a $filename
echo -e "=================== Espaço em disco ===================" | tee -a $filename
df -h | tee -a $filename
echo -e "=================== Memória RAM ===================" | tee -a $filename
free -h | tee -a $filename
echo -e "=================== Sistema de Arquivos ===================" | tee -a $filename
mount | tee -a $filename
echo -e "=================== Binários SUID/SGID ===================" | tee -a $filename
find / -perm -004000 -o -perm -002000 2>/dev/null | tee -a $filename
echo -e "=================== RootKits? (chkrootkit) ===================" | tee -a $filename
chkrootkit | tee -a $filename
echo -e "=================== Finalizado em $(date '+%d/%m/%Y %H:%M') ===================" | tee -a $filename

clear
cat $filename
