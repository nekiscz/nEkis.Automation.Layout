using OpenQA.Selenium;
using nEkis.Automation.Layout;

namespace $rootnamespace$
{
    public static class LayoutMethods
    {
        /// <summary>
        /// Gets if the element is positioned left to other element
        /// </summary>
        /// <param name="model">Any HTML element</param>
        /// <param name="sample">Any HTML element</param>
        /// <returns>True if element is dsiplayed and left of other element</returns>
        public static bool IsLeftTo(this IWebElement model, IWebElement sample)
        {
            var modelRightTop = model.GetRightTopPoint();
            var sampleLeftTop = sample.GetLeftTopPoint();

            return (modelRightTop.X < sampleLeftTop.X) &&
                (model.GetRightBottomPoint().Y > sampleLeftTop.Y && modelRightTop.Y < sample.GetLeftBottomPoint().Y) &&
                model.Displayed &&
                sample.Displayed;
        }

        /// <summary>
        /// Gets if the element is positioned left to other element and approximatly distanced specified value of pixels
        /// </summary>
        /// <param name="model">Any HTML element</param>
        /// <param name="sample">Any HTML element</param>
        /// <param name="distance">Number of pixels between both elements</param>
        /// <returns>True if element is dsiplayed and left of other element in correct distance</returns>
        public static bool IsLeftTo(this IWebElement model, IWebElement sample, int distance)
        {

            var modelRightTop = model.GetRightTopPoint();
            var sampleLeftTop = sample.GetLeftTopPoint();

            var actualDistance = modelRightTop.GetDistance(sampleLeftTop);
            var approxDistance = distance.GetDistanceAproximation();
            var isDistant = actualDistance.X >= approxDistance.Min && actualDistance.X <= approxDistance.Max;

            return (modelRightTop.X < sampleLeftTop.X) &&
                (model.GetRightBottomPoint().Y > sampleLeftTop.Y && modelRightTop.Y < sample.GetLeftBottomPoint().Y) &&
                model.Displayed &&
                sample.Displayed &&
                isDistant;
        }

        /// <summary>
        /// Gets if the element is positioned right to other element
        /// </summary>
        /// <param name="model">Any HTML element</param>
        /// <param name="sample">Any HTML element</param>
        /// <returns>True if element is dsiplayed and right of other element</returns>
        public static bool IsRightTo(this IWebElement model, IWebElement sample)
        {
            var modelLeftTop = model.GetLeftTopPoint();
            var sampleRightTop = sample.GetRightTopPoint();

            return (modelLeftTop.X > sampleRightTop.X) &&
                (model.GetLeftBottomPoint().Y > sampleRightTop.Y && modelLeftTop.Y < sample.GetRightBottomPoint().Y) &&
                model.Displayed &&
                sample.Displayed;
        }

        /// <summary>
        /// Gets if the element is positioned right to other element and approximatly distanced specified value of pixels
        /// </summary>
        /// <param name="model">Any HTML element</param>
        /// <param name="sample">Any HTML element</param>
        /// <param name="distance">Number of pixels between both elements</param>
        /// <returns>True if element is dsiplayed and right of other element in correct distance</returns>
        public static bool IsRightTo(this IWebElement model, IWebElement sample, int distance)
        {
            var modelLeftTop = model.GetLeftTopPoint();
            var sampleRightTop = sample.GetRightTopPoint();

            var actualDistance = modelLeftTop.GetDistance(sampleRightTop);
            var approxDistance = distance.GetDistanceAproximation();
            var isDistant = actualDistance.X >= approxDistance.Min && actualDistance.X <= approxDistance.Max;

            return (modelLeftTop.X > sampleRightTop.X) &&
                (model.GetLeftBottomPoint().Y > sampleRightTop.Y && modelLeftTop.Y < sample.GetRightBottomPoint().Y) &&
                model.Displayed &&
                sample.Displayed &&
                isDistant;
        }

        /// <summary>
        /// Gets if the element is positioned on top of other element
        /// </summary>
        /// <param name="model">Any HTML element</param>
        /// <param name="sample">Any HTML element</param>
        /// <returns>True if element is dsiplayed and on top of other element</returns>
        public static bool IsTopOf(this IWebElement model, IWebElement sample)
        {
            var modelRightBottom = model.GetRightBottomPoint();
            var sampleRightTop = sample.GetRightTopPoint();

            return (modelRightBottom.Y < sampleRightTop.Y) &&
                (model.GetLeftBottomPoint().X < sampleRightTop.X && modelRightBottom.X > sample.GetLeftTopPoint().X) &&
                model.Displayed &&
                sample.Displayed;
        }

        /// <summary>
        /// Gets if the element is positioned on top of other element and approximatly distanced specified value of pixels
        /// </summary>
        /// <param name="model">Any HTML element</param>
        /// <param name="sample">Any HTML element</param>
        /// <param name="distance">Number of pixels between both elements</param>
        /// <returns>True if element is dsiplayed and on top of other element in correct distance</returns>
        public static bool IsTopOf(this IWebElement model, IWebElement sample, int distance)
        {
            var modelRightBottom = model.GetRightBottomPoint();
            var sampleRightTop = sample.GetRightTopPoint();

            var actualDistance = modelRightBottom.GetDistance(sampleRightTop);
            var approxDistance = distance.GetDistanceAproximation();
            var isDistant = actualDistance.Y >= approxDistance.Min && actualDistance.Y <= approxDistance.Max;

            return (modelRightBottom.Y < sampleRightTop.Y) &&
                (model.GetLeftBottomPoint().X < sampleRightTop.X && modelRightBottom.X > sample.GetLeftTopPoint().X) &&
                model.Displayed &&
                sample.Displayed &&
                isDistant;
        }

        /// <summary>
        /// Gets if the element is positioned on bottom of other element
        /// </summary>
        /// <param name="model">Any HTML element</param>
        /// <param name="sample">Any HTML element</param>
        /// <returns>True if element is dsiplayed and on bottom of other element</returns>
        public static bool IsBottomOf(this IWebElement model, IWebElement sample)
        {
            var modelRightTop = model.GetRightTopPoint();
            var sampleRightBottom = sample.GetRightBottomPoint();

            return (modelRightTop.Y > sampleRightBottom.Y) &&
                (model.GetLeftTopPoint().X < sampleRightBottom.X && modelRightTop.X > sample.GetLeftBottomPoint().X) &&
                model.Displayed &&
                sample.Displayed;
        }

        /// <summary>
        /// Gets if the element is positioned on bottom of other element and approximatly distanced specified value of pixels
        /// </summary>
        /// <param name="model">Any HTML element</param>
        /// <param name="sample">Any HTML element</param>
        /// <param name="distance">Number of pixels between both elements</param>
        /// <returns>True if element is dsiplayed and on bottom of other element in correct distance</returns>
        public static bool IsBottomOf(this IWebElement model, IWebElement sample, int distance)
        {
            var modelRightTop = model.GetRightTopPoint();
            var sampleRightBottom = sample.GetRightBottomPoint();

            var actualDistance = modelRightTop.GetDistance(sampleRightBottom);
            var approxDistance = distance.GetDistanceAproximation();
            var isDistant = actualDistance.Y >= approxDistance.Min && actualDistance.Y <= approxDistance.Max;

            return (modelRightTop.Y > sampleRightBottom.Y) &&
                (model.GetLeftTopPoint().X < sampleRightBottom.X && modelRightTop.X > sample.GetLeftBottomPoint().X) &&
                model.Displayed &&
                sample.Displayed &&
                isDistant;
        }

    }
}
