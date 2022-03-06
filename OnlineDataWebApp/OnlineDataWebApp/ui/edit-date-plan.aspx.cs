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
    public partial class edit_date_plan : System.Web.UI.Page
    {
        private function func;
        private SqlConnection con;
        private SqlCommand cmd;
        public edit_date_plan()
        {
            func = function.GetInstance();
            con = new SqlConnection(func.Connection);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                func.CheckCookies();
                if (Request.QueryString["id"] == null)
                {
                    Response.Redirect("/ui/crushes.aspx");
                }
                LoadData();
            }
        }
        private void LoadData()
        {
            string id = Request.QueryString["id"];
            txtDate.Text = func.IsExist($"SELECT Date FROM DatePlan WHERE PlanId='{id}'");
            txtTime.Text = func.IsExist($"SELECT Time FROM DatePlan WHERE PlanId='{id}'");
            txtDescription.Text = func.IsExist($"SELECT Description FROM DatePlan WHERE PlanId='{id}'");
        }
        protected void lnkUpdatePlan_OnClick(object sender, EventArgs e)
        {
            if (txtDate.Text == "")
            {
                func.Alert(this, "Date is required", "w", true);
            }
            else if (txtTime.Text == "")
            {
                func.Alert(this, "Time is required", "w", true);
            }
            else if (txtDescription.Text == "")
            {
                func.Alert(this, "Description is required", "w", true);
            }
            else
            {
                bool ans = UpdatePlan();
                if (ans)
                {
                    func.Alert(this, "Plan changed successfully", "s", true);
                    func.Redirect(this, "/ui/dating-plan.aspx?id=" + Request.QueryString["id"]);
                }
                else
                {
                    func.Alert(this, "Failed to change plan", "e", true);
                }
            }
        }
        internal bool UpdatePlan()
        {
            bool result = false;
            SqlTransaction transaction = null;
            try
            {
                if (con.State != ConnectionState.Open)
                    con.Open();
                transaction = con.BeginTransaction();
                cmd = new SqlCommand("UpdatePlan", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PlanId", Request.QueryString["id"]);
                cmd.Parameters.AddWithValue("@Date", txtDate.Text);
                cmd.Parameters.AddWithValue("@Time", txtTime.Text);
                cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
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