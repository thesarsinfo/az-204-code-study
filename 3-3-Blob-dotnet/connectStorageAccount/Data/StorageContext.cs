using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Azure.Storage.Blobs;
using Azure.Storage.Blobs.Models;
using connectStorageAccount.Repository;

namespace connectStorageAccount.data
{
    public class StorageContext
    {
        public  BlobServiceClient GetBlobInstance()
        {
            string storageConnection = "azurestring";
            BlobServiceClient blobServiceClient = new (storageConnection);
            return blobServiceClient;
        }
    }
}