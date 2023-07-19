using Material.Icons;


namespace Egorozh.PersonalApp.Models;


public class MainPageNavigationIconItem : BaseMainPageNavigationItem
{
    public MaterialIconKind Icon { get; }

    public string LinkUrl { get; }

    
    public MainPageNavigationIconItem(MaterialIconKind icon, string linkUrl)
    {
        Icon = icon;
        LinkUrl = linkUrl;
    }
}