using System.Collections.ObjectModel;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Egorozh.PersonalApp.Models;
using Egorozh.PersonalApp.Services;
using Egorozh.PersonalApp.ViewModels.Pages;
using Material.Icons;


namespace Egorozh.PersonalApp.ViewModels;


public partial class MainViewModel : ViewModelBase
{
   private const string DefaultAboutTitle = "Обо мне";
   private const string DefaultMyProjectsTitle = "Мои проекты";
   private const string DefaultContactsTitle = "Контакты";
   private const string DefaultHobbyTitle = "Хобби";
   
   private const string DefaultMainTitle = "На главную";
   
   private readonly IOpenLinksService _openLinksService;
   
   [ObservableProperty] private BasePageViewModel _currentPage;
   
   [ObservableProperty] private ObservableCollection<BaseMainPageNavigationItem> _navigationItems;
   
   
   public MainViewModel(IOpenLinksService openLinksService)
   {
      _openLinksService = openLinksService;
      _currentPage = new MainPageViewModel();

      _navigationItems = new ObservableCollection<BaseMainPageNavigationItem>(new BaseMainPageNavigationItem[]
      {
         new MainPageNavigationItem(DefaultAboutTitle),
         new MainPageNavigationItem(DefaultMyProjectsTitle),
         new MainPageNavigationItem(DefaultContactsTitle),
         new MainPageNavigationItem(DefaultHobbyTitle),
         new MainPageNavigationIconItem(MaterialIconKind.Youtube),
         new MainPageNavigationIconItem(MaterialIconKind.Github)
      });
   }
   

   [RelayCommand]
   private void NavigateToPage(BaseMainPageNavigationItem navigationItem)
   {
      if (navigationItem is MainPageNavigationItem pageItem)
      {
         NavigateToPage(pageItem);
         return;
      }
      
      if (navigationItem is MainPageNavigationIconItem iconItem)
      {
         if (iconItem.Icon == MaterialIconKind.Youtube)
         {
            const string youtubeChannelUrl = "https://www.youtube.com/channel/UCWCJJPy6o9E6ZoWTnF6JKsQ";
            
            _openLinksService.Open(youtubeChannelUrl);
            
            return;
         }

         if (iconItem.Icon == MaterialIconKind.Github)
         {
            const string githubUrl = "https://github.com/egorozh";
            
            _openLinksService.Open(githubUrl);
         }
      }
   }


   private void NavigateToPage(MainPageNavigationItem pageItem)
   {
      BasePageViewModel pageVm = pageItem.Title switch
      {
         DefaultAboutTitle => new AboutPageViewModel(),
         DefaultMyProjectsTitle => new MyProjectsPageViewModel(),
         DefaultContactsTitle => new ContactsPageViewModel(),
         DefaultHobbyTitle => new HobbyPageViewModel(),
         
         _ => new MainPageViewModel()
      };


      CurrentPage = pageVm;
   }
}