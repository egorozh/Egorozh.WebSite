using CommunityToolkit.Mvvm.ComponentModel;

namespace Egorozh.PersonalApp.ViewModels.Pages;

public partial class HobbyPageViewModel : BasePageViewModel
{
    [ObservableProperty] private string _mainText;


    public HobbyPageViewModel()
    {
        _mainText = "Мои увлечения";
    }
}