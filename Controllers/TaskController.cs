using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ToDo.Models;

namespace ToDo.Controllers
{
    public class TaskController : Controller
    {
       static  int user;
     
        //INDEX
        public ActionResult Index(int id,bool done)
        {
            var db = new DatabaseDataContext();      
            if (id == 0)
            {
                var taskList = db.Tasks.Where(t => t.user == user).Where(b=>b.done==done).OrderBy(p=>p.date_plan);
                ViewData.Model = taskList;
            }
            else
            {
                var taskList = db.Tasks.Where(t => t.user == user).Where(b => b.done == done).OrderBy(p => p.date_plan);
                user = id;
                ViewData.Model = taskList;
            }
            if (done==true) return View("Archive");
            return View();
        }

        //ARCHIVE
        public ActionResult Archive(int id)
        {
            return Index(id, true);
        }

        //
        // GET: /Task/Details/5

        public ActionResult Details(int id)
        {
            var db = new DatabaseDataContext();
            var task = db.Tasks.SingleOrDefault(t => t.task_id == id);

            ViewData.Model = task;
            return View();
        }

        //
        // GET: /Task/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Task/Create

        [HttpPost]
        public ActionResult Create(Task taskModel)
        {
            try
            {
                // TODO: Add insert logic here
                if (ModelState.IsValid)
                {
                    if (DateTime.Compare(taskModel.date_plan, DateTime.Today) >= 0)
                    {
                        var db = new DatabaseDataContext();
                        var task = new Task();
                        var userCon = db.Users.SingleOrDefault(u => u.user_id == user);

                        task.header = taskModel.header;
                        task.text = taskModel.text;
                        task.date_plan = taskModel.date_plan;
                        task.user = user;
                        task.done = false;

                        task.User1 = userCon;
                        db.Tasks.InsertOnSubmit(task);
                        db.SubmitChanges();

                        return RedirectToAction("Index", new { id = task.user, done = false });
                    }else 
                        ModelState.AddModelError("", "Date must be more than today");                    
                }
                return View(taskModel);
            }
            catch
            {
                return View(taskModel);
            }
        }
        
        //
        // GET: /Task/Edit/5
 
        public ActionResult Edit(int id)
        {
            var db = new DatabaseDataContext();
            var task = db.Tasks.SingleOrDefault(t => t.task_id == id);

            ViewData.Model = task;
            return View();
        }

        //
        // POST: /Task/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, Task taskModel)
        {
            try
            {
                // TODO: Add update logic here
                if (ModelState.IsValid)
                {
                    var db = new DatabaseDataContext();
                    var task = db.Tasks.SingleOrDefault(t => t.task_id == id);

                    task.header = taskModel.header;
                    task.text = taskModel.text;
                    task.date_plan = taskModel.date_plan;
                    task.done = taskModel.done;

                    db.SubmitChanges();

                    return RedirectToAction("Index", new { id = task.user,done=task.done});
                }

                return View(taskModel);
            }
            catch
            {
                return View(taskModel);
            }
        }

        //
        // GET: /Task/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Task/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
                var db = new DatabaseDataContext();
                var task = db.Tasks.SingleOrDefault(t => t.task_id == id);

                if (this.Request["Yes"]!=null)
                {
                    db.Tasks.DeleteOnSubmit(task);
                    db.SubmitChanges();
                }

                return RedirectToAction("Index", new { id = task.user,done=task.done });
            }
            catch
            {
                return View();
            }
        }
    }
}
