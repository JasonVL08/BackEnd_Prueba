using Backend_PruebaTecnica.Models;
using Backend_PruebaTecnica.Repository.DAOFactory;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Backend_PruebaTecnica.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [EnableCors("PermitirTodo")]
    public class ProductoController : ControllerBase
    {

       [HttpGet("list")]
       public async Task<ActionResult> findAllProducto()
        {
            var lista = await Task.Run(() => new DAOProduct().FindAll());
            return Ok(lista);
        }

        [HttpPost("save")]
        public async Task<ActionResult> saveProducto(Product m)
        {
            var mensaje = await Task.Run(() => new DAOProduct().Save(m));
            return Ok(mensaje);
        }


        [HttpPut("update")]
        public async Task<ActionResult> updateProducto(Product m)
        {
            var mensaje = await Task.Run(() => new DAOProduct().Update(m));
            return Ok(mensaje);
        }

        [HttpGet("findxid/{codigo}")]
        public async Task<ActionResult> findByIdProducto(int codigo)
        {
            var cliente = await Task.Run(() => new DAOProduct().FindById(codigo));
            return Ok(cliente);
        }

        [HttpDelete("delete/{codigo}")]
        public async Task<ActionResult> deleteByIdProducto(int codigo)
        {
            var mensaje = await Task.Run(() => new DAOProduct().DeleteById(codigo));
            return Ok(mensaje);
        }
    }
}
