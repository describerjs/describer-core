using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using JM.Foundation.Utils;
using NSpec;

namespace JM.Foundation.Tests
{
    [TestClass]
    public class RequestParameterTests
    {
        [TestMethod]
        public void GetsTheOnlyParamterCorrectly()
        {
            Uri uri = new Uri("http://test.de?param1=1");
            RequestParameter.GetValueFromUrl(uri.ToString(), "param1").should_be("1");
        }

        [TestMethod]
        public void GetsTheFirstAndSecondOfTwoParamtersCorrectly()
        {
            Uri uri = new Uri("http://test.de?param1=1&param2=2");
            RequestParameter.GetValueFromUrl(uri.ToString(), "param1").should_be("1");
            RequestParameter.GetValueFromUrl(uri.ToString(), "param2").should_be("2");
        }

        [TestMethod]
        public void GetsTheFirstAndSecondOfTwoParamtersInPartialUri()
        {
            string[] partialUris = new string[]
            {
                "param1=1&param2=2",
                "?param1=1&param2=2",
            };

            foreach (var partialUri in partialUris)
            {
                RequestParameter.GetValueFromUrl(partialUri, "param1").should_be("1");
                RequestParameter.GetValueFromUrl(partialUri, "param2").should_be("2");   
            }
        }

        [TestMethod]
        public void GetsStringEmptyIfNoParametersGiven()
        {
            Uri uri = new Uri("http://test.de");
            RequestParameter.GetValueFromUrl(uri.ToString(), "param1").should_be(string.Empty);
            RequestParameter.GetValueFromUrl(uri.ToString(), "param2").should_be(string.Empty);
        }


        [TestMethod]
        public void HandlesIncorrectUrls()
        {
            string[] uris = new string[]
            {
                @"http://test.de?",
                @"http://test.de? ",
                @"http://test.de&",
                @"http://test.de ?",
                null,
                string.Empty,
                " ",
                ":",
                "?",
                "&",
                "&&",
                "="
            };

            foreach (var testString in uris)
            {
                RequestParameter.GetValueFromUrl(testString, "param1").should_be(string.Empty);    
            }
        }
    }
}