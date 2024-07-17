using System.Data;
using System.Reflection.Metadata.Ecma335;
using Backend_PruebaTecnica.Models;
using Backend_PruebaTecnica.Repository.Interface;
using Microsoft.Data.SqlClient;


namespace Backend_PruebaTecnica.Repository.DAOFactory
{
    public class DAOProduct : ProductInterface
    {

        private readonly string cadena;

        public DAOProduct()
        {
            cadena = new ConfigurationBuilder().AddJsonFile("appsettings.json").Build().GetConnectionString("cn");
        }


        public string DeleteById(int codigo)
        {
            SqlConnection cn = new SqlConnection(cadena);
            int i = 0;
            String mensaje = "";
            cn.Open();

            try
            {
                SqlCommand cmd = new SqlCommand("usp_deleteProducto", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@id_producto", codigo);

                i = cmd.ExecuteNonQuery();

                mensaje = "Producto eliminado satisfacotiramente - Cantidad de filas eliminadas : " + i;
            }
            catch (SqlException e)
            {
                mensaje = e.Message;
                throw;
            }
            finally
            {
                cn.Close();
            }
            return mensaje;
        }

        public IEnumerable<Product> FindAll()
        {
            List<Product> lista = new List<Product>();
            SqlConnection cn = new SqlConnection(cadena);
            SqlCommand cmd = new SqlCommand("usp_findAllProducto", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Product reg = new Product();
                reg.Id = dr.GetInt32(0);
                reg.Name = dr.GetString(1);
                reg.Price = Convert.ToDouble(dr.GetDecimal(2));

                lista.Add(reg);
            }
            dr.Close();
            cn.Close();

            return lista;
        }

        public Product FindById(int codigo)
        {
            var c = FindAll().Where(c => c.Id == codigo).FirstOrDefault()!;
            if (c == null)
                return new Product();
            else
                return c;
        }

        public string Save(Product p)
        {
            SqlConnection cn = new SqlConnection(cadena);
            int i = 0;

            cn.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("usp_saveProducto", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@nombre", p.Name);
                cmd.Parameters.AddWithValue("@precio", p.Price);

                i = cmd.ExecuteNonQuery();

                return  "Producto registrado exitosamente - Cantidad de filas insertadas : " + i;
            }
            catch (SqlException e)
            {
                cn.Close();
                throw;
            }
            finally
            {
                cn.Close();
            }
        }

        public string Update(Product p)
        {
            SqlConnection cn = new SqlConnection(cadena);
            int i = 0;
            string mensaje = "";
            cn.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("usp_updateProducto", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@id_producto", p.Id);
                cmd.Parameters.AddWithValue("@nombre", p.Name);
                cmd.Parameters.AddWithValue("@precio", p.Price);

                i = cmd.ExecuteNonQuery();

                mensaje = "Producto actualizado exitosamente - Cantidad de filas actualizadas : " + i;

            }
            catch (SqlException e)
            {
                mensaje = e.Message;
                cn.Close();
                throw;
            }
            finally
            {
                cn.Close();
            }

            return mensaje;
        }
    }
}
