# Сервер для

![1C docker postgresql](./1s-foto.png "Развертываем сервер для 1С на docker-контейнерах")
---
## Развернуть сервер
Склорировать код себе на компьютер `git clone https://github.com/skoval67/1c_srvrs` <br>
Задать значения переменных <br>
```shell
l2tp_ipsec_PSK: vpn
```
и
```shell
l2tp_ipsec_server_users:
  - { username: *user1*, password: *password1* }
  - { username: user2, password: password2 }
```
в файле `ansible/vars.yaml` и запустить `./start.sh`

## Настроить компьютер клиента
На компьютере клиента добавить строки в файл `\Windows\System32\drivers\etc\hosts`<br>
```shell
172.20.0.3      server1c
172.20.0.5      pg1c
```
Включить поддержку NAT-T в Windows
```shell
Set-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Services\PolicyAgent" -Name "AssumeUDPEncapsulationContextOnSendRule" -Type DWORD -Value 2 –Force
```
Создать VPN-подключение L2TP/IPsec с общим ключом
```shell
Add-VpnConnection -Name "MyVpnName" -ServerAddress 158.160.112.57 -TunnelType L2tp -EncryptionLevel required -AuthenticationMethod MsChapv2 -SplitTunneling -RememberCredential -L2tpPsk vpn -PassThru -Force
Add-VpnConnectionRoute -ConnectionName "MyVpnName" -DestinationPrefix "172.20.0.0/16"
```

Установить соединение
```shell
rasdial myvpnname user1 password1
```
