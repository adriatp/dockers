#!/bin/sh

# Function to initialize the database
create_rtmp_srv() {
  cat << EOF > /etc/nginx/conf.d/$3.conf
  rtmp {
    server {
      listen 1935;
      chunk_size 4096;
      
      #Enable live broadcast service
      application live {
        live on;
        record off;
        push $1/$2;
        push $3/$4;
        push $5/$6;
      }
    }
  }
EOF
}

# ODD:   RTMP SERVER
# ODD+1: RESPECTIVE KEY
create_rtmp_srv $1 $2 $3 $4 $5 $6
