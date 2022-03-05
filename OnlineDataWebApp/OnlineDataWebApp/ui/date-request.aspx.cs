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
    public partial class date_request : System.Web.UI.Page
    {
        private function func;
        private SqlConnection con;
        private SqlCommand cmd;
        public date_request()
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
            gridDateReq.DataSource = GetDateRequest();
            gridDateReq.DataBind();
            func.Execute($@"UPDATE DateRequest SET RequestStatus='1' WHERE ReceiverId='{func.UserIdCookie()}'");
        }

        protected void lnkAccept_OnClick(object sender, EventArgs e)
        {
            LinkButton lnkAccept = (LinkButton)sender;
            HiddenField hiddenId = (HiddenField)lnkAccept.Parent.FindControl("hiddenId");
            bool ans = func.Execute($@"UPDATE DateRequest SET Status='Accepted' WHERE DateId='{hiddenId.Value}'");
            if (ans)
            {
                func.Alert(this, "Request accepted successfully. Now you can plan your date.", "s", true);
                LoadData();
            }
            else
            {
                func.Alert(this, "Failed to accept.", "s", true);
            }
        }

        protected void lnkDeny_OnClick(object sender, EventArgs e)
        {
            LinkButton lnkAccept = (LinkButton)sender;
            HiddenField hiddenId = (HiddenField)lnkAccept.Parent.FindControl("hiddenId");
            bool ans = func.Execute($@"UPDATE DateRequest SET Status='Denied' WHERE DateId='{hiddenId.Value}'");
            if (ans)
            {
                func.Alert(this, "Request denied successfully.", "s", true);
                LoadData();
            }
            else
            {
                func.Alert(this, "Failed to deny.", "s", true);
            }
        }

        protected void lnkIgnore_OnClick(object sender, EventArgs e)
        {
            LinkButton lnkAccept = (LinkButton)sender;
            HiddenField hiddenId = (HiddenField)lnkAccept.Parent.FindControl("hiddenId");
            bool ans = func.Execute($@"UPDATE DateRequest SET Status='Ignored' WHERE DateId='{hiddenId.Value}'");
            if (ans)
            {
                func.Alert(this, "Request ignored successfully.", "s", true);
                LoadData();
            }
            else
            {
                func.Alert(this, "Failed to ignore.", "s", true);
            }
        }

        protected void gridDateReq_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridDateReq.PageIndex = e.NewPageIndex;
            LoadData();
        }
        internal DataTable GetDateRequest()
        {
            DataTable dataTable = new DataTable();
            SqlDataAdapter adapter;
            string query = "GetDateRequest";
            cmd = new SqlCommand(query, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ReceiverId", func.UserIdCookie());
            con.Open();
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dataTable);
            con.Close();
            return dataTable;
        }

        protected void gridDateReq_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Image imgStatus = (Image)e.Row.FindControl("imgStatus");
                LinkButton lnkAccept = (LinkButton)e.Row.FindControl("lnkAccept");
                LinkButton lnkDeny = (LinkButton)e.Row.FindControl("lnkDeny");
                LinkButton lnkIgnore = (LinkButton)e.Row.FindControl("lnkIgnore");
                HiddenField hiddenStatus = (HiddenField)e.Row.FindControl("hiddenStatus");
                if (hiddenStatus.Value == "Accepted")
                {
                    lnkAccept.Visible = lnkDeny.Visible = lnkIgnore.Visible = false;
                    imgStatus.ImageUrl = "/Resources/images/accepted.jpg";
                }
                else if (hiddenStatus.Value == "Denied")
                {
                    lnkAccept.Visible = lnkDeny.Visible = lnkIgnore.Visible = false;
                    imgStatus.ImageUrl = "/Resources/images/denied.png";
                }
                else if (hiddenStatus.Value == "Ignored")
                {
                    lnkAccept.Visible = lnkDeny.Visible = lnkIgnore.Visible = false;
                    imgStatus.ImageUrl = "/Resources/images/ignored.png";
                }
                else
                {
                    imgStatus.Visible = false;
                }

            }
        }
    }
}