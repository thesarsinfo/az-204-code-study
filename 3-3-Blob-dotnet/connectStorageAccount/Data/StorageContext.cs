using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Azure.Storage.Blobs;
using Azure.Storage.Blobs.Models;

namespace connectStorageAccount.data
{
    public class StorageContext
    {
        public  async Task<BlobServiceClient> ProcessAsync()
        {
            string storageConnection = "azurestring";
            BlobServiceClient blobServiceClient = new (storageConnection);
            return blobServiceClient;
        }
    }
}