Сервер для **1С**
---
![1C docker postgresql](./1s-foto.png "Развертываем сервер для 1С на docker-контейнерах")
---
Добавить строки в файл `\Windows\System32\drivers\etc\hosts`<br>
172.20.0.3      server1c<br>
172.20.0.5      pg1c

Создать VPN-подключение L2TP/IPsec с общим ключом
`Add-VpnConnection -Name "MyVpnName" -ServerAddress 158.160.112.57 -TunnelType L2tp -EncryptionLevel required -AuthenticationMethod MsChapv2 -SplitTunneling -RememberCredential -L2tpPsk vpn -PassThru -Force`

`Add-VpnConnectionRoute -ConnectionName "MyVpnName" -DestinationPrefix "172.20.0.0/16"`

Установить соединение
`rasdial myvpnname user1 password1`
