#!/bin/bash
cd /opt/bitnami/nginx/html
mkdir archive
sudo mv index.html archive/
sudo echo "
<h1 style=\"text-align: center;\"><span>Badr says hello from AWS Lightsail!&nbsp;</span><span></span></h1>
<p><span><img src=\"https://media.giphy.com/media/xT9IgG50Fb7Mi0prBC/giphy.gif\" alt=\"\" width=\"400\" height=\"200\" style=\"display: block; margin-left: auto; margin-right: auto;\" /></span></p>
" > index.html
sudo chmod 644 index.html

