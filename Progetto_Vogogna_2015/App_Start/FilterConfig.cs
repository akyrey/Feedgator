using System.Web;
using System.Web.Mvc;

namespace Progetto_Vogogna_2015
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
