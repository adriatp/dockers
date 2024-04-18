#!/bin/sh

# Function to initialize the database
create_http_srv() {
  # Verificar que se haya proporcionado al menos un argumento
  if [ $# -lt 3 ]; then
    echo "Usage: $0 SRV_IP SRV_PORT SRV_DNS"
    exit 1
  fi

  cat << EOF > /etc/nginx/conf.d/$3.conf
  server {
    listen 80;
    server_name $3;

    location / {
      proxy_pass http://$1:$2;
      proxy_set_header Host \$host;
      proxy_set_header X-Real-IP \$remote_addr;
      proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
      proxy_set_header X-Forwarded-Proto \$scheme;
    }
  }
EOF
}

# SRV_IP="$1"
# SRV_PORT="$2"
# SRV_DNS="$3"
create_http_srv $1 $2 $3
