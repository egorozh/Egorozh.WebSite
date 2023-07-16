using CommunityToolkit.Mvvm.ComponentModel;
using Egorozh.PersonalApp.ViewModels.Pages;

namespace Egorozh.PersonalApp.ViewModels;


public partial class MainViewModel : ViewModelBase
{
   [ObservableProperty] private BasePageViewModel _currentPage;




   public MainViewModel()
   {
      _currentPage = new MainPageViewModel();
   }
}