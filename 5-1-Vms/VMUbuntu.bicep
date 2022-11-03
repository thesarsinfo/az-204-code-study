targetScope = 'resourceGroup'
param resource string = 'vm'
param resVnet string = 'vnet'
param resSnet string = 'snet'
param enviroment string = '-dev-az204-'
param region string = resourceGroup().location

param instance string = '-001'
param nameResource string = 'comp'
param vnetName string = '${resVnet}${enviroment}${region}'
param snetName string = '${resSnet}${enviroment}${region}'
param nameVm string = '${resource}${enviroment}${region}'
param computerName string = '${nameResource}${enviroment}${region}${instance}'
@secure()
param identer string 
@secure()
param idpass string
@secure()
param sshvalue string



resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: vnetName
  location: region
  properties: {
    
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/23'
      ]
    }
    subnets: [
      {        
        name: snetName
        properties: {          
          addressPrefix: '10.0.0.0/24'

        }
      }      
    ]
  }
}
resource publicIp 'Microsoft.Network/publicIPAddresses@2022-05-01' = {
  name: 'pip${enviroment}${region}'
  location:region
  sku:{
    name:'Basic'    
  }
  properties:{
    publicIPAllocationMethod:'Dynamic'
    publicIPAddressVersion:'IPv4'
    dnsSettings:{
      domainNameLabel:'dns-${nameVm}'
    }
    idleTimeoutInMinutes:4
    
  }
}
resource cardInterface 'Microsoft.Network/networkInterfaces@2022-05-01' = {
  name:'card'
  location:region
  properties:{
    ipConfigurations:[
      {
        name:'ipconfig'
        properties:{
          subnet:{
            id:virtualNetwork.properties.subnets[0].id
          }
          privateIPAllocationMethod:'Dynamic'
          publicIPAddress:{
            id:publicIp.id
          }
        }
      }      
    ]
    networkSecurityGroup:{
      id:nsg.id
    }
  }
}
resource nsg 'Microsoft.Network/networkSecurityGroups@2022-05-01' = {
  name:'nsg${nameVm}'
  location: region
  properties:{
    securityRules:[
      {
        name:'ssh'
        properties:{
          sourcePortRange:'*'
          destinationPortRange: '22'
          sourceAddressPrefix:'*'
          destinationAddressPrefix:'*'
          access: 'Allow'
          priority: 1010
          direction: 'Inbound'
          sourcePortRanges:[]
          destinationPortRanges:[]
          sourceAddressPrefixes:[]
          destinationAddressPrefixes:[]
          protocol: 'Tcp'
        }

      }
      {
        name:'HTTPS'
        properties:{
          protocol:'Tcp'
          sourcePortRange:'*'
          destinationPortRange: '443'
          sourceAddressPrefix:'*'
          destinationAddressPrefix:'*'
          access: 'Allow'
          priority: 1020
          direction: 'Inbound'
          sourcePortRanges:[]
          destinationPortRanges:[]
          sourceAddressPrefixes:[]
          destinationAddressPrefixes:[]
          
        }
      }
      {
        name:'Collector'
        properties:{
          protocol:'Udp'
          sourcePortRange:'*'
          destinationPortRange: '3000'
          sourceAddressPrefix:'*'
          destinationAddressPrefix:'*'
          access: 'Allow'
          priority: 103
          direction: 'Inbound'
          sourcePortRanges:[]
          destinationPortRanges:[]
          sourceAddressPrefixes:[]
          destinationAddressPrefixes:[]
          
        }        
      }
      {
        name:'nginx'
        properties:{
          protocol:'Tcp'
          sourcePortRange:'*'
          destinationPortRange: '80'
          sourceAddressPrefix:'*'
          destinationAddressPrefix:'*'
          access: 'Allow'
          priority: 1000
          direction: 'Inbound'
          sourcePortRanges:[]
          destinationPortRanges:[]
          sourceAddressPrefixes:[]
          destinationAddressPrefixes:[]
        }
      }
    ]
  }
}




resource ubuntuVM 'Microsoft.Compute/virtualMachines@2020-12-01' = {
  name: nameVm
  location: region
  
  properties: {
    
    hardwareProfile: {      
      vmSize: 'Standard_B1ms'

    }
    osProfile: {
      computerName: computerName
      adminUsername: identer     
      adminPassword: idpass 
      linuxConfiguration:{
        disablePasswordAuthentication:true
        ssh:{
          publicKeys:[
            {
              path:'/home/${identer}/.ssh/authorized_keys'
              keyData:sshvalue
            }
          ]
        }
      }
    }
    storageProfile: {    
      osDisk:{
        createOption: 'FromImage'
        managedDisk:{
          storageAccountType:'Standard_LRS'          
        }
        diskSizeGB:32
      }
      imageReference: {
        publisher: 'Canonical'
        offer: 'UbuntuServer'
        sku: '18.04-LTS'
        version: 'latest'
      }     
    }    
    networkProfile:{
      networkInterfaces:[
        {
          
          id:cardInterface.id
        }
      ]
    }
  }
}

output vmuser string = ubuntuVM.properties.osProfile.adminUsername
output dns string = publicIp.properties.dnsSettings.domainNameLabel
