---
layout: post
title: "VPN da UA"
date: 2013-04-09
excerpt: "Como ligar o computador à VPN da Universidade de Aveiro."
tags: []
tutorial : true
comments: false
author: "Leandro Ricardo"
vpn:
 - /assets/img/tutorials/vpn/vpn_adicionar.png
 - /assets/img/tutorials/vpn/vpn_confavancadas-215x300.png
 - /assets/img/tutorials/vpn/vpn_confbasicas-252x300.png
 - /assets/img/tutorials/vpn/vpn_menu.png
 - /assets/img/tutorials/vpn/vpn_menudepois.png
 - /assets/img/tutorials/vpn/vpn_tipo.png
 
---


[vpnAdicionar]: 		{{page.vpn[0]}}
[vpnConfAvancadas]: {{page.vpn[1]}}
[vpnConfBasicas]: 	{{page.vpn[2]}}
[vpnMenu]: 					{{page.vpn[3]}}
[vpnMenuDepois]: 		{{page.vpn[4]}}
[vpnTipo]: 					{{page.vpn[5]}}

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

[![vpnMenu]]({{page.vpn[3]}})

Para poder ligar a VPN com o NetworkManager, tem que, em primeiro lugar, criar uma nova ligação e configurar a VPN. Para fazer isso comece por selecionar a opção “Configurar VPN”, no menu do Network Manager, como indica a figura.

Selecione o botão “Adicionar”.
[![vpnAdicionar]]({{page.vpn[0]}})

Escolha o tipo de ligação como sendo PPTP e faça “Criar”
[![vpnTipo]]({{page.vpn[5]}})

As configurações a preencher na janela que aparece são como mostra a figura. O nome de utilizador e _password_ a usar são os mesmos que usa para se ligar à **eduroam**, ou seja, as suas credenciais do utilizador universal.
[![vpnConfBasicas]]({{page.vpn[2]}})

É necessário alterar também as configurações avançadas. Pique o botão “Avançadas” e preencha como mostra na figura. Note que apenas o método de autenticação MSCHAPv2 deve estar selecionado na lista. No final faça “OK”.
[![vpnConfAvancadas]]({{page.vpn[1]}})

+ Faça agora “Aplicar”.
+ Na lista de VPNs configuradas no Network Manager deve agora aparecer uma chamada **UA**. Pode fechar a janela.
+ Para terminar tem que reiniciar o Network-Managerger. Uma forma simples de fazer isso é reiniciando o computador.
+ Para ligar-se basta selecionar **UA** no menu do Network Manager, submenu “Ligações VPN”.
+ Para desligar, use a opção “Desligar VPN” do menu anterior, que fica ativa sempre que está ligado à VPN.

[![vpnMenuDepois]]({{page.vpn[4]}})
