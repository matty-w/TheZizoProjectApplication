
import 'dart:html';
import 'listentobuttons.dart';
import 'package:ServerFunctions/ServerFunctions.dart';

class LoadScreenElements
{
  OnLoadProject olp = new OnLoadProject();
  ListenToButtons ltb = new ListenToButtons();
  
  void loginPage()
  {
    ltb.listenToLoginButtons();
  }
  
  void addProject()
  {
    ltb.listenToAddProjectButtons();
    window.onLoad.listen((Event e) => olp.loadPluginsAndDescriptions("#pluginsLeft", "#pluginDescription"));
  }
  
  void editProject()
  {
    window.onLoad.listen((Event e) => olp.loadSelectElementProjects("#projectDropDown", true));
    //window.onLoad.listen((Event e) => lf.loadPluginsAndDescriptions("#pluginsLeft", "#pluginDescription"));
    ltb.listenToEditProjectButtons();
  }
  
  void deleteProject()
  {
    window.onLoad.listen((Event e) => olp.loadSelectElementProjects("#projectNames", false));
    ltb.listenToDeleteProjectButtons();
  }
  
  void addUsers()
  {
    window.onLoad.listen((Event e) => olp.loadSelectElementProjects("#projectNames", false));
    ltb.listenToAddRemoveUserButtons();
  }
  
  void secureProject()
  {
    window.onLoad.listen((Event e) => olp.loadSelectElementProjects("#projectDropDownLarge", false));
    ltb.listenToSecureProjectButtons();
  }
  
  void addFolder()
  {
    window.onLoad.listen((Event e) => olp.loadSelectElementProjects("#projectNames", false));
    ltb.listenToAddFolderButtons();
  }
  
  void tagFolders()
  {
    ltb.listenToTagFolderButtons();
  }
}