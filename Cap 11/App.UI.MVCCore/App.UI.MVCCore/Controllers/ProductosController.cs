using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using App.Data;
using Microsoft.AspNetCore.Mvc;

namespace App.UI.MVCCore.Controllers
{
    public class ProductosController : Controller
    {
        DataContext dbCOntext;
        public ProductosController(DataContext dbCOntext)
        {
            this.dbCOntext = dbCOntext;
        }

        public IActionResult Index()
        {
            var productos = this.dbCOntext.Producto.ToList();
            return View(productos);
        }

       
    }
}