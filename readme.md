Сервер для **1С**
---
![Tux, the Linux mascot](./1s-foto.png)

На компьютере клиента
Добавить строки в файл `\Windows\System32\drivers\etc\hosts`
`172.20.0.3      server1c
172.20.0.5      pg1c`

Создать VPN-подключение L2TP/IPsec с общим ключом
`Add-VpnConnection -Name "MyVpnName" -ServerAddress 158.160.112.57 -TunnelType L2tp -EncryptionLevel required -AuthenticationMethod MsChapv2 -SplitTunneling -RememberCredential -L2tpPsk vpn -PassThru -Force`

`Add-VpnConnectionRoute -ConnectionName "MyVpnName" -DestinationPrefix "172.20.0.0/16"`

Установить соединение
`rasdial myvpnname user1 password1`