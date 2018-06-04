using ServiceStack.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Progetto_Vogogna_2015.Controllers
{
    public abstract class BaseController : Controller
    {
        Funq.Container container;

        protected Funq.Container Container
        {
            get { return container ?? (container = AppHost.Instance.Container); }
        }

        protected IDbConnectionFactory DbFactory
        {
            get { return Container.Resolve<IDbConnectionFactory>(); }
        }
    }
}