using System;
using Autofac;
using Avalonia;
using Avalonia.Controls.ApplicationLifetimes;
using Avalonia.Markup.Xaml;
using Egorozh.PersonalApp.ViewModels;
using Egorozh.PersonalApp.Views;

namespace Egorozh.PersonalApp;

public class App : Application
{
    public override void Initialize()
    {
        AvaloniaXamlLoader.Load(this);
    }

    public override void OnFrameworkInitializationCompleted()
    {
        var builder = new IoC.IoC().InitBuilder();

        builder.RegisterType<MainViewModel>().AsSelf().SingleInstance();
        
        RegisterServicesAction?.Invoke(builder);
        
        var container = builder.Build();
        
        if (ApplicationLifetime is IClassicDesktopStyleApplicationLifetime desktop)
        {
            desktop.MainWindow = new MainWindow
            {
                DataContext = container.Resolve<MainViewModel>()
            };
        }
        else if (ApplicationLifetime is ISingleViewApplicationLifetime singleViewPlatform)
        {
            singleViewPlatform.MainView = new MainView
            {
                DataContext = container.Resolve<MainViewModel>()
            };
        }

        base.OnFrameworkInitializationCompleted();
    }

    
    public Action<ContainerBuilder> RegisterServicesAction { get; set; }
}