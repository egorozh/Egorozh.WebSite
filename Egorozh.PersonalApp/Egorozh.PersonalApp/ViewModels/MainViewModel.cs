using System;
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
   
   
   private readonly IOpenLinksService _openLinksService;
   
   [ObservableProperty] private BasePageViewModel? _currentPage;
   
   [ObservableProperty] private ObservableCollection<BaseMainPageNavigationItem> _navigationItems;
   
   [ObservableProperty] private bool _isMainPage;
   
   
   public MainViewModel(IOpenLinksService openLinksService)
   {
      _openLinksService = openLinksService;
      
      const string youtubeChannelUrl = "https://www.youtube.com/channel/UCWCJJPy6o9E6ZoWTnF6JKsQ";
      const string githubUrl = "https://github.com/egorozh";
      
      _navigationItems = new ObservableCollection<BaseMainPageNavigationItem>(new BaseMainPageNavigationItem[]
      {
         new MainPageNavigationItem(DefaultAboutTitle),
         new MainPageNavigationItem(DefaultMyProjectsTitle),
         new MainPageNavigationItem(DefaultContactsTitle),
         new MainPageNavigationItem(DefaultHobbyTitle),
         new MainPageNavigationIconItem(MaterialIconKind.Youtube, youtubeChannelUrl),
         new MainPageNavigationIconItem(MaterialIconKind.Github, githubUrl)
      });

      _isMainPage = true;
      _currentPage = new MainPageViewModel();
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
         _openLinksService.Open(iconItem.LinkUrl);
      }
   }


   private void NavigateToPage(MainPageNavigationItem pageItem)
   {
      ResetNavigationItems();
      
      BasePageViewModel pageVm = pageItem.Title switch
      {
         DefaultAboutTitle      => new AboutPageViewModel(),
         DefaultMyProjectsTitle => new MyProjectsPageViewModel(),
         DefaultContactsTitle   => new ContactsPageViewModel(),
         DefaultHobbyTitle      => new HobbyPageViewModel(),
         
         _ => new MainPageViewModel()
      };

      pageItem.ToSmall();
      
      CurrentPage = pageVm;
   }


   partial void OnCurrentPageChanging(BasePageViewModel? value)
   {
      BasePageViewModel? oldPage = CurrentPage;

      if (oldPage is not null)
      {
         oldPage.Closed -= OldPageOnClosed;
      }

      if (value != null)
      {
         value.Closed += OldPageOnClosed;
      }
   }

   
   private void OldPageOnClosed(object? sender, EventArgs e)
   {
      CurrentPage = new MainPageViewModel();
      IsMainPage = true;

      ResetNavigationItems();
   }


   private void ResetNavigationItems()
   {
      foreach (var navigationItem in NavigationItems)
      {
         if (navigationItem is MainPageNavigationItem mainPageNavigationItem)
            mainPageNavigationItem.ToNormal();
      }
   }
}