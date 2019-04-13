using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace App.Data
{
    public class DataContext: DbContext
    {
        public virtual DbSet<Producto> Producto { get; set; }

        public DataContext(DbContextOptions options):base(options)
        {
            
        }

    }
}
