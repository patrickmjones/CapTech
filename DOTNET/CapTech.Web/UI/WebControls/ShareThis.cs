using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapTech.Web.Social.ShareThis;

namespace CapTech.Web.UI.WebControls
{
	/// <summary>
	/// Base Share This control - doesn't do anything
	/// </summary>
	public class ShareThis : System.Web.UI.WebControls.WebControl
	{
		protected string publisher;
		/// <summary>
		/// ShareThis publisher ID
		/// </summary>
		public string Publisher
		{
			get { return publisher; }
			set { publisher = value; }
		}

		protected virtual void RenderScripts(System.Web.UI.HtmlTextWriter writer)
		{

		}
	}
}
