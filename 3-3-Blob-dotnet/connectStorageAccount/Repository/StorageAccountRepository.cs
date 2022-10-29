using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Azure.Storage.Blobs;
using Azure.Storage.Blobs.Models;
using connectStorageAccount.Controllers;
using connectStorageAccount.data;
using Microsoft.Extensions.Azure;

namespace connectStorageAccount.Repository.ConcreteRepository
{
    public class StorageAccountRepository : IStorageAccount
    {
        private readonly StorageContext _storageContext;

        public StorageAccountRepository(StorageContext storageContext)
        {
            _storageContext = storageContext;
        }
        public async Task Connect()
        {
            _storageContext.GetBlobConnection().GetAwaiter().GetResult();            
        }

        public async Task<BlobContainerClient> Create(string containerName)
        {            
           
            BlobContainerClient containerClient = await _storageContext.GetBlobInstance()
                                                    .CreateBlobContainerAsync(containerName);             
            return containerClient;
        }

        
    }
}