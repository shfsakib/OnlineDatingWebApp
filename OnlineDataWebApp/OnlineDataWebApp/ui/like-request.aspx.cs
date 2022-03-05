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
    public partial class like_request : System.Web.UI.Page
    {
        private function func;
        private SqlConnection con;
        private SqlCommand cmd;
        public like_request()
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
            repeaterUser.DataSource = GetRequestedList();
            repeaterUser.DataBind();
            func.Execute($@"UPDATE LIKEUSER SET RequestStatus='1' WHERE ReceiverId='{func.UserIdCookie()}'");
           
        }
        protected void lnkDisLike_OnClick(object sender, EventArgs e)
        {
            bool ans = func.Execute($"DELETE FROM LIKEUSER WHERE ReceiverId='{func.UserIdCookie()}'");
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
        internal DataTable GetRequestedList()
        {
            DataTable dataTable = new DataTable();
            SqlDataAdapter adapter;
            string query = "GetRequestedList";
            cmd = new SqlCommand(query, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ReceiverId", func.UserIdCookie()); 
            con.Open();
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dataTable);
            con.Close();
            return dataTable;
        }

        protected void lnkLike_OnClick(object sender, EventArgs e)
        {
            bool ans =func.Execute($@"UPDATE LikeUser SET FriendStatus=1 WHERE ReceiverId='{func.UserIdCookie()}'");
            if (ans)
            {
                func.Alert(this, "Liked Successfully", "s", true);
                LoadData();
            }
            else
            {
                func.Alert(this, "Failed to sent like", "e", true);
            }
        }
    }
}