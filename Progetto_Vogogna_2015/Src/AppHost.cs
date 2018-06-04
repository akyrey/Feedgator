using Progetto_Vogogna_2015.Models;
using ServiceStack;
using ServiceStack.Data;
using ServiceStack.OrmLite;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Progetto_Vogogna_2015
{
    class AppHost : AppHostBase
    {
        public AppHost()
            : base("Progetto_Vogogna_2015", typeof(AppHost).Assembly)
        { }

        public override void Configure(Funq.Container container)
        {
            var dbFactory = new OrmLiteConnectionFactory(ConfigurationManager.ConnectionStrings["default"].ConnectionString, MySqlDialect.Provider);
            container.Register<IDbConnectionFactory>(dbFactory);
        }
    }
}
