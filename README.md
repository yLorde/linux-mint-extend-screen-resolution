# Linux Mint Extend Screen Resolution

Script simples para adicionar resoluções customizadas no Linux Mint usando `xrandr`.

Ideal para monitores, TVs, adaptadores HDMI, máquinas virtuais ou displays que não detectam automaticamente determinadas resoluções.

---

## Funcionalidades

* Adiciona resoluções customizadas automaticamente
* Suporte para múltiplas resoluções
* Detecta o monitor automaticamente
* Usa `cvt` para gerar modelines corretamente
* Compatível com Linux Mint, Ubuntu e distribuições baseadas em Debian

---

## Requisitos

Instale o `x11-xserver-utils` caso ainda não tenha:

```bash
sudo apt install x11-xserver-utils
```

O `cvt` normalmente já vem instalado, mas caso não:

```bash
sudo apt install xserver-xorg-core
```

---

## Como usar

Clone o repositório:

```bash
git clone https://github.com/yLorde/linux-mint-extend-screen-resolution.git
cd linux-mint-extend-screen-resolution
```

Dê permissão de execução:

```bash
chmod +x extend-resolution.sh
```

Execute:

```bash
./extend-resolution.sh
```

---

# Como funciona

O script:

1. Detecta o monitor conectado
2. Gera automaticamente a modeline usando `cvt`
3. Cria um novo modo com `xrandr --newmode`
4. Adiciona o modo ao monitor
5. Aplica a nova resolução

---

# Exemplo manual

O Linux permite criar resoluções customizadas usando `xrandr` e `cvt`. ([WhatIsMyScreenResolution.info][1])

Exemplo:

```bash
cvt 1920 1080 60

xrandr --newmode "1920x1080_60.00" ...
xrandr --addmode HDMI-1 1920x1080_60.00
xrandr --output HDMI-1 --mode 1920x1080_60.00
```

---

# Estrutura esperada do script

```bash
./extend-resolution.sh
```

# Exemplo de saída

```bash
Monitor detectado: HDMI-1
Criando resolução 1920x1080 @ 60Hz...
Resolução aplicada com sucesso.
```

---

# Possíveis problemas

## `cannot find output`

Verifique os monitores disponíveis:

```bash
xrandr
```

## Tela preta

Alguns monitores não suportam determinadas frequências ou resoluções.

Tente:

* reduzir o Hz
* usar resolução nativa
* reiniciar o display manager

---

# Compatibilidade

* Linux Mint
* Ubuntu
* Debian
* X11

---

# Referências

* xrandr
* cvt
* Linux Mint Display Settings
* Arch Wiki xrandr

[1]: https://whatismyscreenresolution.info/blog/how-to-change-the-screen-resolution-on-linux/?utm_source=chatgpt.com "How to Change the Screen Resolution on Linux"
