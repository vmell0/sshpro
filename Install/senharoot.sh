#!/bin/bash
clear

executa_instalador() {
    wget -O /etc/ssh/sshd_config https://raw.githubusercontent.com/vmell0/sshpro/main/Install/sshd_config
}

# - Execução
sudo -i
executa_instalador
service ssh restart
clear
echo -ne "\033[1;32mDigite sua nova senha root\033[1;37m: "; read senha
[[ -z "$senha" ]] && {
echo -e "    Calma barboleta, vê se não erra de novo\033"
exit 0
}
echo "root:$senha" | chpasswd
echo -e "    Senha alterada com Sucesso"
exit
