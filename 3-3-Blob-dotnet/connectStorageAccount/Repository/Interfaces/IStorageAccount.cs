using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Azure.Storage.Blobs;

namespace connectStorageAccount.Repository
{

    public interface IStorageAccount 
    {        
        public Task<BlobContainerClient> Create(string containerName);
        public Task Connect();
    }
}