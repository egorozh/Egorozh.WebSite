using System;
using Autofac;
using Avalonia;
using Avalonia.ReactiveUI;
using Egorozh.PersonalApp.Desktop.Services;
using Egorozh.PersonalApp.Services;

namespace Egorozh.PersonalApp.Desktop;

class Program
{
    // Initialization code. Don't use any Avalonia, third-party APIs or any
    // SynchronizationContext-reliant code before AppMain is called: things aren't initialized
    // yet and stuff might break.
    [STAThread]
    public static void Main(string[] args) => BuildAvaloniaApp()
        .StartWithClassicDesktopLifetime(args);

    // Avalonia configuration, don't remove; also used by visual designer.
    public static AppBuilder BuildAvaloniaApp()
        => GetAppBuilder()
            .UsePlatformDetect()
            .WithInterFont()
            .LogToTrace()
            .UseReactiveUI();
    
    
    private static AppBuilder GetAppBuilder() => AppBuilder.Configure(GetApp);

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
        builder.RegisterType<DesktopOpenLinksService>().As<IOpenLinksService>().SingleInstance();
    }
}