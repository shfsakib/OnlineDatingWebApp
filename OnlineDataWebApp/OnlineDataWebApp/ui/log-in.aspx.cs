using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASLdatingWebApp;
using ASLdatingWebApp;

namespace OnlineDataWebApp.ui
{
    public partial class log_in : System.Web.UI.Page
    {
        private function func;
        private SqlConnection con;
        private SqlCommand cmd;
        private HttpCookie cookie;
        public log_in()
        {
            func = function.GetInstance();
            con = new SqlConnection(func.Connection);
            cookie = function.GetCookie();

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (cookie != null)
                {
                    Response.Redirect("/ui/home.aspx");
                }
                else
                {
                    txtUserName.Focus();
                }
            }
        }

        protected void btnLogin_OnClick(object sender, EventArgs e)
        {
            if (txtUserName.Text == "")
            {
                func.Alert(this, "User name is required", "w", true);
            }
            else if (txtPassword.Text == "")
            {
                func.Alert(this, "Password is required", "w", true);
            }
            else
            {
                DataTable dataTable = new DataTable();
                dataTable = LogIn();
                string password = "";
                foreach (DataRow row in dataTable.Rows)
                {
                    password = row["Password"].ToString();
                }
                if (txtPassword.Text == password)
                {
                    HttpCookie cookie = function.CreateCookie();
                    cookie.Expires = DateTime.Now.AddDays(-1);
                    HttpContext.Current.Response.Cookies.Add(cookie);
                    cookie["Name"] = func.IsExist($"SELECT Name FROM Users WHERE UserName='{txtUserName.Text}'");
                    cookie["UserId"] = func.IsExist($"SELECT UserId FROM Users WHERE UserName='{txtUserName.Text}'");
                    cookie["Email"] = func.IsExist($"SELECT Email FROM Users WHERE UserName='{txtUserName.Text}'");
                    cookie.Expires = DateTime.Now.AddDays(30);
                    Response.Cookies.Add(cookie);
                    Response.Redirect("/ui/home.aspx");
                }
                else
                {
                    func.Alert(this, "Invalid username or passowrd", "e", true);
                }
            }
        }
        internal DataTable LogIn()
        {
            DataTable dataTable = new DataTable();
            SqlDataAdapter adapter;
            string query = "UserLogIn";
            cmd = new SqlCommand(query, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
            con.Open();
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dataTable);
            con.Close();
            return dataTable;
        }
    }
}