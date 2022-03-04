using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineDataWebApp.ui
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkChangeName_OnClick(object sender, EventArgs e)
        {
            lnkUpdate.Visible = txtName.Visible = true;
            lnkChangeName.Visible = lblFullName.Visible = false;
        }

        protected void lnkUpdate_OnClick(object sender, EventArgs e)
        {
            lnkUpdate.Visible = txtName.Visible = false;
            lnkChangeName.Visible = lblFullName.Visible = true;
        }
    }
}