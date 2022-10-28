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
        public async Task<BlobContainerClient> Create(string containerName)
        {
            StorageContext storageContext = new();
            BlobServiceClient blobServiceClient = storageContext.GetBlobInstance();
            BlobContainerClient containerClient = await blobServiceClient            
                                                            .CreateBlobContainerAsync(containerName);
            return containerClient;
        }

        
    }
}