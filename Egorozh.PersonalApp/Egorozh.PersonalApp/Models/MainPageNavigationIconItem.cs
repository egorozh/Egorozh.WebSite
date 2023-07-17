using Material.Icons;

namespace Egorozh.PersonalApp.Models;

public class MainPageNavigationIconItem : BaseMainPageNavigationItem
{
    public MaterialIconKind Icon { get; }

    
    public MainPageNavigationIconItem(MaterialIconKind icon)
    {
        Icon = icon;
    }
}