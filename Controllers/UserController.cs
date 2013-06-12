using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ToDo.Models;
using System.Net.Mail;
using System.Web.Security;

namespace ToDo.Controllers
{
    public class UserController : Controller
    {

        public ActionResult Index()
        {
            ViewData.Model = (new DatabaseDataContext()).Users.ToList();
            return View();
        }
        //
        // GET: /User/Details/5

        public ActionResult Details(int id)
        {
            var db = new DatabaseDataContext();
            var user = db.Users.SingleOrDefault(u =>u.user_id == id);

            ViewData.Model = user;
            return View();
        }

        //
        // GET: /User/Create

        public ActionResult Create()
        {
            
            return View();
        } 

        //
        // POST: /User/Create

        [HttpPost]
        public ActionResult Create(User userModel)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (userModel.password == userModel.conformPassword)
                    {
                        var db = new DatabaseDataContext();
                        var user=db.Users.FirstOrDefault(u=>u.email==userModel.email);
                        if (user == null)
                        {
                            user = new User();
                            user.name = userModel.name;
                            user.email = userModel.email;
                            user.password = userModel.password;

                            db.Users.InsertOnSubmit(user);
                            db.SubmitChanges();
                            return RedirectToAction("LogOn");

                        }else ModelState.AddModelError("", "User with this email already exist");
                    }else ModelState.AddModelError("","Passwords must be match"); 
                }
                return View(userModel);
            }
            catch
            {
                return View(userModel);
            }
        }
        
        //
        // GET: /User/Edit/5
 
        public ActionResult Edit(int id)
        {
            var db = new DatabaseDataContext();
            var user = db.Users.SingleOrDefault(u => u.user_id == id);

            ViewData.Model = user;
            return View();
        }

        //
        // POST: /User/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, User userModel)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    // TODO: Add update logic here
                    var db = new DatabaseDataContext();
                    var user = db.Users.SingleOrDefault(u => u.user_id == id);

                    user.name = userModel.name;
                    user.email = userModel.email;
                    user.password = userModel.password;

                    db.SubmitChanges();
                    return RedirectToAction("Index");
                }

                return View(userModel);
            }
            catch
            {
                return View(userModel);
            }
        }

        //
        // GET: /User/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /User/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
                var db = new DatabaseDataContext();
                var user = db.Users.Single(u=>u.user_id==id);

                if (Request["Yes"] != null)
                {
                    db.Users.DeleteOnSubmit(user);
                    db.SubmitChanges();
                }

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }



        // **************************************
        // URL: /Account/LogOn
        // **************************************

        public ActionResult LogOn()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LogOn(User userModel)
        {
            ModelState.Remove("name");
            ModelState.Remove("conformPassword");
            ModelState.Remove("password");
    
            if (ModelState.IsValid)
            {
                var db = new DatabaseDataContext();
                var user = db.Users.FirstOrDefault(u=>u.email==userModel.email);

                if (user!=null && user.password==userModel.password)
                {
                    FormsAuthentication.RedirectFromLoginPage(user.name, userModel.remember);
                    return RedirectToAction("Index", "Task", new {id= user.user_id,done=false});
                }
                else
                {
                    ModelState.AddModelError("", "Login and/or password are incorrect");
                }
            }

            return View(userModel);
        }

        // **************************************
        // URL: /Account/RememberPassword
        // **************************************

        public ActionResult ReminderPassword()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ReminderPassword(User userModel)
        {
            ModelState.Remove("name");
            ModelState.Remove("conformPassword");
            ModelState.Remove("password");

            if (ModelState.IsValid)
            {
                var db = new DatabaseDataContext();
                var user = db.Users.FirstOrDefault(u => u.email == userModel.email);

                if (user != null)
                {
                    System.Net.Mail.MailMessage Message = new System.Net.Mail.MailMessage();
                    Message.Subject = "Reminder password";
                    Message.Body = "Hello "+user.name+ "! Your password for ToDo : \n"+user.password;
                    Message.BodyEncoding = System.Text.Encoding.ASCII;
                    Message.From=new MailAddress("alfa-prog@mail.ru");
                    Message.To.Add(new MailAddress(user.email));
                    System.Net.Mail.SmtpClient Smtp = new SmtpClient("smtp.mail.ru");
                    Smtp.EnableSsl = true; 
                    Smtp.Credentials = new System.Net.NetworkCredential("alfa-prog@mail.ru", "fktnerg3z7");
                    Smtp.Send(Message);

                    return RedirectToAction("LogOn");
                }
                else
                {
                    ModelState.AddModelError("", "This email does not exist");
                }
            }

            return View(userModel);
        }

        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();

            return RedirectToAction("LogOn");
        }
   }
}
