main () {
  terraform apply -auto-approve
  if [ $? -ne 0 ]
  then
    exit 1
  fi
  terraform output -json > ansible/hosts.json

  cd ansible/ && ./gen_inv.py
  ansible-playbook playbook.yml
  
  if [ $? -eq 0 ]
  then
    cd ../containers
    docker compose up -d --build
  fi
}

time main "$@"