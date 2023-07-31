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
    docker build -t img_server1c -f srv1c.Dockerfile .
    docker build -t img_pg1c -f pg.Dockerfile .
    docker compose up -d
    docker exec containers-postgresql-1 psql -c "alter user postgres with password 'postgres';"
  fi
}

time main "$@"