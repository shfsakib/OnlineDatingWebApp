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
    public partial class crushes : System.Web.UI.Page
    {
        private function func;
        private SqlConnection con;
        private SqlCommand cmd;
        public crushes()
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
            repeaterUser.DataSource = GetCurshList();
            repeaterUser.DataBind();
        }
        protected void repeaterUser_OnPreRender(object sender, EventArgs e)
        {
            if (repeaterUser.Items.Count < 1)
            {
                noDataDiv.Visible = true;
            }
            else
            {
                noDataDiv.Visible = false;
            }
        }

        protected void lnkDate_OnClick(object sender, EventArgs e)
        {

            LinkButton lnkLike = (LinkButton)sender;
            HiddenField HiddenField1 = (HiddenField)lnkLike.Parent.FindControl("HiddenField1");
            string dateId = func.IsExist($"SELECT TOP 1 DateId FROM DateRequest WHERE (ReceiverId='{HiddenField1.Value}' AND SenderId='{func.UserIdCookie()}') OR  (SenderId='{HiddenField1.Value}' AND ReceiverId='{func.UserIdCookie()}') AND Status='Accepted' ORDER BY DateId DESC");
            if (lnkLike.Text == "Plan your date")
            {
                Response.Redirect("/ui/dating-plan.aspx?id="+ dateId);
            }
            else if (lnkLike.Text == "<i class='fas fa-street-view'></i>&nbsp;&nbsp;Ask for Date")
            {
                if (IsDateExist(HiddenField1.Value))
                {
                    func.Alert(this, "Request already sent to your crush. Wait for response", "w", true);
                }
                else
                {
                    bool ans = SendDateRequest(HiddenField1.Value);
                    if (ans)
                    {
                        func.Alert(this, "Date request sent successfully", "s", true);
                    }
                    else
                    {
                        func.Alert(this, "Failed to send request", "e", true);
                    }
                }
            }
        }
        public bool IsDateExist(string id)
        {
            bool ans = false;
            string x = func.IsExist($"SELECT DateId FROM DateRequest WHERE ReceiverId='{id}' AND SenderId='{func.UserIdCookie()}' AND Status='PENDING'");
            if (x != "")
            {
                ans = true;
            }
            return ans;
        }

        protected void lnkDisLike_OnClick(object sender, EventArgs e)
        {
            bool ans = func.Execute($"DELETE FROM LIKEUSER WHERE (ReceiverId='{func.UserIdCookie()}' OR SENDERID='{func.UserIdCookie()}')");
            if (ans)
            {
                func.Alert(this, "Disliked successfully", "s", true);
                LoadData();
            }
            else
            {
                func.Alert(this, "Failed to dislike", "e", true);
            }
        }
        internal DataTable GetCurshList()
        {
            DataTable dataTable = new DataTable();
            SqlDataAdapter adapter;
            string query = "GetCrushList";
            cmd = new SqlCommand(query, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserId", func.UserIdCookie());
            con.Open();
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dataTable);
            con.Close();
            return dataTable;
        }
        internal bool SendDateRequest(string id)
        {
            bool result = false;
            SqlTransaction transaction = null;
            try
            {
                if (con.State != ConnectionState.Open)
                    con.Open();
                transaction = con.BeginTransaction();
                cmd = new SqlCommand("SendDateRequest", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SenderId", func.UserIdCookie());
                cmd.Parameters.AddWithValue("@ReceiverId", id);
                cmd.Parameters.AddWithValue("@Status", "PENDING");
                cmd.Parameters.AddWithValue("@RequestStatus", 0);
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
                LinkButton lnkDate = (LinkButton)row.FindControl("lnkDate");
                HiddenField userId = (HiddenField)row.FindControl("HiddenField1");
                string x = func.IsExist($@"SELECT DateId FROM DateRequest WHERE ((SenderId='{func.UserIdCookie()}' AND ReceiverId='{userId.Value}') OR (SenderId='{userId.Value}' AND ReceiverId='{func.UserIdCookie()}')) AND Status='Accepted'");
                if (x != "")
                {
                    lnkDate.Text = "Plan your date";
                }
                else
                {
                    lnkDate.Text = "<i class='fas fa-street-view'></i>&nbsp;&nbsp;Ask for Date";
                }
            }
        }
    }
}