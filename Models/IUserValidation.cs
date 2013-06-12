using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.Data.Linq;
using System.Web.Mvc;

namespace ToDo.Models
{
    public class IUserValidation
    {

        [Required(ErrorMessage = "Name required")]
        public string name { get; set; }

        [Required(ErrorMessage = "Email required")]
        [RegularExpression("^[0-9a-z]+[-._0-9a-z]*@[0-9a-z]+[-._^0-9a-z]*[0-9a-z]+[.]{1}[a-z]{2,6}$", ErrorMessage = "Email is incorrect")]
        public string email { get; set; }

        [Required(ErrorMessage = "Password required")]
        [MinLength(8,ErrorMessage="Password must be under 8 symbols")]
        public string password { get; set; }

        [Required(ErrorMessage = "Password required")]
        [MinLength(8, ErrorMessage = "Password must be under 8 symbols")]
        public string conformPassword { get; set; }

    }

    public class MinLength : ValidationAttribute
    {
        public int length;

        public MinLength(int lengthC)
            : base()
        {
            length = lengthC;
        }

        public override bool IsValid(object value)
        {
            try
            {
                if (value.ToString().Length>=length)
                {
                    return true;

                }

                return false;
            }
            catch
            {
                return false;
            }
        }

    }
}
