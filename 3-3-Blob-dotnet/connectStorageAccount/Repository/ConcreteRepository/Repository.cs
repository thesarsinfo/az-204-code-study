using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Azure.Storage.Blobs;
using connectStorageAccount.Controllers;
using connectStorageAccount.data;

namespace connectStorageAccount.Repository.ConcreteRepository
{

    
    public class Repository : StorageAccountRepository, IRepository, IStorageAccount
    {
        
        
    }
}