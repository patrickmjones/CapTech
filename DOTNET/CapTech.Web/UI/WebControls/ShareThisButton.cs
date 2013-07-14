using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapTech.Web.Social.ShareThis;

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

		protected override void Render(System.Web.UI.HtmlTextWriter writer)
		{
			new Literal() { Text = this.ToString() }.RenderControl(writer);
		}

		public override string ToString()
		{
			string size = ButtonSize == ShareThisButtonSize.Large ? "_large" : String.Empty;
			return String.Format(@"<span class='st_{0}{1}' displayText='{2}'></span>", ServiceClass, size, DisplayText);
		}
	}
}
