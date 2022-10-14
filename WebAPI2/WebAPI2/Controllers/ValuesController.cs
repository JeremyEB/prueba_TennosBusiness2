using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAPI2.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        public class A
        {
            public string Nombre { get; set; }
        }
        //GET api/Values
        [HttpGet]
        public ActionResult Get()
        {
            using (Models.DB_TRABAJOContext db = new Models.DB_TRABAJOContext())
            {
                var lst = (from d in db.Usuario
                           select d).ToList();
                return Ok(lst);
            }
        }

        //GET api/values/5
        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            return "value";
        }

        // POST api/values
        [HttpPost]
        public void Post([FromBody] string value)
        {

        }

        //PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {

        }

        //Delete api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {

        }
    }
}
