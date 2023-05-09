using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApplication_LoadGridData
{
    public class DataLayer
    {
        
            private readonly string _connectionString;

            public DataLayer()
            {
                _connectionString = ConfigurationManager.ConnectionStrings["MyDatabase"].ConnectionString;
            }

            public bool CheckLogin(string username, string password)
            {
                bool result = false;

                using (SqlConnection connection = new SqlConnection(_connectionString))
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand("check_login", connection))
                    {
                        command.CommandType = System.Data.CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@p_username", username);
                        command.Parameters.AddWithValue("@p_password", password);
                        command.Parameters.Add("@p_result", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;

                        command.ExecuteNonQuery();

                        int loginResult = (int)command.Parameters["@p_result"].Value;

                        if (loginResult == 1)
                            result = true;
                    }
                }

                return result;
            }

            //public List<SalesAttributes> GetAllSalesRecords()
            //{
            //    List<SalesAttributes> salesRecords = new List<SalesAttributes>();

            //    // Create SQL query to retrieve all sales records
            //    string query = "GetAllSalesRecords";

            //    using (SqlConnection connection = new SqlConnection(_connectionString))
            //    {

            //        // Create SQL command object to execute the stored procedure
            //        SqlCommand command = new SqlCommand(query, connection);
            //        command.CommandType = CommandType.StoredProcedure;

            //        // Open database connection
            //        connection.Open();

            //        // Execute the SQL command and read the data
            //        SqlDataReader reader = command.ExecuteReader();

            //        while (reader.Read())
            //        {
            //            // Create new sales record object and populate its properties from the data reader
            //            SalesAttributes salesRecord = new SalesAttributes();
            //            salesRecord.Region = reader["Region"].ToString();
            //            salesRecord.Country = reader["Country"].ToString();
            //            salesRecord.ItemType = reader["Item Type"].ToString();
            //            salesRecord.SalesChannel = reader["Sales Channel"].ToString();
            //            salesRecord.OrderPriority = reader["Order Priority"].ToString();
            //            salesRecord.OrderDate = reader["Order Date"].ToString();
            //            salesRecord.OrderID = double.Parse(reader["Order ID"].ToString());
            //            salesRecord.ShipDate = reader["Ship Date"].ToString();
            //            salesRecord.UnitsSold = double.Parse(reader["Units Sold"].ToString());
            //            salesRecord.UnitPrice = double.Parse(reader["Unit Price"].ToString());
            //            salesRecord.UnitCost = double.Parse(reader["Unit Cost"].ToString());
            //            salesRecord.TotalRevenue = double.Parse(reader["Total Revenue"].ToString());
            //            salesRecord.TotalCost = double.Parse(reader["Total Cost"].ToString());
            //            salesRecord.TotalProfit = double.Parse(reader["Total Profit"].ToString());

            //            // Add the sales record object to the list
            //            salesRecords.Add(salesRecord);
            //        }

            //        // Close the data reader and database connection
            //        reader.Close();
            //        connection.Close();
            //    }

            //    return salesRecords;
            //}

        public List<SalesAttributes> GetAllSalesRecords(int pageNumber, int pageSize)
        {
            List<SalesAttributes> salesRecords = new List<SalesAttributes>();

            // Create SQL query to retrieve a page of sales records
            string query = "SELECT * FROM [dbo].[Sales_Records] ORDER BY [Order Date] DESC OFFSET @Offset ROWS FETCH NEXT @PageSize ROWS ONLY";

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                // Create SQL command object to execute the query
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Offset", (pageNumber - 1) * pageSize);
                command.Parameters.AddWithValue("@PageSize", pageSize);

                // Open database connection
                connection.Open();

                // Execute the SQL command and read the data
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    // Create new sales record object and populate its properties from the data reader
                    SalesAttributes salesRecord = new SalesAttributes();
                    salesRecord.Region = reader["Region"].ToString();
                    salesRecord.Country = reader["Country"].ToString();
                    salesRecord.ItemType = reader["Item Type"].ToString();
                    salesRecord.SalesChannel = reader["Sales Channel"].ToString();
                    salesRecord.OrderPriority = reader["Order Priority"].ToString();
                    salesRecord.OrderDate = reader["Order Date"].ToString();
                    salesRecord.OrderID = double.Parse(reader["Order ID"].ToString());
                    salesRecord.ShipDate = reader["Ship Date"].ToString();
                    salesRecord.UnitsSold = double.Parse(reader["Units Sold"].ToString());
                    salesRecord.UnitPrice = double.Parse(reader["Unit Price"].ToString());
                    salesRecord.UnitCost = double.Parse(reader["Unit Cost"].ToString());
                    salesRecord.TotalRevenue = double.Parse(reader["Total Revenue"].ToString());
                    salesRecord.TotalCost = double.Parse(reader["Total Cost"].ToString());
                    salesRecord.TotalProfit = double.Parse(reader["Total Profit"].ToString());
                    salesRecord.TotalPages = 100;
                    salesRecord.CurrentPage = pageNumber;

                    // Add the sales record object to the list
                    salesRecords.Add(salesRecord);
                }

                // Close the data reader and database connection
                reader.Close();
                connection.Close();
            }

            return salesRecords;
        }

    }
}