using CommunityToolkit.Mvvm.ComponentModel;

namespace Egorozh.PersonalApp.ViewModels.Pages;

public partial class MainPageViewModel : BasePageViewModel
{
    [ObservableProperty] private string _mainText;
    

    public MainPageViewModel()
    {
        _mainText = "Всем привет!\r\nМеня зовут Егор. Добро пожаловать на мой сайт";
    }
}