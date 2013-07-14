using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapTech.Web.Social.ShareThis;

namespace CapTech.Web.UI.WebControls
{
	/// <summary>
	/// ShareThisButtons control.  Renders necessary scripts with publisher ID, and designed to contain individual buttons
	/// </summary>
	[ParseChildren(false), PersistChildren(true)]
	public class ShareThisButtons : ShareThis
	{
		protected ShareThisButtonSize buttonSize;
		/// <summary>
		/// ShareThis button size
		/// </summary>
		public ShareThisButtonSize ButtonSize
		{
			// TODO: Make this apply when child controls are added or something..
			get { return buttonSize; }
			set { buttonSize = value; }
		}

		protected string shareThisTitle;
		/// <summary>
		/// Title of shared item
		/// </summary>
		public string ShareThisTitle
		{
			get { return shareThisTitle; }
			set { shareThisTitle = value; }
		}

		protected string shareThisURL;
		/// <summary>
		/// URL of item to share
		/// </summary>
		public string ShareThisURL
		{
			get { return shareThisURL; }
			set { shareThisURL = value; }
		}

		public override void RenderEndTag(System.Web.UI.HtmlTextWriter writer)
		{
			RenderScripts(writer);
			base.RenderEndTag(writer);
		}

		override protected void RenderScripts(System.Web.UI.HtmlTextWriter writer)
		{
			Literal scriptLit = new Literal();
			scriptLit.Text = String.Format(@"
				<script type=""text/javascript"">var switchTo5x=true;</script>
				<script type=""text/javascript"" src=""http://w.sharethis.com/button/buttons.js""></script>
				<script type=""text/javascript"">stLight.options({{
					publisher: ""{0}"", 
					doNotHash: false, 
					doNotCopy: false, 
					hashAddressBar: false
				}});</script>", "ur-7c6ccffe-357-c8d2-84a9-3a6f5f9c7846");

			scriptLit.RenderControl(writer);
		}
	}
}
