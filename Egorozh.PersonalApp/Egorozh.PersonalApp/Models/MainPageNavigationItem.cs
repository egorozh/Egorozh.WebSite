using CommunityToolkit.Mvvm.ComponentModel;


namespace Egorozh.PersonalApp.Models;


public partial class MainPageNavigationItem : BaseMainPageNavigationItem
{
    private const string DefaultMainTitle = "На главную";
    
    private readonly string _initTitle;
    
    
    [ObservableProperty] private string _title;
    

    public MainPageNavigationItem(string title)
    {
        _title = title;
        _initTitle = title;
    }

    
    public void ToSmall()
    {
        Title = DefaultMainTitle;
    }
    
    
    public void ToNormal()
    {
        Title = _initTitle;
    }
}