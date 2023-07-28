using System.Runtime.Versioning;
using System.Threading.Tasks;
using Avalonia;
using Avalonia.Browser;
using Avalonia.ReactiveUI;

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
            ServiceProvider = new MyServiceProvider()
        };

        return app;
    }
}