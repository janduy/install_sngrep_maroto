#!/bin/bash

#

# Verifica se o usuário é root
if [[ $EUID -ne 0 ]]; then
   echo "Este script precisa ser executado como root."
   exit 1
fi

# Define o diretório de trabalho
cd /usr/src

# Baixa o pacote RPM do sngrep
wget -q --show-progress https://packages.irontec.com/centos/7/x86_64/sngrep-1.4.9-0.el7.x86_64.rpm

# Instala o pacote RPM
rpm -ivh sngrep-1.4.9-0.el7.x86_64.rpm

# Confirma a instalação
if command -v sngrep &> /dev/null; then
    echo "Sngrep instalado com sucesso!"
else
    echo "Erro na instalação do sngrep."
    exit 1
fi
