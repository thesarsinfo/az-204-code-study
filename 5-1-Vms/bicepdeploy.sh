  rgname='rg-az204cert-eastus2'
  location="eastus2"
  az group create -n $rgname -l $location
  ssh-keygen -m PEM -t rsa -b 4096 -C "vmimage" -f ~/.ssh/vmimage-priv-key -N 'suakeyparagerar'
  idpass="$(cat ~/.ssh/vmimage-priv-key.pub)"
  echo $idpass
  az deployment group create -n vmbicep -g $rgname --template-file VMUbuntu.bicep 
  teste=output.vmuser
  