using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASLdatingWebApp;

namespace OnlineDataWebApp.ui
{
    public partial class root : System.Web.UI.MasterPage
    {
        private function func;
        private HttpCookie cookie = function.GetCookie();

        public root()
        {
            func = function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                func.CheckCookies();
                if (cookie == null)
                {
                    Response.Redirect("/ui/log-in.aspx");
                }
                lblSup.Text = func.IsExist($@"SELECT COUNT(LIKEID) FROM LikeUser WHERE ReceiverId='{func.UserIdCookie()}' AND RequestStatus=0");
                lblDate.Text = func.IsExist($@"SELECT COUNT(DateId) FROM DateRequest WHERE ReceiverId='{func.UserIdCookie()}' AND RequestStatus=0");

            }
        }

        protected void OnServerClick(object sender, EventArgs e)
        {
            func.Logout();
        }
    }
}