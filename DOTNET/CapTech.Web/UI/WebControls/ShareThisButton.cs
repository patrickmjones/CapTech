using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapTech.Web.Social.ShareThis;
using System.Web.UI.HtmlControls;

namespace CapTech.Web.UI.WebControls
{
	/// <summary>
	/// ShareThis Button for use in the ShareThisButtons control, or standalone if that's your thing
	/// </summary>
	public class ShareThisButton : Control
	{
		protected string displayText;
		/// <summary>
		/// Display text for button - used with Small size
		/// </summary>
		public string DisplayText
		{
			get { return displayText; }
			set { displayText = value; }
		}

		protected string serviceClass;
		/// <summary>
		/// Use at your own risk - custom class
		/// </summary>
		public string ServiceClass
		{
			get { return serviceClass; }
			set { serviceClass = value; }
		}

		protected ShareThisButtonSize buttonSize;
		/// <summary>
		/// Size of the buttons - Large(32px), Small(16px)
		/// </summary>
		public ShareThisButtonSize ButtonSize
		{
			get { return buttonSize; }
			set { buttonSize = value; }
		}

		protected ShareThisButtonService service;
		/// <summary>
		/// ShareThis service
		/// </summary>
		public ShareThisButtonService Service
		{
			get { return service; }
			set
			{
				service = value;
				switch (service)
				{
					default:
						ServiceClass = Enum.GetName(typeof(ShareThisButtonService), service).ToLower();
						break;
				}
			}
		}

		protected string shareThisTitle;
		/// <summary>
		/// Title of item to share
		/// </summary>
		public string ShareThisTitle
		{
			get {
				if (String.IsNullOrEmpty(shareThisTitle) && this.Parent is ShareThisButtons)
				{
					return ((ShareThisButtons)this.Parent).ShareThisTitle;
				}
				return shareThisTitle; 
			}
			set { shareThisTitle = value; }
		}

		protected string shareThisURL;
		/// <summary>
		/// URL of item to share
		/// </summary>
		public string ShareThisURL
		{
			get
			{
				if (String.IsNullOrEmpty(shareThisURL) && this.Parent is ShareThisButtons)
				{
					return ((ShareThisButtons)this.Parent).ShareThisURL;
				}
				return shareThisURL;
			}
			set { shareThisURL = value; }
		}

		protected override void Render(System.Web.UI.HtmlTextWriter writer)
		{
			GetButton().RenderControl(writer);
		}

		public HtmlGenericControl GetButton()
		{
			string size = ButtonSize == ShareThisButtonSize.Large ? "_large" : String.Empty;
			HtmlGenericControl bspan = new HtmlGenericControl("span");
			bspan.Attributes["displayText"] = DisplayText;
			bspan.Attributes["class"] = String.Format("st_{0}{1}", ServiceClass, size);
			if (!String.IsNullOrEmpty(ShareThisTitle))
			{
				bspan.Attributes["st_title"] = ShareThisTitle;
			}
			if (!String.IsNullOrEmpty(ShareThisURL))
			{
				bspan.Attributes["st_url"] = ShareThisURL;
			}

			return bspan;
		}
	}
}
