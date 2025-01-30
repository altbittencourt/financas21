using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Financas21.Models;
using Microsoft.EntityFrameworkCore;

namespace Financas21
{
	public class ApplicationDbContext : DbContext
	{
		public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
		{

		}

		public DbSet<User> User { get; set; }
	}
}