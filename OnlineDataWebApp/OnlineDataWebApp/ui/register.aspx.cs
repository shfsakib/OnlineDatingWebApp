using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASLdatingWebApp;

namespace OnlineDataWebApp.ui
{
    public partial class register : System.Web.UI.Page
    {
        private function func;
        private SqlConnection con;
        private SqlCommand cmd;
        public register()
        {
            func = function.GetInstance();
            con = new SqlConnection(func.Connection);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                con = new SqlConnection(func.Connection);
            }
        }

        private bool IsUserNameExist()
        {
            bool ans = false;
            string x = func.IsExist($"SELECT UserName FROM Users WHERE UserName='{txtUserName.Text}'");
            if (x != "")
            {
                ans = true;
            }
            return ans;
        }
        private bool IsEmailExist()
        {
            bool ans = false;
            string x = func.IsExist($"SELECT Email FROM Users WHERE Email='{txtEmail.Text}'");
            if (x != "")
            {
                ans = true;
            }
            return ans;
        }
        protected void btnRegister_OnClick(object sender, EventArgs e)
        {
            if (txtUserName.Text == "")
            {
                func.Alert(this, "User name is required", "w", true);
            }
            else if (IsUserNameExist())
            {
                func.Alert(this, "User name already exist", "w", true);
            }
            else if (txtFullName.Text == "")
            {
                func.Alert(this, "Full name is required", "w", true);
            }
            else if (txtEmail.Text == "")
            {
                func.Alert(this, "Email is required", "w", true);
            }
            else if (IsEmailExist())
            {
                func.Alert(this, "Email already exist", "w", true);
            }
            else if (txtPassword.Text == "")
            {
                func.Alert(this, "Password is required", "w", true);
            }
            else
            {
                bool ans = Insert();
                if (ans)
                {
                    func.Alert(this, "Registered successfully", "s", true);
                    txtUserName.Text = txtFullName.Text = txtEmail.Text = txtPassword.Text = "";
                }
                else
                {
                    func.Alert(this, "Failed to register", "w", true);
                }

            }
        }
        internal bool Insert()
        {
            bool result = false;
            SqlTransaction transaction = null;
            try
            {
                if (con.State != ConnectionState.Open)
                    con.Open();
                transaction = con.BeginTransaction();
                cmd = new SqlCommand("RegisterUser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
                cmd.Parameters.AddWithValue("@FullName", txtFullName.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@RegTime", func.Date());
                cmd.Parameters.AddWithValue("@UserStatus", 'A');

                cmd.Transaction = transaction;
                cmd.ExecuteNonQuery();
                transaction.Commit();
                result = true;
                if (con.State != ConnectionState.Closed)
                    con.Close();
            }
            catch (Exception ex)
            {
                transaction.Rollback();
            }
            return result;
        }
    }
}