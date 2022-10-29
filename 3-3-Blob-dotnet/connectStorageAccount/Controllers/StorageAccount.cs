using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Azure.Storage.Blobs;
using connectStorageAccount.Repository;
using Microsoft.AspNetCore.Mvc;

namespace connectStorageAccount.Controllers
{
    [ApiController]
    [Route("api/v1/[controller]")]
    public class StorageAccount : ControllerBase
    {
        private readonly IRepository _repository;       

        public StorageAccount(IRepository repository)
        {
            _repository = repository;
        }

        [HttpPut]        
        public async Task<IActionResult> CreateContainer()
        {
            string containerName = "novocontainer" + Guid.NewGuid().ToString();
            BlobContainerClient teste = await _repository.Create(containerName); 
            string nameContainer = teste.Name;           
            return Created("containerName",nameContainer);
        }

    }
}