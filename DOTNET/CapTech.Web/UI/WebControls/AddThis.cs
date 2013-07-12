using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using CapTech.Web.Social.AddThis;
using System.Web.UI;

namespace CapTech.Web.UI.WebControls
{
    public class AddThis : System.Web.UI.WebControls.WebControl
    {
        private static Dictionary<SocialStyle, string> Styles
        {
            get
            {
                return new Dictionary<SocialStyle, string>()
                {
                    {SocialStyle.Button, ""},
                    {SocialStyle.Counter, "addthis_counter_style"},
                    {SocialStyle.Large, "addthis_32x32_style"},
                    {SocialStyle.None, ""},
                    {SocialStyle.Small, "addthis_16x16_style"}
                };
            }
        }

        protected Repeater ItemRepeater;
        protected string url;
        protected IEnumerable<Tool> items;
        SocialStyle style;
        Orientation orientation;

        public string URL
        {
            get { return url; }
            set { url = value; }
        }
        public IEnumerable<Tool> Items
        {
            get { return items; }
            set { items = value; }
        }
        public SocialStyle SocialStyle
        {
            get { return style; }
            set { style = value; }
        }
        public Orientation Orientation
        {
            get { return orientation; }
            set { orientation = value; }
        }

        public AddThis()
        {
            // Add Events
            this.Init += new EventHandler(AddThis_Init);

            // Set default vars
            url = null;
            style = Social.AddThis.SocialStyle.None;
            orientation = System.Web.UI.WebControls.Orientation.Horizontal;
        }
        void AddThis_Init(object sender, EventArgs e)
        {
            if (items == null || (items != null && items.Count() < 1))
            {
                items = Tools.GetDefaultTools(orientation);
            }

            ItemRepeater = new Repeater();
            this.Controls.Add(ItemRepeater);

            ItemRepeater.ItemTemplate = new ItemTemplate();
            ItemRepeater.DataSource = Items;
            ItemRepeater.DataBind();
        }
        public override void RenderBeginTag(HtmlTextWriter writer)
        {
            if (SocialStyle != SocialStyle.Button)
            {
                string cssClass = "addthis_toolbox";
                if (Orientation != System.Web.UI.WebControls.Orientation.Horizontal)
                {
                    cssClass += " addthis_floating_style";
                }
                else
                {
                    cssClass += " addthis_default_style";
                }

                if (SocialStyle != SocialStyle.None)
                {
                    cssClass += " " + Styles[SocialStyle];
                }

                string options = "";
                if (!string.IsNullOrEmpty(URL))
                {
                    options += string.Format(" addthis:url=\"{0}\"", URL);
                }

                writer.Write(string.Format("<div class=\"{0}\"{1}>", cssClass, options));
            }
        }
        public override void RenderEndTag(HtmlTextWriter writer)
        {
            if (SocialStyle != SocialStyle.Button)
            {
                writer.Write("</div>");
            }
            writer.Write("<script type=\"text/javascript\" src=\"//s7.addthis.com/js/300/addthis_widget.js#pubid=xa-51de24ba157151e6\"></script>");
        }

        private class ItemTemplate : ITemplate
        {
            public void InstantiateIn(System.Web.UI.Control container)
            {
                Literal literal = new Literal();
                literal.DataBinding += new EventHandler(literal_DataBinding);
                container.Controls.Add(literal);
            }
            void literal_DataBinding(object sender, EventArgs e)
            {
                Literal literal;
                literal = (Literal)sender;
                RepeaterItem container = (RepeaterItem)literal.NamingContainer;
                literal.Text = container.DataItem.ToString();
            }
        }
    }
}

/*

<!-- AddThis Button BEGIN -->
<a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=300&amp;pubid=xa-51df777e4826dda7"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a>
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=xa-51df777e4826dda7"></script>
<!-- AddThis Button END -->

*/