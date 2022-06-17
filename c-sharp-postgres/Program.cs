using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Npgsql;

namespace c_sharp_postgres
{
    public class Program
    {
        // Obtain connection string information from the portal
        //
        private static string Host = "localhost";
        private static string User = "postgres";
        private static string DBname = "db_test";
        private static string Password = "postgres";
        private static string Port = "5432";

        static void Main(string[] args)
        {
            // Build connection string using parameters from portal
            //
            string connString =
                String.Format(
                    "Server={0};Username={1};Database={2};Port={3};Password={4};SSLMode=Prefer",
                    Host,
                    User,
                    DBname,
                    Port,
                    Password);


            using (var conn = new NpgsqlConnection(connString))

            {
                Console.Out.WriteLine("Opening connection");
                conn.Open();

                // LISTAR OS PRODUTOS DO CLIENTE JOAO
                using (var command = new NpgsqlCommand(@"
                    SELECT 
                      c.nome as cliente,
                      p.nome,
                      p.valor
                    FROM cliente c
                    INNER JOIN produto p
                      ON p.cpf_cliente = c.cpf
                    WHERE p.cpf_cliente = '12345678901'
                ", conn))
                {

                    var reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        Console.WriteLine(
                            string.Format(
                                "Reading from table=({0}, {1}, {2})",
                                reader.GetString(0),
                                reader.GetString(1),
                                reader.GetDouble(2).ToString().Replace(',', '.')
                                )
                            );
                    }
                    reader.Close();
                }
            }

            Console.WriteLine("Press RETURN to exit");
            Console.ReadLine();
        }
    }
}