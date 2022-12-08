using Azure.Storage.Blobs;
using connectStorageAccount.data;

namespace connectStorageAccount.Repository
{
    public class StorageAccountRepository : StorageContext, IStorageAccount
    {
        private readonly StorageContext _storageContext;

        public StorageAccountRepository(StorageContext storageContext)
        {
            _storageContext = storageContext;
        }

        public  async Task Connect()
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