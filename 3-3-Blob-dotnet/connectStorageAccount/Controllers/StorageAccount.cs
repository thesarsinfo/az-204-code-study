using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using connectStorageAccount.Repository;
using Microsoft.AspNetCore.Mvc;

namespace connectStorageAccount.Controllers
{
    [ApiController]
    [Route("api/v1/[controller]")]
    public class StorageAccount : ControllerBase
    {
        private readonly IRepository _repository;
        private readonly IStorageAccount _storage;

        public StorageAccount(IRepository repository, IStorageAccount storage)
        {
            _repository = repository;
            _storage = storage;
        }
        [HttpPut("{id}")]        
        public async IActionResult CreateContainer()
        {
            string containerName = "novocontainer" + Guid.NewGuid().ToString();
            await _repository.Create(containerName);
            
            return Created("containerName",containerName);
        }

    }
}