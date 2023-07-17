using CommunityToolkit.Mvvm.ComponentModel;


namespace Egorozh.PersonalApp.Models;


public partial class MainPageNavigationItem : BaseMainPageNavigationItem
{
    [ObservableProperty] private string _title;
    
    public MainPageNavigationItem(string title)
    {
        _title = title;
    }
}