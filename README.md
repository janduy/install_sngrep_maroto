# Instalação do Sngrep para CentOS 7 (RPM)

Este repositório fornece um script de instalação automatizado do **Sngrep** para sistemas baseados em **CentOS 7** que não conseguem mais instalar pacotes via `yum` devido a repositórios descontinuados.

## Como usar

Para instalar o **Sngrep** de forma rápida e fácil, basta executar o seguinte comando:

```bash
curl -sSL https://raw.githubusercontent.com/janduy/install_sngrep_maroto/main/install_sngrep.sh | sudo bash
```

### Requisitos
- Sistema operacional baseado em **CentOS 7**.
- Permissões de **root** para instalação do pacote RPM.
- Conectividade com a internet para baixar o script.

## O que o script faz?
1. Baixa o pacote RPM do Sngrep diretamente do repositório Irontec.
2. Instala o pacote automaticamente no sistema.
3. Verifica se a instalação foi bem-sucedida.

## Testando a Instalação
Após a execução do script, verifique se o **Sngrep** foi instalado corretamente rodando:

```bash
sngrep
```

Se o comando abrir a interface do Sngrep, a instalação foi realizada com sucesso! ✅

## Problemas e Soluções
- **Erro de permissão**: Certifique-se de estar executando como root com `sudo`.
- **Pacote não encontrado**: Verifique sua conexão com a internet.

Caso encontre outros problemas, abra uma issue no repositório! 🚀

