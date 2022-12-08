using Azure.Storage.Blobs;
using connectStorageAccount.Repository;
using Microsoft.AspNetCore.Mvc;

namespace connectStorageAccount.Controllers
{
    [ApiController]
    [Route("api/v1/[controller]")]
    public class StorageAccount : ControllerBase
    {
        private readonly IStorageAccount _storage;

        public StorageAccount(IStorageAccount storage)
        {
            _storage = storage;
        }

        [HttpPut]        
        public async Task<IActionResult> CreateContainer()
        {
            string containerName = "novocontainer" + Guid.NewGuid().ToString();
            await _storage.Connect();
            BlobContainerClient teste = await _storage.Create(containerName); 
            string nameContainer = teste.Name;
            Console.WriteLine(teste.Uri);         
            return Created("containerName",nameContainer);
        }
    }
}