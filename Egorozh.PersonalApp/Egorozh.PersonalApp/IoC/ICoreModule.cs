using Egorozh.PersonalApp.ViewModels;
using Jab;

namespace Egorozh.PersonalApp.IoC;


[ServiceProviderModule]
[Singleton(typeof(MainViewModel), typeof(MainViewModel))]
public interface ICoreModule
{
}

public interface IMainViewModelResolver
{
    MainViewModel GetRootModel();
}