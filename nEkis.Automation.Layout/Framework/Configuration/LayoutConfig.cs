using System.Configuration;

namespace nEkis.Automation.Layout.Configuration
{
    class LayoutConfig : ConfigurationSection
    {
        private static LayoutConfig _layoutConfig = (LayoutConfig)ConfigurationManager.GetSection("layoutSettings");
        public static LayoutConfig Settings { get { return _layoutConfig; } }

        [ConfigurationProperty("approximation")]
        public ApproximationElement Approximation { get { return (ApproximationElement)base["approximation"]; } }

        [ConfigurationProperty("screensizes")]
        public ScreenSizesElement ScreenSizes { get { return (ScreenSizesElement)base["screensizes"]; } }
    }

    class ApproximationElement : ConfigurationElement
    {
        [ConfigurationProperty("value", DefaultValue = "5", IsRequired = false)]
        public string Value { get { return (string)base["value"]; } }
    }

    class ScreenSizesElement : ConfigurationElement
    {
        [ConfigurationProperty("value", DefaultValue = "1200,992,768", IsRequired = false)]
        public string Value { get { return (string)base["value"]; } }
    }
}
