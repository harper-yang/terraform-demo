#!/usr/bin/env bash

cat > index.html <<-EOF
    <h1>Hello, World</h1>
    <p>DB address: ${var.address}</p>
    <p>DB port: ${var.port}</p>
EOF

nohup busybox httpd -f -p "${var.webserver_port}" &
