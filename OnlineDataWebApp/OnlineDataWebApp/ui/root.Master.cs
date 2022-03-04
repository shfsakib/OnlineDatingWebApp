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
        private HttpCookie cookie= function.GetCookie(); 

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
            }
        }

        protected void OnServerClick(object sender, EventArgs e)
        {
            func.Logout();
        }
    }
}