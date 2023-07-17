using CommunityToolkit.Mvvm.ComponentModel;

namespace Egorozh.PersonalApp.ViewModels.Pages;

public partial class MyProjectsPageViewModel : BasePageViewModel
{
    [ObservableProperty] private string _mainText;


    public MyProjectsPageViewModel()
    {
        _mainText = "Мои проекты";
    }
}