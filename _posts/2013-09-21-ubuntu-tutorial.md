---
layout: post
title: "Instalação Ubuntu"
date: 2013-09-21
updated: 2017-09-10
excerpt: "Como instalar Ubuntu (versão 16.04 LTS) em dual boot passo a passo."
tags: []
tutorial : true
comments: false
author: "Leandro Ricardo"
diskparted: 
            - /assets/img/tutorials/ubuntuInstall/disk_1.png
            - /assets/img/tutorials/ubuntuInstall/disk_2.png
            - /assets/img/tutorials/ubuntuInstall/disk_3.png
fastboot: 
            - /assets/img/tutorials/ubuntuInstall/1.png
            - /assets/img/tutorials/ubuntuInstall/2.png
            - /assets/img/tutorials/ubuntuInstall/3.png
            - /assets/img/tutorials/ubuntuInstall/4.png
part:	
            - /assets/img/tutorials/ubuntuInstall/part_0.png
            - /assets/img/tutorials/ubuntuInstall/part_1.png
            - /assets/img/tutorials/ubuntuInstall/part_2.png
install:   
            - /assets/img/tutorials/ubuntuInstall/install_1.png
            - /assets/img/tutorials/ubuntuInstall/install_2.png
            - /assets/img/tutorials/ubuntuInstall/install_3.png
            - /assets/img/tutorials/ubuntuInstall/install_4.png
            - /assets/img/tutorials/ubuntuInstall/install_5.png
            - /assets/img/tutorials/ubuntuInstall/install_6.png

---


>Este guia está otimizado para a versão 16.04 LTS. Algumas imagens podem diferir ligeiramente em futuras versões.
>
>É altamente recomendado a fazer uma cópia de segurança dos seus ficheiros. Se não pretende optar por dual-boot ou está pouco à vontade, considere utilizar uma máquina virtual.

## Conteúdos
1. [Pré-requisitos](#prereq)
   1. [Criando um espaço vazio com o gestor de partições do Windows](#winparted)
   2. [Passos para a criação de um espaço não alocado](#newspace)
2. [Considerações sobre o arranque](#aviso)
   1. [Configurações adicionais para UEFI](#UEFI)
   2. [Mudar ordem de arranque](#neworder)
3. [Instalação](#Instalacao)
   1. [Criação de partições](#newpart)
   2. [Procedimento de Instalação](#install)
4. [Resolução de Problemas](#problemas)
   1. [Computador não arranca](#noboot)
5. [Considerações Finais](#Notas)

## <a name="prereq"></a> Pré-requisitos
1. Ter um meio de instalação (DVD ou USB);
2. Ter uma ligação à Internet (por cabo se possível);
3. Em caso de desejar dual boot é obrigatório o particionamento do disco;

>Multi-boot / Dual-boot: Esquema que permite um computador executar dois (dual) ou mais (multi) sistemas operativos, quando este é ligado.

### <a name="winparted"></a> Criando um espaço vazio com o gestor de partições do Windows 

O desejo da maior parte dos utilizadores é não perder os dados da instalação já existente do Windows. De maneira a eliminar possíveis erros iremos criar um espaço vazio com o “Gestor de discos do Windows” e criar as partições no “Instalador do Ubuntu”.

>Pode fazer a mesma coisa com o instalador do Ubuntu, mas qualquer erro de particionamento poderia dar origem à perda de dados. Este método é menos falível nesse sentido.

No Windows o “Gestor de partições do Windows” permite gerir partições do disco rígido.

Este método é mais seguro para os principiantes porque conseguem à partida, separar um espaço que é independente da instalação do Windows (e portanto sem riscos).

## <a name="newspace"></a> Passos para a criação de um espaço não alocado 

No Windows fazer a combinação de teclas Windows+R.

Escreva diskmgmt.msc e confirmar clicando no botão OK.

[![]({{ page.diskparted[0] }})]({{ page.diskparted[0] }})

Com o botão direito do rato selecione uma partição com espaço (tipicamente, poderá selecionar a partição c:\ ou  caso tenha uma segunda partição d:\) e selecione "reduzir".

[![]({{ page.diskparted[1] }})]({{ page.diskparted[1] }})

>### <a name="shrink_space"></a> Cálculo do valor a reduzir
>+ / : >25GB, onde o sistema e programas estarão localizados
>+ /swap : 4GB ou se pretender hibernação reserve o mesmo tamanho da RAM
>+ /home : tamanho à discrição, equivalente à pasta pessoal no windows
>
>Total a reduzir: Sistema + swap + home

Escreva o valor que deseja em Megabytes(conversão de GB para MB, multiplique o número de GB por 1024) e confirme clicando no botão reduzir.

>Se a partição utilizada estiver fragmentada poderá acontecer o seguinte erro:
>[![]({{ page.diskparted[2] }})]({{ page.diskparted[2] }})
>Nesse caso deverá desfragmentar o disco (com a ferramenta do Windows ou com outra – como o Piriform Defraggler)

Aguarde e depois disso, o espaço em branco foi criado com sucesso!

De seguida, iremos introduzir a média de instalação.

## <a name="aviso"></a> Considerações sobre o arranque
No Windows fazer a combinação de teclas Windows+R.
Escreva POWERCFG.CPL e confirmar clicando no botão OK.
[![]({{ page.fastboot[0] }})]({{ page.fastboot[0] }})

Selecione “Escolher o que fazem os botões para ligar/desligar”.
[![]({{ page.fastboot[1] }})]({{ page.fastboot[1] }})

Selecione “Alterar definições que estão atualmente indisponíveis”
[![]({{ page.fastboot[2] }})]({{ page.fastboot[2] }})

Desmarque a opção “Ativar o arranque rápido”.
[![]({{ page.fastboot[3] }})]({{ page.fastboot[3] }})

Reinicie o computador e entre na BIOS / firmware UEFI.

>Se não sabe entrar na BIOS, [leia este artigo][read].
>
>Em grande parte dos computadores, existe um popup (BBS Popup) que permite mudar a opção de arranque naquela instância. Por exemplo, no caso da Asus essa tecla é o ESC.

### <a name="UEFI"></a> Configurações adicionais para UEFI
>Se o computador for de 2013, ou mais recente, ou se vinha com o windows 8, ou superior, então tem provávelmente UEFI. Se não tem UEFI, salte para o próximo passo. 

Nos últimos anos, um novo sistema de arranque (UEFI) substituiu o antigo (MBR). É necessário ter precauções adicionais se o seu computador tem UEFI.

Para instalar a distribuição Ubuntu num sistema UEFI é recomendado a prestar atenção aos seguintes aspetos (se não estiver presente qualquer um deles, ignore):
1.  Desative na BIOS a opção “Fast Boot” (geralmente na aba “Boot”);
2.  Ative a opção “USB Legacy Emulation” (geralmente na aba “Advanced”);
3.  Desative a opção “Secure Boot” (geralmente na aba “Security”);

### <a name="neworder"></a> Mudar a ordem de arranque
Mude a ordem de arranque (geralmente na aba "Boot")
No fim, não se esqueça de guardar as alterações ("Exit Saving Changes", na aba "Exit").

## <a name="instalacao"></a> Instalação
Logo depois, o programa de instalação surge (normalmente em inglês). Escolha a linguagem que pretende.
[![]({{ page.install[0] }})]({{ page.install[0] }})

Clique nas duas opções (marcadas a laranja na imagem).
> Se estiver a instalar o sistema na universidade, deixe a primeira opção desmarcada.
[![]({{ page.install[1] }})]({{ page.install[1] }})

Quanto ao tipo de instalação, escolha a opção “Mais alguma coisa…”
[![]({{ page.part[0] }})]({{ page.part[0] }})

### <a name="newpart"></a> Criação de partições
De seguida poderá ter uma configuração mais ou menos semelhante com esta. O importante a reter é que apenas irá tocar na parte não alocada.
Este ecrã mostra o espaço livre criado anteriormente no Windows.
[![]({{ page.part[1] }})]({{ page.part[1] }})

Para cada ponto de montagem (/, /swap e /home), clique no botão +, com seleção no espaço livre e preencha os seguintes dados e selecione “OK”:
+ Tamanho: deverá inserir o tamanho determinado em [Cálculo do espaço a reduzir](#shrink_space); Note que neste caso, o utilizador optou por utilizar apenas 20GB.
+ Tipo de nova partição: irrelevante para este caso de aprendizagem.
+ Localização para a nova partição: “Início deste espaço”.
+ Utilizar como: “Sistema de ficheiros Ext4 com journal”, no caso da partição / e /home, ou “Área de swap”, no caso da partição /swap.
+ Mount point: / ou /home ou /swap.
[![]({{ page.part[2] }})]({{ page.part[2] }})

>Nota de extrema importância: Restrinja-se a fazer especificamente o que manda o tutorial.
>
>Como pode verificar, no dispositivo /dev/sda2 encontra-se partição de EFI. Não apague ou modifique essa partição, sob o risco de ficar sem arranque doutro sistema operativo que já esteja instalado no seu computador.
>
>A manipulação das outras partições podem incorrer em perdas de dados.

Comece a instalação, clicando no botão “Instalar agora”. Deverá agora configurar, as várias definições.

### <a name="install"></a> Processo de instalação
Esta parte é mais fácil: após selecionar o botao “Instalar agora”, o setup irá configurar proceder à instalação. Ao mesmo tempo, é pedido ao utilizador que defina várias definições: teclado, fuso horário e fuso horário.

Selecione o fuso horário.
[![]({{ page.install[2] }})]({{ page.install[2] }})

E o esquema do teclado.
[![]({{ page.install[3] }})]({{ page.install[3] }})

Configure o nome de utilizador e a palavra-passe:
[![]({{ page.install[4] }})]({{ page.install[4] }})

Por fim, deverá aguardar a conclusão do setup.
[![]({{ page.install[5] }})]({{ page.install[5] }})




