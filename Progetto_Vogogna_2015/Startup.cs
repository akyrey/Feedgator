using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Progetto_Vogogna_2015.Startup))]
namespace Progetto_Vogogna_2015
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
