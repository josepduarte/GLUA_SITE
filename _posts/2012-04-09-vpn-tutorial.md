---
layout: post
title: "VPN da UA"
date: 2013-04-09
excerpt: "Como ligar o computador à VPN da Universidade de Aveiro."
tags: []
tutorial : true
comments: false
author: "Leandro Ricardo"
---


[vpnAdicionar]: {{ site.baseurl }}/assets/img/tutorials/vpn/vpn_adicionar.png
[vpnConfAvancadas]: {{ site.baseurl }}/assets/img/tutorials/vpn/vpn_confavancadas-215x300.png
[vpnConfBasicas]: {{ site.baseurl }}/assets/img/tutorials/vpn/vpn_confbasicas-252x300.png
[vpnMenu]: {{ site.baseurl }}/assets/img/tutorials/vpn/vpn_menu.png
[vpnMenuDepois]: {{ site.baseurl }}/assets/img/tutorials/vpn/vpn_menudepois.png
[vpnTipo]: {{ site.baseurl }}/assets/img/tutorials/vpn/vpn_tipo.png

Neste tutorial pode encontrar informações de como configurar a VPN da Universidade de Aveiro na sua distribuição de GNU/Linux.

<h2>Conteúdos</h2>
+ [Network Manager Applet do Gnome](#networkManager)
+ [Configuração](#configuracao)

## <a name="networkManager"></a>Network Manager Applet do Gnome

Caso o ___Network Manager Applet___ não esteja instalado, necessita de instalar os seguintes componentes (em Ubuntu) de modo a poder usar o Network Manager para criar uma ligação VPN:

~~~shell
network-manager-pptp    #sudo apt-get install network-manager-gnome
~~~

##### Nota:
+ [**Wiki ArchLinux**](https://wiki.archlinux.org/index.php/NetworkManager_(Portugu%C3%AAs))

________________________________

## <a name="configuracao"></a>Configuração

![menu VPN][vpnMenu]

Para poder ligar a VPN com o NetworkManager, tem que, em primeiro lugar, criar uma nova ligação e configurar a VPN. Para fazer isso comece por selecionar a opção “Configurar VPN”, no menu do Network Manager, como indica a figura.

Selecione o botão “Adicionar”.
![adicionar VPN][vpnAdicionar]

Escolha o tipo de ligação como sendo PPTP e faça “Criar”
![tipo VPN][vpnTipo]

As configurações a preencher na janela que aparece são como mostra a figura. O nome de utilizador e _password_ a usar são os mesmos que usa para se ligar à **eduroam**, ou seja, as suas credenciais do utilizador universal.
![conf. basicas VPN][vpnConfBasicas]

É necessário alterar também as configurações avançadas. Pique o botão “Avançadas” e preencha como mostra na figura. Note que apenas o método de autenticação MSCHAPv2 deve estar selecionado na lista. No final faça “OK”.
![conf. avançadas VPN][vpnConfAvancadas]

+ Faça agora “Aplicar”.
+ Na lista de VPNs configuradas no Network Manager deve agora aparecer uma chamada **UA**. Pode fechar a janela.
+ Para terminar tem que reiniciar o Network-Managerger. Uma forma simples de fazer isso é reiniciando o computador.
+ Para ligar-se basta selecionar **UA** no menu do Network Manager, submenu “Ligações VPN”.
+ Para desligar, use a opção “Desligar VPN” do menu anterior, que fica ativa sempre que está ligado à VPN.

![menu após adicionar VPN][vpnMenuDepois]
