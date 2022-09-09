#!/bin/bash

INFRA_NAME=$1

cp -r TEMPLATE DEPLOYED/${INFRA_NAME}
cd DEPLOYED/${INFRA_NAME}

sed -i "s|<##INFRA_NAME##>|${INFRA_NAME}|g" *

terraform init && terraform apply -auto-approve

cat << EOF
############################################################
############################################################
########                                           #########
########                                           #########
########    Web App Available at : $(cat temp_ip)   #########
########                                           #########
########                                           #########
############################################################
############################################################
EOF

exit
