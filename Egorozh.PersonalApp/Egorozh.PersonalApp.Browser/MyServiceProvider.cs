using Egorozh.PersonalApp.Browser.Services;
using Egorozh.PersonalApp.IoC;
using Egorozh.PersonalApp.Services;
using Egorozh.PersonalApp.ViewModels;
using Jab;


namespace Egorozh.PersonalApp.Browser;


[ServiceProvider]
[Singleton(typeof(IOpenLinksService), typeof(BrowserOpenLinksService))]
[Import<ICoreModule>]
internal partial class MyServiceProvider : IMainViewModelResolver
{
    public MainViewModel GetRootModel()
    {
        return GetService<MainViewModel>();
    }
}