using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;
using System.Web.Mvc;

namespace JM.Foundation.Mvc.Validation
{
    [AttributeUsage(AttributeTargets.Property, AllowMultiple = true)]
    public class RegexValidationAttribute : ValidationAttribute, IClientValidatable
    {
        private string _regex = string.Empty;

        private bool _allowEmptyString = false;

        public RegexValidationAttribute(string regex, bool allowEmptyString, string errorMessage)
            : base(errorMessage)
        {
            _regex = regex;
            _allowEmptyString = allowEmptyString;
        }
        
        public IEnumerable<ModelClientValidationRule> GetClientValidationRules(ModelMetadata metadata, ControllerContext context)
        {
            string errorMessage = ErrorMessageString;

            var regexRule = new ModelClientValidationRule();
            regexRule.ErrorMessage = errorMessage;
            regexRule.ValidationType = "jmval"; // This is the name the jQuery adapter will use
            regexRule.ValidationParameters.Add("pattern", _regex);

            if (_allowEmptyString)
            {
                regexRule.ValidationParameters.Add("allowempty", _allowEmptyString);
            }

            yield return regexRule;
        }
        
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            try
            {
                if (value == null || string.IsNullOrEmpty(value.ToString()))
                {
                    if (_allowEmptyString)
                    {
                        return ValidationResult.Success;
                    }

                    return new ValidationResult(ErrorMessageString);
                }
                
                var val = value.ToString();

                if (!Regex.IsMatch(val, _regex))
                {
                    return new ValidationResult(ErrorMessageString);
                }
            }
            catch (Exception ex)
            {
                // Do stuff, i.e. log the exception
                // Let it go through the upper levels, something bad happened
                throw ex;
            }
 
            return ValidationResult.Success;
        }
    }
}