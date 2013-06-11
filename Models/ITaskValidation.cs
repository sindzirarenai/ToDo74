using System.Data.Linq;
using System.ComponentModel.DataAnnotations;
using System;

namespace ToDo.Models
{

    public class ITaskValidation
    {
        public long task_id { get; set; }

        [Required (ErrorMessage="Header required")]
        public string header { get; set; }

        [Required(ErrorMessage = "About required")]
        public string text { get; set; }

        [Required(ErrorMessage = "Date required")]
        //[DateAttribute(ErrorMessage = "Date must be more than today")]
        public DateTime date_plan { get; set; }

        public System.Nullable<bool> done { get; set; }
        public long user { get; set; }

    }

    public class DateAttribute : ValidationAttribute
    {
        public DateAttribute()
            : base("Date must be more than today") { }

        public override bool IsValid(object value)
        {
            try
            {
                if (DateTime.Compare(DateTime.Parse(value.ToString()), DateTime.Today) >= 0)
                {
                    return true;

                } else return false;
               
            }catch 
            {
                return false;
            }
        }

    }
}