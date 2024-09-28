public class crud
{
    private string cadena = "cadena de conexión!";

    public DataSet Select(string consulta)
    {
        DataSet dataset = new DataSet();

        try
        {
            using (SqlConnection conexion = new SqlConnection(cadena))
            {
                conexion.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(consulta, conexion);

                adapter.Fill(dataSet);
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine("Ha ocurrido un error:  " + ex.Message);
        }
        return dataset;
    }
    public int InsertUpdateDelete(string consulta)
    {
        int cantidad = 0;
        try
        {
            using (SqlConnection conexion = new SqlConnection(cadena))
            {
                conexion.Open();
                SqlCommand comando = new SqlCommand(consulta, conexion);
                cantidad = (int)comando.ExecuteNonQuery();
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine("Ha ocurrido un error:  " + ex.Message);
        }
        return cantidad;
    }


    public int GetRowCount(string tabla, string whereAndJoin)
    {
        int cantidad = 0;

        try
        {
            string query = "SELECT COUNT(*) FROM " + tabla + " " + whereAndJoin;
            using (SqlConnection conexion = new SqlConnection(cadena))
            {
                conexion.Open();
                SqlCommand comando = new SqlCommand(query, conexion);
                cantidad = (int)comando.ExecuteScalar();
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine("Ha ocurrido un error:  " + ex.Message);
        }
        return cantidad;
    }
}