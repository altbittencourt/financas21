using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Financas21.Models
{
	[Table("User")]
	public class User
	{
		public int Id { get; set; }
		public string Name { get; set; } = string.Empty;
		public string Password { get; set; } = string.Empty;
	}
}