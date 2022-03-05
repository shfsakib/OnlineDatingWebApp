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
    public partial class profile : System.Web.UI.Page
    {
        private function func;
        private SqlConnection con;
        private SqlCommand cmd;
        Random random = new Random();
        public profile()
        {
            func = function.GetInstance();
            con = new SqlConnection(func.Connection);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                func.CheckCookies();
                LoadData();
            }
        }

        private void LoadData()
        {

            ViewState["pic"] = func.IsExist($"SELECT PICTURE FROM USERDETAILS WHERE USERID='{func.UserIdCookie()}'");
            profileImg.Src = ViewState["pic"].ToString();
            lblFullName.InnerText = txtName.Text = func.IsExist($"SELECT FullName FROM Users WHERE USERID='{func.UserIdCookie()}'");
            lblOccupation.Text = txtOccupation.Text = func.IsExist($"SELECT Occupation FROM USERDETAILS WHERE USERID='{func.UserIdCookie()}'");
            lblAge.Text = txtAge.Text = func.IsExist($"SELECT Age FROM USERDETAILS WHERE USERID='{func.UserIdCookie()}'");
            lblHeight.Text = txtHeight.Text = func.IsExist($"SELECT Height  FROM USERDETAILS WHERE USERID='{func.UserIdCookie()}'");
            lblWeight.Text = txtWeight.Text = func.IsExist($"SELECT Weight  FROM USERDETAILS WHERE USERID='{func.UserIdCookie()}'");
            lblInterest.Text = txtInterest.Text = func.IsExist($"SELECT Interest FROM USERDETAILS WHERE USERID='{func.UserIdCookie()}'");
            lblLikes.Text = txtLikes.Text = func.IsExist($"SELECT Likes FROM USERDETAILS WHERE USERID='{func.UserIdCookie()}'");
            lblDislikes.Text = txtDislikes.Text = func.IsExist($"SELECT Dislikes FROM USERDETAILS WHERE USERID='{func.UserIdCookie()}'");
            lblGoal.Text = txtGoal.Text = func.IsExist($"SELECT Goals FROM USERDETAILS WHERE USERID='{func.UserIdCookie()}'");
            lblCommitment.Text = func.IsExist($"SELECT Commitment FROM USERDETAILS WHERE USERID='{func.UserIdCookie()}'");
            if (lblCommitment.Text != "Not Added")
            {
                ddlCommitment.Text = lblCommitment.Text;
            }
            lblGender.Text = func.IsExist($"SELECT Gender FROM USERDETAILS WHERE USERID='{func.UserIdCookie()}'");
            if (lblGender.Text != "Not Added")
            {
                ddlGender.Text = lblGender.Text;
            }
            lblDescription.Text = txtDescription.Text = func.IsExist($"SELECT Description FROM USERDETAILS WHERE USERID='{func.UserIdCookie()}'");
            lblRestaurant.Text = txtRestaurant.Text = func.IsExist($"SELECT Restaurants FROM USERDETAILS WHERE USERID='{func.UserIdCookie()}'");
            lblMovie.Text = txtMovie.Text = func.IsExist($"SELECT Movies FROM USERDETAILS WHERE USERID='{func.UserIdCookie()}'");
            lblBooks.Text = txtBooks.Text = func.IsExist($"SELECT Books FROM USERDETAILS WHERE USERID='{func.UserIdCookie()}'");
            lblPoem.Text = txtPoem.Text = func.IsExist($"SELECT Poems  FROM USERDETAILS WHERE USERID='{func.UserIdCookie()}'");
            lblSaying.Text = txtSaying.Text = func.IsExist($"SELECT Saying FROM USERDETAILS WHERE USERID='{func.UserIdCookie()}'");
            lblEmail.Text = txtEmail.Text = func.IsExist($"SELECT Email FROM Users WHERE USERID='{func.UserIdCookie()}'");
            lblContact.Text = txtContact.Text = func.IsExist($"SELECT Contact FROM USERDETAILS WHERE USERID='{func.UserIdCookie()}'");
            lblAddress.Text = txtAddress.Text = func.IsExist($"SELECT Address FROM USERDETAILS WHERE USERID='{func.UserIdCookie()}'");
            lblCity.Text = txtCity.Text = func.IsExist($"SELECT City FROM USERDETAILS WHERE USERID='{func.UserIdCookie()}'");
            lblState.Text = txtState.Text = func.IsExist($"SELECT State FROM USERDETAILS WHERE USERID='{func.UserIdCookie()}'");
            lblVisible.Text = ddlVisible.Text = func.IsExist($"SELECT Visibility FROM USERDETAILS WHERE USERID='{func.UserIdCookie()}'");
            lblUserName.Text = txtUserName.Text = func.IsExist($"SELECT UserName FROM USERS WHERE USERID='{func.UserIdCookie()}'");
            txtPassword.Text = func.IsExist($"SELECT Password FROM USERS WHERE USERID='{func.UserIdCookie()}'");

        }

        protected void lnkChangeName_OnClick(object sender, EventArgs e)
        {
            VisibleBasic(true, false);
        }

        protected void lnkUpdate_OnClick(object sender, EventArgs e)
        {
            string pic = "";
            string ran = random.Next(0, 999999).ToString();
            if (fileProfile.HasFile)
            {
                string imagePath = Server.MapPath("/photos/") + ran + ".png";
                fileProfile.PostedFile.SaveAs(imagePath);
                pic = "/photos/" + ran + ".png";
            }
            else
            {
                pic = ViewState["pic"].ToString();
            }
            ViewState["pic"] = pic;
            if (txtName.Text == "")
            {
                func.PopAlert(this, "Name is required");
            }
            else
            {
                bool ans = UpdateBasic();
                if (ans)
                {
                    func.Alert(this, "Updated successfully", "s", true);
                    VisibleBasic(false, true);
                    LoadData();
                }
                else
                {
                    func.PopAlert(this, "Failed to update");
                    VisibleBasic(false, true);
                }
            }

        }

        protected void lnkUpdateInfo_OnClick(object sender, EventArgs e)
        {
            if (txtOccupation.Text == "")
            {
                func.Alert(this, "Occupation is required", "w", true);
            }
            else if (ddlGender.Text == "SELECT")
            {
                func.Alert(this, "Gender is required", "w", true);
            }
            else if (txtAge.Text == "")
            {
                func.Alert(this, "Occupation is required", "w", true);
            }
            else if (txtHeight.Text == "")
            {
                func.Alert(this, "Occupation is required", "w", true);
            }
            else if (txtWeight.Text == "")
            {
                func.Alert(this, "Occupation is required", "w", true);
            }
            else if (txtInterest.Text == "")
            {
                func.Alert(this, "Occupation is required", "w", true);
            }
            else if (txtLikes.Text == "")
            {
                func.Alert(this, "Likes is required", "w", true);
            }
            else if (txtDislikes.Text == "")
            {
                func.Alert(this, "Dislikes is required", "w", true);
            }
            else if (txtGoal.Text == "")
            {
                func.Alert(this, "Goals is required", "w", true);
            }
            else if (ddlCommitment.Text == "SELECT")
            {
                func.Alert(this, "Commitment is required", "w", true);
            }
            else if (txtDescription.Text == "")
            {
                func.Alert(this, "Description is required", "w", true);
            }
            else
            {
                bool ans = UpdateInfo();
                if (ans)
                {
                    func.Alert(this, "Personal information updated successfully", "s", true);
                    LoadData();
                    VisiblePersonal(false, true);
                }
                else
                {
                    VisiblePersonal(false, true);
                    func.Alert(this, "Failed to update personal information", "w", true);
                }
            }
        }

        protected void lnkChangeInfo_OnClick(object sender, EventArgs e)
        {
            VisiblePersonal(true, false);
        }


        protected void lnkUpdateFavorite_OnClick(object sender, EventArgs e)
        {
            if (txtRestaurant.Text == "")
            {
                func.Alert(this, "Restaurant is required", "w", true);
            }
            else if (txtMovie.Text == "")
            {
                func.Alert(this, "Movie is required", "w", true);
            }
            else if (txtBooks.Text == "")
            {
                func.Alert(this, "Book is required", "w", true);
            }
            else if (txtPoem.Text == "")
            {
                func.Alert(this, "Poem or Quotes is required", "w", true);
            }
            else if (txtSaying.Text == "")
            {
                func.Alert(this, "Saying is required", "w", true);
            }
            else
            {
                bool ans = UpdateFavorite();
                if (ans)
                {
                    func.Alert(this, "Favorite information updated successfully", "s", true);
                    LoadData();
                    VisibleFavorite(false, true);
                }
                else
                {
                    func.Alert(this, "Failed to update favorite information", "e", true);
                    VisibleFavorite(false, true);
                }
            }

        }

        protected void lnkChangeFavorite_OnClick(object sender, EventArgs e)
        {
            VisibleFavorite(true, false);

        }

        protected void lnkUpdateContact_OnClick(object sender, EventArgs e)
        {
            if (txtEmail.Text == "")
            {
                func.Alert(this, "Email is required", "w", true);
            }
            else if (txtContact.Text == "")
            {
                func.Alert(this, "Contact is required", "w", true);
            }
            else if (txtAddress.Text == "")
            {
                func.Alert(this, "Address is required", "w", true);
            }
            else if (txtCity.Text == "")
            {
                func.Alert(this, "City is required", "w", true);
            }
            else if (txtState.Text == "")
            {
                func.Alert(this, "State is required", "w", true);
            }
            else
            {
                bool ans = UpdateContact();
                if (ans)
                {
                    func.Alert(this, "Contact information updated successfully", "a", true);
                    LoadData();
                    VisibleContact(false, true);
                }
                else
                {
                    func.Alert(this, "Failed to update contact information", "e", true);
                    VisibleContact(false, true);
                }
            }


        }

        protected void lnkChangeContact_OnClick(object sender, EventArgs e)
        {
            VisibleContact(true, false);

        }
        private bool IsUserNameExist()
        {
            bool ans = false;
            string x = func.IsExist($"SELECT UserName FROM Users WHERE UserName='{txtUserName.Text}' AND UserId!='{func.UserIdCookie()}'");
            if (x != "")
            {
                ans = true;
            }
            return ans;
        }
        protected void lnkUpdateOther_OnClick(object sender, EventArgs e)
        {
            if (ddlVisible.Text == "SELECT")
            {
                func.Alert(this, "Visibility is required", "w", true);
            }
            else if (txtUserName.Text == "")
            {
                func.Alert(this, "User name is required", "w", true);
            }
            else if (IsUserNameExist())
            {
                func.Alert(this, "User name already exist", "w", true);
            }
            else if (txtPassword.Text == "")
            {
                func.Alert(this, "Password is required", "w", true);
            }
            else
            {
                bool ans = UpdateOther();
                if (ans)
                {
                    func.Alert(this, "Information updated successfully", "a", true);
                    LoadData();
                    VisibleOther(false, true);
                }
                else
                {
                    func.Alert(this, "Failed to update information", "e", true);
                    VisibleOther(false, true);
                }
            }

        }

        protected void lnkChangeOther_OnClick(object sender, EventArgs e)
        {
            VisibleOther(true, false);

        }
        private void VisibleBasic(bool ans1, bool ans2)
        {
            lnkUpdate.Visible = txtName.Visible = fileProfile.Visible = ans1;
            lnkChangeName.Visible = lblFullName.Visible = ans2;
        }
        private void VisiblePersonal(bool ans1, bool ans2)
        {
            lnkUpdateInfo.Visible =ddlGender.Visible= txtOccupation.Visible = txtAge.Visible = txtHeight.Visible = txtWeight.Visible = txtInterest.Visible = txtLikes.Visible = txtDislikes.Visible = txtGoal.Visible = ddlCommitment.Visible = txtDescription.Visible = ans1;
            lnkChangeInfo.Visible = lblOccupation.Visible =lblGender.Visible= lblAge.Visible = lblHeight.Visible = lblWeight.Visible = lblInterest.Visible = lblLikes.Visible = lblDislikes.Visible = lblGoal.Visible = lblCommitment.Visible = lblDescription.Visible = ans2;
        }
        private void VisibleFavorite(bool ans1, bool ans2)
        {
            lnkUpdateFavorite.Visible = txtRestaurant.Visible = txtMovie.Visible = txtBooks.Visible = txtPoem.Visible = txtSaying.Visible = ans1;
            lnkChangeFavorite.Visible = lblRestaurant.Visible = lblMovie.Visible = lblBooks.Visible = lblPoem.Visible = lblSaying.Visible = ans2;
        }
        private void VisibleContact(bool ans1, bool ans2)
        {
            lnkUpdateContact.Visible = txtEmail.Visible = txtContact.Visible = txtAddress.Visible = txtCity.Visible = txtState.Visible = ans1;
            lnkChangeContact.Visible = lblEmail.Visible = lblContact.Visible = lblAddress.Visible = lblCity.Visible = lblState.Visible = ans2;
        }
        private void VisibleOther(bool ans1, bool ans2)
        {
            lnkUpdateOther.Visible = ddlVisible.Visible = txtUserName.Visible = txtPassword.Visible = ans1;
            lnkChangeOther.Visible = lblVisible.Visible = lblUserName.Visible = lblPassword.Visible = ans2;
        }
        internal bool UpdateBasic()
        {
            bool result = false;
            SqlTransaction transaction = null;
            try
            {
                if (con.State != ConnectionState.Open)
                    con.Open();
                transaction = con.BeginTransaction();
                cmd = new SqlCommand("UpdateBasic", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Picture", ViewState["pic"].ToString());
                cmd.Parameters.AddWithValue("@UserId", func.UserIdCookie());
                cmd.Parameters.AddWithValue("@FullName", txtName.Text);

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
        internal bool UpdateInfo()
        {
            bool result = false;
            SqlTransaction transaction = null;
            try
            {
                if (con.State != ConnectionState.Open)
                    con.Open();
                transaction = con.BeginTransaction();
                cmd = new SqlCommand("UPDATE UserDetails SET Occupation=@Occupation,Gender=@Gender,Age=@Age,Height=@Height,Weight=@Weight,Interest=@Interest,Likes=@Likes,DisLikes=@DisLikes,Goals=@Goals,Commitment=@Commitment,Description=@Description WHERE UserId=@UserId", con);
                cmd.Parameters.AddWithValue("@Occupation", txtOccupation.Text);
                cmd.Parameters.AddWithValue("@Age", txtAge.Text);
                cmd.Parameters.AddWithValue("@Gender", ddlGender.Text);
                cmd.Parameters.AddWithValue("@Height", txtHeight.Text);
                cmd.Parameters.AddWithValue("@Weight", txtWeight.Text);
                cmd.Parameters.AddWithValue("@Interest", txtInterest.Text);
                cmd.Parameters.AddWithValue("@Likes", txtLikes.Text);
                cmd.Parameters.AddWithValue("@DisLikes", txtDislikes.Text);
                cmd.Parameters.AddWithValue("@Goals", txtGoal.Text);
                cmd.Parameters.AddWithValue("@Commitment", ddlCommitment.Text);
                cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                cmd.Parameters.AddWithValue("@UserId", func.UserIdCookie());

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
        internal bool UpdateFavorite()
        {
            bool result = false;
            SqlTransaction transaction = null;
            try
            {
                if (con.State != ConnectionState.Open)
                    con.Open();
                transaction = con.BeginTransaction();
                cmd = new SqlCommand("UpdateFavoriteInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Restaurants", txtRestaurant.Text);
                cmd.Parameters.AddWithValue("@Movies", txtMovie.Text);
                cmd.Parameters.AddWithValue("@Books", txtBooks.Text);
                cmd.Parameters.AddWithValue("@Peoms", txtPoem.Text);
                cmd.Parameters.AddWithValue("@Saying", txtSaying.Text);
                cmd.Parameters.AddWithValue("@UserId", func.UserIdCookie());
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
        internal bool UpdateContact()
        {
            bool result = false;
            SqlTransaction transaction = null;
            try
            {
                if (con.State != ConnectionState.Open)
                    con.Open();
                transaction = con.BeginTransaction();
                cmd = new SqlCommand("UpdateContactInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Contact", txtContact.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@City", txtCity.Text);
                cmd.Parameters.AddWithValue("@State", txtState.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@UserId", func.UserIdCookie());

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
        internal bool UpdateOther()
        {
            bool result = false;
            SqlTransaction transaction = null;
            try
            {
                if (con.State != ConnectionState.Open)
                    con.Open();
                transaction = con.BeginTransaction();
                cmd = new SqlCommand("UpdateOtherInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@Visibility", ddlVisible.Text);
                cmd.Parameters.AddWithValue("@UserId", func.UserIdCookie());
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