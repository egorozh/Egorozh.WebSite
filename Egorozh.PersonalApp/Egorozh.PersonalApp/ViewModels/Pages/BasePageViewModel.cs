using System;
using CommunityToolkit.Mvvm.Input;


namespace Egorozh.PersonalApp.ViewModels.Pages;


public abstract partial class BasePageViewModel : ViewModelBase
{
    public event EventHandler Closed;


    [RelayCommand]
    private void Close() => Closed?.Invoke(this, EventArgs.Empty);
}