using CommunityToolkit.Mvvm.ComponentModel;

namespace Egorozh.PersonalApp.ViewModels.Pages;

public partial class AboutPageViewModel : BasePageViewModel
{
    [ObservableProperty] private string _mainText;


    public AboutPageViewModel()
    {
        _mainText = "Обо мне";
    }
}