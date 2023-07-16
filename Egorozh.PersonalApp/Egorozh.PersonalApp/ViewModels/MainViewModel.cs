using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Egorozh.PersonalApp.Services;
using Egorozh.PersonalApp.ViewModels.Pages;


namespace Egorozh.PersonalApp.ViewModels;


public partial class MainViewModel : ViewModelBase
{
   private readonly IOpenLinksService _openLinksService;
   
   [ObservableProperty] private BasePageViewModel _currentPage;
   
   
   public MainViewModel(IOpenLinksService openLinksService)
   {
      _openLinksService = openLinksService;
      _currentPage = new MainPageViewModel();
   }


   [RelayCommand]
   private void OpenGithubProfile()
   {
      const string githubUrl = "https://github.com/egorozh";
      
      
      _openLinksService.Open(githubUrl);
   }
      
   
   [RelayCommand]
   private void OpenYoutubeChannel()
   {
      const string youtubeChannelUrl = "https://www.youtube.com/channel/UCWCJJPy6o9E6ZoWTnF6JKsQ";
      
      
      _openLinksService.Open(youtubeChannelUrl);
   }
}