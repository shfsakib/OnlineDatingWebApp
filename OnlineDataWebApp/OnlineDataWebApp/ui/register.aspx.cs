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
                    InsertInsertUserDetails();
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
            string userId = func.GenerateId("SELECT MAX(USERID) FROM Users");
            ViewState["UserId"] = userId;
            bool result = false;
            SqlTransaction transaction = null;
            try
            {
                if (con.State != ConnectionState.Open)
                    con.Open();
                transaction = con.BeginTransaction();
                cmd = new SqlCommand("RegisterUser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserId", userId);
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
        internal bool InsertInsertUserDetails()
        {
            bool result = false;
            SqlTransaction transaction = null;
            try
            {
                if (con.State != ConnectionState.Open)
                    con.Open();
                transaction = con.BeginTransaction();
                cmd = new SqlCommand("InsertUserDetails", con);
                cmd.CommandType=CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserId", ViewState["UserId"]);
                cmd.Parameters.AddWithValue("@Picture", "../Resources/images/user.png");
                cmd.Parameters.AddWithValue("@Gender", "Not Added");
                cmd.Parameters.AddWithValue("@Occupation", "Not Added");
                cmd.Parameters.AddWithValue("@Age", "0");
                cmd.Parameters.AddWithValue("@Height", "Not Added");
                cmd.Parameters.AddWithValue("@Weight", "Not Added");
                cmd.Parameters.AddWithValue("@Interest", "Not Added");
                cmd.Parameters.AddWithValue("@Likes", "Not Added");
                cmd.Parameters.AddWithValue("@DisLikes", "Not Added");
                cmd.Parameters.AddWithValue("@Goals", "Not Added");
                cmd.Parameters.AddWithValue("@Commitment", "Not Added");
                cmd.Parameters.AddWithValue("@Description", "Not Added");
                cmd.Parameters.AddWithValue("@Restaurants", "Not Added");
                cmd.Parameters.AddWithValue("@Movies", "Not Added");
                cmd.Parameters.AddWithValue("@Books", "Not Added");
                cmd.Parameters.AddWithValue("@Peoms", "Not Added");
                cmd.Parameters.AddWithValue("@Saying", "Not Added");
                cmd.Parameters.AddWithValue("@Contact", "Not Added");
                cmd.Parameters.AddWithValue("@Address", "Not Added");
                cmd.Parameters.AddWithValue("@City", "Not Added");
                cmd.Parameters.AddWithValue("@State", "Not Added");
                cmd.Parameters.AddWithValue("@Visibility", "Private");

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