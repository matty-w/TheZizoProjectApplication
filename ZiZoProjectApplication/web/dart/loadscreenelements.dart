
import 'dart:html';
import 'listentobuttons.dart';
import 'package:ServerFunctions/ServerFunctions.dart';

class LoadScreenElements
{
  LoadFunctions lf = new LoadFunctions();
  ListenToButtons ltb = new ListenToButtons();
  
  void loginPage()
  {
    ltb.listenToLoginButtons();
  }
  
  void addProject()
  {
    ltb.listenToAddProjectButtons();
    window.onLoad.listen((Event e) => lf.loadPluginsAndDescriptions("#pluginsLeft", "#pluginDescription"));
  }
  
  void editProject()
  {
    window.onLoad.listen((Event e) => lf.loadSelectElementProjects("#projectDropDown"));
    //window.onLoad.listen((Event e) => lf.loadPluginsAndDescriptions("#pluginsLeft", "#pluginDescription"));
    ltb.listenToEditProjectButtons();
  }
  
  void deleteProject()
  {
    window.onLoad.listen((Event e) => lf.loadSelectElementProjects("#projectNames"));
    ltb.listenToDeleteProjectButtons();
  }
  
  void addUsers()
  {
    window.onLoad.listen((Event e) => lf.loadDatasetProjects("#projectNames"));
    ltb.listenToAddUserButtons();
  }
  
  void secureProject()
  {
    window.onLoad.listen((Event e) => lf.loadDatasetProjects("#projectNames"));
    ltb.listenToSecureProjectButtons();
  }
  
  void tagFolders()
  {
    ltb.listenToTagFolderButtons();
  }
}