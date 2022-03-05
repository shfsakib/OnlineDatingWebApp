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
    public partial class home : System.Web.UI.Page
    {
        private function func;
        private SqlConnection con;
        private SqlCommand cmd;
        Random random = new Random();
        public home()
        {
            func = function.GetInstance();
            con = new SqlConnection(func.Connection);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                func.CheckCookies();
            }
        }
        protected void lnkSearch_OnClick(object sender, EventArgs e)
        {
            if (!inputFemale.Checked && !inputMale.Checked)
            {
                func.Alert(this, "Please choose a gender", "w", true);
            }
            else if (txtRange1.Text == "")
            {
                func.Alert(this, "Minimum age is required", "w", true);

            }
            else if (Convert.ToInt32(txtRange1.Text) < 12 || Convert.ToInt32(txtRange1.Text) > 50)
            {
                func.Alert(this, "Minimum age limit 12 to 50", "w", true);
            }
            else if (txtRange2.Text == "")
            {
                func.Alert(this, "Maximum age is required", "w", true);
            }
            else if (Convert.ToInt32(txtRange2.Text) < 51)
            {
                func.Alert(this, "Maximum age limit from 51", "w", true);
            }
            else if (ddlCommitment.Text == "SELECT")
            {
                func.Alert(this, "Commitment is required", "w", true);
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
                string gender = "Female";
                if (inputMale.Checked)
                {
                    gender = "Male";
                }
                repeaterUser.DataSource = SearchProfile(gender);
                repeaterUser.DataBind();

                if (repeaterUser.Items.Count < 1)
                {
                    noDataDiv.Visible = true;
                }
                else
                {
                    noDataDiv.Visible = false;
                }

            }
        }
        public bool IsLikeExist(string id)
        {
            bool ans = false;
            string x = func.IsExist($"SELECT LikeId FROM LikeUser WHERE (ReceiverId='{func.UserIdCookie()}' OR SenderId='{func.UserIdCookie()}') AND (ReceiverId='{id}' OR SenderId='{id}') ");
            if (x != "")
            {
                ans = true;
            }
            return ans;
        }
        protected void lnkLike_OnClick(object sender, EventArgs e)
        {
            LinkButton lnkLike = (LinkButton) sender;
            HiddenField HiddenField1 = (HiddenField) lnkLike.Parent.FindControl("HiddenField1");
            string gender = "Female";
            if (inputMale.Checked)
            {
                gender = "Male";
            }
            bool ans = LikeUser(HiddenField1.Value);
            if (ans)
            {
                func.Alert(this, "Liked Successfully", "s", true);
                repeaterUser.DataSource = SearchProfile(gender);
                repeaterUser.DataBind();
            }
            else
            {
                func.Alert(this, "Failed to sent like", "e", true);
            }
        }

        protected void lnkDisLike_OnClick(object sender, EventArgs e)
        {
            string gender = "Female";
            if (inputMale.Checked)
            {
                gender = "Male";
            }
            bool ans = func.Execute($"DELETE FROM LIKEUSER WHERE (SENDERID='{func.UserIdCookie()}') OR (ReceiverId='{func.UserIdCookie()}')");
            if (ans)
            {
                func.Alert(this, "Disliked successfully", "s", true);
                repeaterUser.DataSource = SearchProfile(gender);
                repeaterUser.DataBind();
            }
            else
            {
                func.Alert(this, "Failed to dislike", "e", true);
            }
        }
        internal DataTable SearchProfile(string gender)
        {
            DataTable dataTable = new DataTable();
            SqlDataAdapter adapter;
            string query = "SearchProfile";
            cmd = new SqlCommand(query, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserId", func.UserIdCookie());
            cmd.Parameters.AddWithValue("@Gender", gender);
            cmd.Parameters.AddWithValue("@Age1", txtRange1.Text);
            cmd.Parameters.AddWithValue("@Age2", txtRange2.Text);
            cmd.Parameters.AddWithValue("@Commitment", ddlCommitment.Text);
            cmd.Parameters.AddWithValue("@City", txtCity.Text);
            cmd.Parameters.AddWithValue("@State", txtState.Text);
            con.Open();
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dataTable);
            con.Close();
            return dataTable;
        }

        internal bool LikeUser(string id)
        {
            bool result = false;
            SqlTransaction transaction = null;
            try
            {
                if (con.State != ConnectionState.Open)
                    con.Open();
                transaction = con.BeginTransaction();
                cmd = new SqlCommand("SendRequest", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SenderId", func.UserIdCookie());
                cmd.Parameters.AddWithValue("@ReceiverId", id);
                cmd.Parameters.AddWithValue("@RequestStatus", 0);
                cmd.Parameters.AddWithValue("@FriendStatus", 0);
                cmd.Parameters.AddWithValue("@ReqTime", func.Date());

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

        protected void repeaterUser_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                RepeaterItem row = e.Item;
                LinkButton lnkLike = (LinkButton)row.FindControl("lnkLike");
                LinkButton lnkDisLike = (LinkButton)row.FindControl("lnkDisLike");
                HiddenField userId = (HiddenField)row.FindControl("HiddenField1");
                if (!IsLikeExist(userId.Value))
                {
                    lnkDisLike.Visible = false;
                }
                else
                {
                    lnkLike.Visible = false;
                }
            }
        }
    }
}