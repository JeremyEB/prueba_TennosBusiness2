using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAPI2.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [EnableCors("permitir")]
    public class UsuarioController : ControllerBase
    {
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

        [HttpPost]
        public ActionResult Post([FromBody] Models.Request.UsuarioRequest model)
        {
            using (Models.DB_TRABAJOContext db = new Models.DB_TRABAJOContext())
            {
                Models.Usuario oUsuario = new Models.Usuario();
                oUsuario.Cedula = model.CEDULA;
                oUsuario.Nombres = model.NOMBRES;
                oUsuario.Apellidos = model.APELLIDOS;
                oUsuario.Telefono = model.TELEFONO;
                oUsuario.Correo = model.CORREO;
                oUsuario.Ciudad = model.CIUDAD;
                db.Usuario.Add(oUsuario);
                db.SaveChanges();
            }

            return Ok();
        }

        [HttpPut]
        public ActionResult Put([FromBody] Models.Request.UsuarioEditRequest model)
        {
            using (Models.DB_TRABAJOContext db = new Models.DB_TRABAJOContext())
            {
                Models.Usuario oUsuario = db.Usuario.Find(model.ID_USUARIO);
                oUsuario.Cedula = model.CEDULA;
                oUsuario.Nombres = model.NOMBRES;
                oUsuario.Apellidos = model.APELLIDOS;
                oUsuario.Telefono = model.TELEFONO;
                oUsuario.Correo = model.CORREO;
                oUsuario.Ciudad = model.CIUDAD;
                db.Entry(oUsuario).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                db.SaveChanges();
            }

            return Ok();
        }

        [HttpDelete]
        public ActionResult Delete([FromBody] Models.Request.UsuarioEditRequest model)
        {
            using (Models.DB_TRABAJOContext db = new Models.DB_TRABAJOContext())
            {
                Models.Usuario oUsuario = db.Usuario.Find(model.ID_USUARIO);
                db.Usuario.Remove(oUsuario);
                db.SaveChanges();
            }

            return Ok();
        }
    }
}
