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
    public partial class dating_plan : System.Web.UI.Page
    {
        private function func;
        private SqlConnection con;
        private SqlCommand cmd;
        public dating_plan()
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
           func.LoadGrid(gridDatePlan,$"SELECT * FROM DatePlan ORDER BY PlanId DESC");
        }
        protected void gridDatePlan_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridDatePlan.PageIndex = e.NewPageIndex;
            LoadData();
        }


        protected void lnkPlan_OnClick(object sender, EventArgs e)
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
                bool ans = PlanForDate();
                if (ans)
                {
                    func.Alert(this, "Plan added successfully", "s", true);
                    LoadData();
                }
                else
                {
                    func.Alert(this, "Failed to add plan", "e", true);
                }
            }
        }
        internal bool PlanForDate()
        {
            bool result = false;
            SqlTransaction transaction = null;
            try
            {
                if (con.State != ConnectionState.Open)
                    con.Open();
                transaction = con.BeginTransaction();
                cmd = new SqlCommand("PlanForDate", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DateId", Request.QueryString["id"]);
                cmd.Parameters.AddWithValue("@Date", txtDate.Text);
                cmd.Parameters.AddWithValue("@Time", txtTime.Text);
                cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                cmd.Parameters.AddWithValue("@InTime", func.Date());
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