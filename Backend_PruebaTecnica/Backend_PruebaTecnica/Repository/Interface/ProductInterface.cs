using Backend_PruebaTecnica.Models;

namespace Backend_PruebaTecnica.Repository.Interface
{
    public interface ProductInterface
    {
        IEnumerable<Product> FindAll();
        Product FindById(int codigo);
        string Save(Product p);
        string Update(Product p);
        string DeleteById(int codigo);
    }
}
