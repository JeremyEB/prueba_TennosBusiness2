using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAPI2.Models.Request
{
    public class UsuarioRequest
    {
        public string CEDULA { get; set; }
        public string NOMBRES { get; set; }
        public string APELLIDOS { get; set; }
        public string TELEFONO { get; set; }
        public string CORREO { get; set; }
        public string CIUDAD { get; set; }
    }
}
