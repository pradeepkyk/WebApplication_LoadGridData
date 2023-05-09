using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication_LoadGridData
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLoginButton_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            DataLayer dataLayer = new DataLayer();
            bool loginResult = dataLayer.CheckLogin(username, password);

            if (loginResult)
            {
                Session["loggedIn"] = true;
                Response.Redirect("Home.aspx");                
            }
            else
            {
                lblMessage.Text = "Invalid username or password.";
            }
        }
    }
}