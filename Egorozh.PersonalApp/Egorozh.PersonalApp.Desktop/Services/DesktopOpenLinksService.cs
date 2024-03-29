﻿using System.Diagnostics;
using Egorozh.PersonalApp.Services;


namespace Egorozh.PersonalApp.Desktop.Services;


public class DesktopOpenLinksService : IOpenLinksService
{
    public void Open(string url)
    {
        Process.Start(new ProcessStartInfo
        {
            FileName = url,
            UseShellExecute = true
        });
    }
}