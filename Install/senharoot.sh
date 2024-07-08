#!/bin/bash
clear

# - Cores
RED='\033[1;31m'
YELLOW='\033[1;33m'
SCOLOR='\033[0m'

function executa_instalador() {
    wget -O /etc/ssh/sshd_config https://raw.githubusercontent.com/vmell0/sshpro/main/Install/sshd_config
}

# - Execução
sudo -i
executa_instalador
service ssh restart > /dev/null
clear
echo -ne "\033[1;32mDigite sua nova senha root\033[1;37m: "; read senha
[[ -z "$senha" ]] && {
echo -e "\n\033[1;31mCalma barboleta, vê se não erra de novo\033[0m"
exit 0
}
echo "root:$senha" | chpasswd
echo -e "\n\033[1;31m[ \033[1;33mSenha alterada com Sucesso\033[0m"
sleep 4s
echo -e "\n\033[1;31m[ \033[1;33mServidor será reiniciado\033[0m"
sleep 4s
reboot