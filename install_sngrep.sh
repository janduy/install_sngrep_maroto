#!/bin/bash

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Função para exibir mensagens de erro
error() {
    echo -e "${RED}[ERRO] $1${NC}"
    exit 1
}

# Função para exibir mensagens de sucesso
success() {
    echo -e "${GREEN}[SUCESSO] $1${NC}"
}

# Função para exibir mensagens de informação
info() {
    echo -e "${YELLOW}[INFO] $1${NC}"
}

# Verifica se o usuário é root
if [[ $EUID -ne 0 ]]; then
    error "Este script precisa ser executado como root."
fi

# Verifica se o wget está instalado
if ! command -v wget &> /dev/null; then
    info "Instalando wget..."
    yum install -y wget || error "Falha ao instalar wget"
fi

# Define o diretório de trabalho
cd /usr/src || error "Não foi possível acessar /usr/src"

# Remove arquivo antigo se existir
rm -f sngrep-1.4.9-0.el7.x86_64.rpm

# Baixa o pacote RPM do sngrep
info "Baixando o pacote sngrep..."
wget -q --show-progress https://packages.irontec.com/centos/7/x86_64/sngrep-1.4.9-0.el7.x86_64.rpm || error "Falha ao baixar o pacote sngrep"

# Verifica se o arquivo foi baixado
if [ ! -f sngrep-1.4.9-0.el7.x86_64.rpm ]; then
    error "O arquivo RPM não foi baixado corretamente"
fi

# Instala o pacote RPM
info "Instalando o pacote sngrep..."
rpm -ivh sngrep-1.4.9-0.el7.x86_64.rpm || error "Falha ao instalar o pacote sngrep"

# Confirma a instalação
if command -v sngrep &> /dev/null; then
    success "Sngrep instalado com sucesso!"
    info "Você pode executar 'sngrep' para iniciar o programa"
else
    error "Erro na instalação do sngrep"
fi
