---
layout: post
title: "Acesso à rede sem fios (Eduroam)"
date: 2013-04-08
excerpt: "Como configurar a rede eduroam na sua distribuição GNU/Linux."
tags: []
tutorial : true
comments: false
author: "Leandro Ricardo"
---

<style>
  table{
      border-collapse: collapse;
      border-spacing: 0;
      border:2px solid #000000;
      text-align: center;
  }

  th{
      border:2px solid #000000;
  }

  td{
      border:1px solid #000000;
  }
</style>

[ubuntuInternetIcon]: {{ site.baseurl }}/assets/img/tutorials/eduroam/unity-1.png
[ubuntuInternetMenu]: {{ site.baseurl }}/assets/img/tutorials/eduroam/unity-2.png
[ubuntuInternetLoad]: {{ site.baseurl }}/assets/img/tutorials/eduroam/unity-3.png
[ubuntuInternetLoad]: {{ site.baseurl }}/assets/img/tutorials/eduroam/unity-4.png

[gnomeInternetIcon]: {{ site.baseurl }}/assets/img/tutorials/eduroam/gnome3-1.png
[gnomeInternetMenu]: {{ site.baseurl }}/assets/img/tutorials/eduroam/gnome3-2.png
[gnomeInternetLoad]: {{ site.baseurl }}/assets/img/tutorials/eduroam/gnome3-3.png

[kdeInternetIcon]: {{ site.baseurl }}/assets/img/tutorials/eduroam/kde-1.png
[kdeInternetMenu]: {{ site.baseurl }}/assets/img/tutorials/eduroam/kde-2.png
[kdeInternetLoad]: {{ site.baseurl }}/assets/img/tutorials/eduroam/kde-3.png

Neste tutorial pode encontrar informações de como configurar a rede eduroam na sua distribuição de GNU/Linux.


  <h2>Conteúdos</h2>
  + [Certificados](#certificados)
  + [Unity](#unity)
  + [Gnome 3](#gnome3)
  + [KDE](#kde)
  + [Linha de Comandos](#commandLine)

## <a name="certificados"></a>Certificados

Para poder conectar-se a rede **eduroam** vai ser preciso indicar um certificado de autentificação, cujo o seu destino e ficheiro pode diferir para as diferentes distribuições GNU/LINUX. Assim sendo pode confirmar na seguinte tabela qual é o caminho e ficheiro para as diferentes distribuições:

Para poder conectar-se à rede **eduroam** é necessário indicar um certificado de autentificação, cuja a sua localização difere para as diferentes distribuições GNU/LINUX. Assim sendo, pode confirmar na seguinte tabela qual é o caminho do ficheiro para as diferentes distribuições.

|            Distribuição             |                  Ficheiro a selecionar                   |
|:-----------------------------------:|:--------------------------------------------------------:|
| **Debian/Ubuntu/Gentoo/Arch Linux** | **CA Certificate**: _/etc/ssl/certs/ca-certificates.crt_ |
| **Fedora/RHEL**                     | **CA Certificate**: _/etc/pki/tls/certs/ca-bundle.crt_   |
| **openSUSE/SLE**                    | **CA Certificate**: _/etc/ssl/ca-bundle.pem_             |


________________________________

## <a name="unity"></a>Unity

No canto superior direito deve selecionar o ícone de rede ![menu wireless][ubuntuInternetIcon]
De seguida preencher os campos com os seguintes dados:


:---------------------: |:--------------------:
Wireless Security       | WPA&WPA2 Enterprise
Autentication           | Protected EAP (PEAP)
Anonymous Identity      |                     
CA certificate          | [Ver na tabela dos Certificados](#Certificados)  
PEAP version            | Version 0           
Inner authentication    | MSCHAPv2            
Username                | mail@ua.pt          
Password                | *****

![campos a ser preenchidos][ubuntuInternetMenu]

Depois de preencher todos os campos, conforme foi referido anteriormente, basta proceder a conexão e esperar
![verificação dos dados][ubuntuInternetLoad]

Após os dados serem validados irá receber a seguinte mensagem de ligação concluída com sucesso:
![conexão efetuada com sucesso][ubuntuInternetLoad]

________________________________

## <a name="gnome3"></a> Gnome3

No canto superior direito, como no [Unity](##Unity), deve selecionar o ícone de rede ![menu wireless][gnomeInternetIcon]

Após selecionar a rede **eduroam** deverá preencher os dados como na secção do [Unity](##Unity).

![campos a ser preenchidos][gnomeInternetMenu]

Depois de confirmar basta aguardar a validação de dados.

![conexão efectuada com sucesso][gnomeInternetLoad]

________________________________

## <a name="kde"></a> KDE

No canto inferior direito selecionar o ícone de rede. ![menu wireless][kdeInternetIcon]

Após selecionar a rede **eduroam** deverá preencher os dados como nas secções anteriores. (ex: [Unity](##Unity))

![campos a ser preenchidos][kdeInternetMenu]

Despois de confirmar os dados inseridos os dados serão validados e terá a conexão com a rede **eduroam**.

![conexão efectuada com sucesso][kdeInternetLoad]

________________________________

## <a name="commandLine"></a> Linha de Comandos

##### (**Atenção: Apenas para utilizadores com experiência..**)
Caso prefira conectar-se a rede **eduroam** utilizando a consola siga os seguintes passos:

1 - Criar o ficheiro eduroam.conf e guardar o mesmo na home (~):

```bash
trl_interface=/var/run/wpa_supplicant

eapol_version=1
ap_scan=1
fast_reauth=1

network={
        ssid="eduroam"
        scan_ssid=1
        key_mgmt=WPA-EAP
        pairwise=CCMP TKIP
        group=CCMP TKIP
        eap=PEAP
        phase2="auth=MSCHAPV2"
        ca_cert="SUBSTITUIR"		# localização do ficheiro de certificados
        identity="UTILIZADOR@ua.pt"	# Substituir pelas vossas
        password="**********"		# credenciais de acesso
}
```

2 - Alterar o texto ***SUBSTITUIR*** para o certificado de acordo com a sua distribuição
##### Consultar a secção dos [certificados](#certificados)

```bash
ca_cert="SUBSTITUIR"
```

3 - De seguida, execute o seguinte comando

```bash
sudo wpa_supplicant -i wlan0 -c/home/$USERNAME/eduroam.conf
```

4 - Por fim será necessário fazer um pedido ao servidor de DHCP também como súper-utilizador(___root___). Para tal, abrir outra consola e escrever:

```bash
sudo dhclient wlan0
```

Foi usado o cliente de DHCP dhclient (típico de Debian/Ubuntu/Fedora), mas poderia ser usado qualquer outro à escolha, por exemplo, o dhcpcd (típico de ArchLinux/Gentoo).

##### Nota:
Caso tenha problemas de "_disconnects_", ou problemas de obter um endereço IP, na distribuição ArchLinux adicione a seguinte linha na secção _main_ do ficheiro _NetoworkManager.conf_ que se encontra em */etc/NetoworkManager/NetoworkManager.conf*

```bash
DHCP = dhclient
```

##### Nota: caso não se deseje abrir outra consola, pode-se executar o _wpa_supplicant_ em segundo plano usando:

~~~bash
sudo wpa_supplicant -i wlan0 -c/home/$USERNAME/eduroam.conf -B
~~~

Pronto, tem a sua distribuição configurada!
