using System;
using System.Collections.Generic;

namespace WebAPI2.Models
{
    public partial class Usuario
    {
        public int IdUsuario { get; set; }
        public string Cedula { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string Telefono { get; set; }
        public string Correo { get; set; }
        public string Ciudad { get; set; }
        public DateTime? FechaRegistro { get; set; }
    }
}
