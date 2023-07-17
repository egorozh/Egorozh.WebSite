using CommunityToolkit.Mvvm.ComponentModel;

namespace Egorozh.PersonalApp.ViewModels.Pages;

public partial class ContactsPageViewModel : BasePageViewModel
{
    [ObservableProperty] private string _mainText;


    public ContactsPageViewModel()
    {
        _mainText = "Мои контакты";
    }
}