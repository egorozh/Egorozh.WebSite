using Egorozh.PersonalApp.Desktop.Services;
using Egorozh.PersonalApp.IoC;
using Egorozh.PersonalApp.Services;
using Egorozh.PersonalApp.ViewModels;
using Jab;

namespace Egorozh.PersonalApp.Desktop;


[ServiceProvider]
[Singleton(typeof(IOpenLinksService), typeof(DesktopOpenLinksService))]
[Import<ICoreModule>]
internal partial class MyServiceProvider: IMainViewModelResolver
{
    public MainViewModel GetRootModel()
    {
        return GetService<MainViewModel>();
    }
}