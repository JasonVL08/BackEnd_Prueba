using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
namespace Backend_PruebaTecnica.Models

{
    public class Product
    {
        [Key]
        public int? Id { get; set; }

        [Required(ErrorMessage = "The name is required")]
        [StringLength(100, ErrorMessage = "")]
        [DisplayName("Product Name")]
        public string? Name { get; set; }

        [Required(ErrorMessage = "The price is required")]
        [RegularExpression(@"^\$?\d+(\.(\d{2}))?$")]
        public double? Price { get; set; }

    }
}
