using OpenQA.Selenium;
using System;
using System.Drawing;

namespace nEkis.Automation.Layout
{
    /// <summary>
    /// Methods manipulating points and data needed to calculate position and distance
    /// </summary>
    public static class PositionExtentions
    {
        /// <summary>
        /// Gets point representing right top corner of given IWebElement
        /// </summary>
        /// <param name="element">Any HTML element</param>
        /// <returns>Right top poin</returns>
        public static Point GetRightTopPoint(this IWebElement element)
        {
            var rightTop = new Point
            {
                X = element.Location.X + element.Size.Width,
                Y = element.Location.Y
            };

            return rightTop;
        }

        /// <summary>
        /// Gets point representing right bottom corner of given IWebElement
        /// </summary>
        /// <param name="element">Any HTML element</param>
        /// <returns>Right bottom point</returns>
        public static Point GetRightBottomPoint(this IWebElement element)
        {
            var rightBottom = new Point
            {
                X = element.Location.X + element.Size.Width,
                Y = element.Location.Y + element.Size.Height
            };

            return rightBottom;
        }

        /// <summary>
        /// Gets point representing left top corner of given IWebElement
        /// </summary>
        /// <param name="element">Any HTML element</param>
        /// <returns>Left top point</returns>
        public static Point GetLeftTopPoint(this IWebElement element)
        {
            return element.Location;
        }


        /// <summary>
        /// Gets point representing left bottom corner of given IWebElement
        /// </summary>
        /// <param name="element">Any HTML</param>
        /// <returns>Left bottom point</returns>
        public static Point GetLeftBottomPoint(this IWebElement element)
        {
            var leftBottom = new Point
            {
                X = element.Location.X,
                Y = element.Location.Y + element.Size.Height
            };

            return leftBottom;
        }

        /// <summary>
        /// Creates 'ApproximatedDistance' object holding distance, minimum and maximum allowed
        /// </summary>
        /// <param name="distance">Non approximated distance</param>
        /// <returns>New ApproximatedDistance object</returns>
        public static ApproxmatedDistance GetDistanceAproximation(this int distance)
        {
            var min = Math.Abs(distance - LayoutSettings.Approximation);
            var max = distance + LayoutSettings.Approximation;

            return new ApproxmatedDistance
            {
                Min = min,
                Max = max,
                Distance = distance
            };
        }

        /// <summary>
        /// Gets distance of two points as another point
        /// </summary>
        /// <param name="a">First point</param>
        /// <param name="b">Second point</param>
        /// <returns>Point witx position representing distance of points</returns>
        public static Distance GetDistance(this Point a, Point b)
        {
            return new Distance
            {
                X = Math.Abs(b.X - a.X),
                Y = Math.Abs(b.Y - a.Y)
            };
        }
    }
}
