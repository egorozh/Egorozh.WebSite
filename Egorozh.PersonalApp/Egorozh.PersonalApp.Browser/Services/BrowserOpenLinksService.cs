using System.Runtime.InteropServices.JavaScript;
using Egorozh.PersonalApp.Services;


namespace Egorozh.PersonalApp.Browser.Services;


public partial class BrowserOpenLinksService : IOpenLinksService
{
    public BrowserOpenLinksService()
    {
        Initialize();
    }


    private static async void Initialize()
    {
        await JSHost.ImportAsync("Egorozh.PersonalApp.Browser/AppBundle/services.js", "./services.js");
    }
    
    
    public void Open(string url)
    {
        Interop.OpenUrl(url);
    }

    
    private static partial class Interop
    {
        [JSImport("openUrl", "Egorozh.PersonalApp.Browser/AppBundle/services.js")]
        public static partial void OpenUrl(string url);
    }
}