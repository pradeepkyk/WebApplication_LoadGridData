using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication_LoadGridData
{
    public partial class AllCustomers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //EnablePageMethods = "true";
        }

        [System.Web.Services.WebMethod]
        public static string GetSalesRecords(int pageNumber, int pageSize)
        {
            DataLayer salesRecords = new DataLayer();
            List<SalesAttributes> allSalesRecords = salesRecords.GetAllSalesRecords(pageNumber, pageSize);

            JavaScriptSerializer serializer = new JavaScriptSerializer();
            string json = serializer.Serialize(allSalesRecords);

            return json;
        }
    }
}