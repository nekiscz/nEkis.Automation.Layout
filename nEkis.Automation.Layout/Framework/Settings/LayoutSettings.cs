using nEkis.Automation.Layout.Configuration;
using System;
using System.Linq;
using System.Text.RegularExpressions;

namespace nEkis.Automation.Layout
{
    /// <summary>
    /// Allowed device types
    /// </summary>
    public enum Devices
    {
        /// <summary>
        /// Desktop
        /// </summary>
        Desktop,
        /// <summary>
        /// Tablet
        /// </summary>
        Tablets,
        /// <summary>
        /// Mobile
        /// </summary>
        Mobile
    }

    /// <summary>
    /// Takes care of layout test settings 
    /// </summary>
    public class LayoutSettings
    {
        /// <summary>
        /// Holds different screensizes from config, max of three
        /// <para>1200px, 992px and 768px by default</para>
        /// </summary>
        public static int[] ScreenSizes
        {
            get
            {
                var config = LayoutConfig.Settings.ScreenSizes.Value;

                var separators = new char[] { ',', ';', ' ' };
                var sizes = config.Split(separators);
                if (sizes.Length >= 3 && sizes.All(r => Regex.IsMatch(r, @"[\d]")))
                    return Array.ConvertAll(sizes, s => int.Parse(s));
                else return new int[] { 1200, 992, 768 };
            }
        }
        /// <summary>
        /// Holds approximation limit for distance calculations
        /// <para>5px by default</para>
        /// </summary>
        public static int Approximation
        {
            get
            {
                var config = LayoutConfig.Settings.Approximation.Value;

                if (!string.IsNullOrEmpty(config))
                    if (Regex.IsMatch(config, @"[\d]"))
                        return Convert.ToInt32(config);

                return 5;
            }
        }
    }
}
