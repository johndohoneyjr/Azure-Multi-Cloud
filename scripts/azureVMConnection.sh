#! /bin/bash


echo "This only works with Scale Sets -- an artifact of my experimention"
az vmss list-instances     --resource-group dohoneyrg     --name vmscaleset    --output table
az vmss list-instance-connection-info    --resource-group dohoneyrg     --name vmscaleset   --output table
