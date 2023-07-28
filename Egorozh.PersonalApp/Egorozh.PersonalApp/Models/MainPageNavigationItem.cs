using CommunityToolkit.Mvvm.ComponentModel;


namespace Egorozh.PersonalApp.Models;


public partial class MainPageNavigationItem : BaseMainPageNavigationItem
{
    private const string DefaultMainTitle = "На главную";
    
    private readonly string _initTitle;
    
    
    [ObservableProperty] private string _title;
    
    
    public bool IsHome { get; set; }
    

    public MainPageNavigationItem(string title)
    {
        _title = title;
        _initTitle = title;
    }

    
    public void ToHome()
    {
        Title = DefaultMainTitle;
        IsHome = true;
    }


    public void ToNormal()
    {
        Title = _initTitle;
        IsHome = false;
    }
}