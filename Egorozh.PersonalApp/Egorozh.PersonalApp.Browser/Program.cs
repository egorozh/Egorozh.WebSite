using System.Runtime.Versioning;
using System.Threading.Tasks;
using Autofac;
using Avalonia;
using Avalonia.Browser;
using Avalonia.ReactiveUI;
using Egorozh.PersonalApp.Browser.Services;
using Egorozh.PersonalApp.Services;

[assembly: SupportedOSPlatform("browser")]


namespace Egorozh.PersonalApp.Browser;


internal class Program
{
    private static async Task Main(string[] args) => await BuildAvaloniaApp()
        .WithInterFont()
        .UseReactiveUI()
        .StartBrowserAppAsync("out");

    private static AppBuilder BuildAvaloniaApp() => AppBuilder.Configure(GetApp);

    private static App GetApp()
    {
        var app = new App
        {
            RegisterServicesAction = RegisterServices
        };

        return app;
    }


    private static void RegisterServices(ContainerBuilder builder)
    {
        builder.RegisterType<BrowserOpenLinksService>().As<IOpenLinksService>().SingleInstance();
    }
}