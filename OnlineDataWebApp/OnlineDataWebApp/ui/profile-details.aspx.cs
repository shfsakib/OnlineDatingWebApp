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
    public partial class profile_details : System.Web.UI.Page
    {
        private function func;
        private SqlConnection con;
        private SqlCommand cmd;
        public profile_details()
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
                    Response.Redirect("/ui/home.aspx");
                }
                LoadData();
            }
        }

        private void LoadData()
        {
            string id = Request.QueryString["id"].ToString();
            ViewState["pic"] = func.IsExist($"SELECT PICTURE FROM USERDETAILS WHERE USERID='{id}'");
            profileImg.Src = ViewState["pic"].ToString();
            lblFullName.InnerText = txtName.Text = func.IsExist($"SELECT FullName FROM Users WHERE USERID='{id}'");
            lblOccupation.Text = func.IsExist($"SELECT Occupation FROM USERDETAILS WHERE USERID='{id}'");
            lblAge.Text = func.IsExist($"SELECT Age FROM USERDETAILS WHERE USERID='{id}'");
            lblHeight.Text = func.IsExist($"SELECT Height  FROM USERDETAILS WHERE USERID='{id}'");
            lblWeight.Text = func.IsExist($"SELECT Weight  FROM USERDETAILS WHERE USERID='{id}'");
            lblInterest.Text = func.IsExist($"SELECT Interest FROM USERDETAILS WHERE USERID='{id}'");
            lblLikes.Text = func.IsExist($"SELECT Likes FROM USERDETAILS WHERE USERID='{id}'");
            lblDislikes.Text = func.IsExist($"SELECT Dislikes FROM USERDETAILS WHERE USERID='{id}'");
            lblGoal.Text = func.IsExist($"SELECT Goals FROM USERDETAILS WHERE USERID='{id}'");
            lblCommitment.Text = func.IsExist($"SELECT Commitment FROM USERDETAILS WHERE USERID='{id}'");
            lblGender.Text = func.IsExist($"SELECT Gender FROM USERDETAILS WHERE USERID='{id}'");
            lblDescription.Text = func.IsExist($"SELECT Description FROM USERDETAILS WHERE USERID='{id}'");
            lblRestaurant.Text = func.IsExist($"SELECT Restaurants FROM USERDETAILS WHERE USERID='{id}'");
            lblMovie.Text = func.IsExist($"SELECT Movies FROM USERDETAILS WHERE USERID='{id}'");
            lblBooks.Text = func.IsExist($"SELECT Books FROM USERDETAILS WHERE USERID='{id}'");
            lblPoem.Text = func.IsExist($"SELECT Poems  FROM USERDETAILS WHERE USERID='{id}'");
            lblSaying.Text = func.IsExist($"SELECT Saying FROM USERDETAILS WHERE USERID='{id}'");
            lblCity.Text = func.IsExist($"SELECT City FROM USERDETAILS WHERE USERID='{id}'");
            lblState.Text = func.IsExist($"SELECT State FROM USERDETAILS WHERE USERID='{id}'");

            if (Request.QueryString["type"]!=null)
            {
                lblReqSent.Text = func.IsExist($"SELECT COUNT(DateId) FROM DateRequest WHERE ReceiverId='{id}'");
                lblReqDenied.Text = func.IsExist($"SELECT COUNT(DateId) FROM DateRequest WHERE ReceiverId='{id}' AND Status='DENIED'");
                lblReqIgnored.Text = func.IsExist($"SELECT COUNT(DateId) FROM DateRequest WHERE ReceiverId='{id}' AND Status='IGNORED'");

            }
        }
        
       
    }
}