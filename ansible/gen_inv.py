#! /usr/bin/python3

from json import loads

PRIVATE_KEY_FILENAME = 'id_ed25519'

with open('hosts.json', 'r') as jsonfile, open('hosts', 'w') as output:
  ip_addresses = loads(jsonfile.read())
  
  output.write("[servers_1c]\n")
  ip = ip_addresses['_1c_server_external_ip_address']['value']
  output.write(f"1c_srvr ansible_host={ip} ansible_user=ubuntu ansible_ssh_private_key=~/.ssh/{PRIVATE_KEY_FILENAME}\n")
