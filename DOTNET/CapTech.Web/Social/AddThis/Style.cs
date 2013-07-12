using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.Specialized;
using System.Web.UI.WebControls;

namespace CapTech.Web.Social.AddThis
{
    public enum SocialStyle
    {
        None, 
        Large,
        Small,
        Button,
        Counter
    }
    public class Tool
    {
        public Tool()
        {
            Attributes = new AttributeValueCollection();
        }
        public override string ToString()
        {
            return string.Format("<a class=\"{0}\"{0}{1}></a>", Class, Attributes.ToString());
        }
        public string Class { get; set; }

        public string URL
        {
            get
            {
                return Attributes["addthis:url"];
            }
            set
            {
                Attributes["addthis:url"] = value;
            }
        }
        public string Title
        {
            get
            {
                return Attributes["addthis:title"];
            }
            set
            {
                Attributes["addthis:title"] = value;
            }
        }
        public AttributeValueCollection Attributes { get; set; }
    }
    public static class Tools
    {
        public static IEnumerable<Tool> GetDefaultTools(Orientation orientation)
        {
            if (orientation == Orientation.Horizontal)
            {
                return Horizontal.DefaultTools;
            }
            else
            {
                return Vertical.DefaultTools;
            }
        }

        public static class Horizontal
        {
            public static IEnumerable<Tool> DefaultTools
            {
                get
                {
                    List<Tool> tools = new List<Tool>();

                    // facebook
                    tools.Add(Tools.FacebookLike);

                    // twitter
                    tools.Add(Tools.TwitterTweet);

                    // pinterest
                    tools.Add(Tools.PinterestPin);

                    // addthis
                    tools.Add(Tools.AddThisAdd);

                    return tools;
                }
            }
        }
        public static class Vertical
        {
            public static IEnumerable<Tool> DefaultTools
            {
                get
                {
                    List<Tool> tools = new List<Tool>();

                    // facebook
                    tools.Add(Tools.Facebook);

                    // twitter
                    tools.Add(Tools.Twitter);

                    // pinterest
                    tools.Add(Tools.Pinterest);

                    // addthis
                    tools.Add(Tools.AddThis);

                    return tools;
                }
            }
        }
        public static Tool Facebook
        {
            get
            {
                return new Tool()
                {
                    Class = "addthis_button_facebook"
                };
            }
        }
        public static Tool Twitter
        {
            get
            {
                return new Tool()
                {
                    Class = "addthis_button_twitter"
                };
            }
        }
        public static Tool Pinterest
        {
            get
            {
                return new Tool()
                {
                    Class = "addthis_button_pinterest"
                };
            }
        }
        public static Tool AddThis
        {
            get
            {
                return new Tool()
                {
                    Class = "addthis_button_compact"
                };
            }
        }
        public static Tool Button
        {
            get
            {
                return new Tool()
                {
                    Class = "addthis_button",
                    URL = "http://www.addthis.com/bookmark.php?v=300&amp;pubid=xa-51df777e4826dda7"
                };
            }
        }

        public static Tool FacebookLike
        {
            get
            {
                return new Tool()
                {
                    Class = "addthis_button_facebook_like"
                };
            }
        }
        public static Tool TwitterTweet
        {
            get
            {
                return new Tool()
                {
                    Class = "addthis_button_tweet"
                };
            }
        }
        public static Tool PinterestPin
        {
            get
            {
                return new Tool()
                {
                    Class = "addthis_button_pinterest_pinit"
                };
            }
        }
        public static Tool AddThisAdd
        {
            get
            {
                return new Tool()
                {
                    Class = "addthis_counter addthis_pill_style"
                };
            }
        }
    }
    public class AttributeValueCollection : NameValueCollection
    {
        public override string ToString()
        {
            string result = "";

            foreach (string key in Keys)
            {
                string value = this[key];
                if (!string.IsNullOrEmpty(value))
                {
                    if (!string.IsNullOrEmpty(result))
                    {
                        result += " ";
                    }
                    result += string.Format("{0}=\"{1}\"", key, value);
                }
            }

            return result;
        }
    }
}