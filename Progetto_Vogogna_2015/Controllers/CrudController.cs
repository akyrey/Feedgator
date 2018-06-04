using Ext.Net.MVC;
using ServiceStack.OrmLite;
using System;
using System.Data;
using System.Web.Mvc;

namespace Progetto_Vogogna_2015.Controllers
{
    public class CrudController<T> : BaseController
    {
        RestResult Try(Func<IDbConnection, RestResult> func)
        {
            try
            {
                using (var db = DbFactory.Open())
                {
                    return func(db);
                }
            }
            catch (Exception e)
            {
                return new RestResult
                {
                    Success = false,
                    Message = e.Message
                };
            }
        }

        public virtual ActionResult Index()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public virtual RestResult Create(T category)
        {
            return Try(db =>
            {
                db.Insert(category);

                return new RestResult
                {
                    Success = true,
                    Message = "New record is added",
                    Data = category
                };
            });
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public virtual RestResult Read()
        {
            return Try(db =>
            {
                return new RestResult
                {
                    Success = true,
                    Data = db.Select<T>()
                };
            });
        }

        [AcceptVerbs(HttpVerbs.Put)]
        public virtual RestResult Update(T entity)
        {
            return Try(db =>
            {
                db.Update(entity);

                return new RestResult
                {
                    Success = true,
                    Message = "Record has been updated"
                };
            });
        }

        [AcceptVerbs(HttpVerbs.Delete)]
        public virtual RestResult Destroy(object id)
        {
            return Try(db =>
            {
                db.DeleteById<T>(id);

                return new RestResult
                {
                    Success = true,
                    Message = "Record has been deleted"
                };
            });
        }
    }
}