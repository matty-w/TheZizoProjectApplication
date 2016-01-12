
import 'dart:html';
import 'listentobuttons.dart';
import 'package:ServerFunctions/ServerFunctions.dart';

class LoadScreenElements
{
  ListenToButtons ltb = new ListenToButtons();
  
  void loginPage()
  {
    ltb.listenToLoginButtons();
  }
  
  void addProject()
  {
    ltb.listenToAddProjectButtons();
  }
  
  void editProject()
  {
    LoadFunctions lf = new LoadFunctions();
    window.onLoad.listen((Event e) => lf.loadSelectElementProjects("#projectDropDown"));
    ltb.listenToEditProjectButtons();
  }
  
  void deleteProject()
  {
    LoadFunctions lf = new LoadFunctions();
    window.onLoad.listen((Event e) => lf.loadDatasetProjects("#projectNames"));
    ltb.listenToDeleteProjectButtons();
  }
  
  void addUsers()
  {
    LoadFunctions lf = new LoadFunctions();
    window.onLoad.listen((Event e) => lf.loadDatasetProjects("#projectNames"));
    ltb.listenToAddUserButtons();
  }
  
  void secureProject()
  {
    LoadFunctions lf = new LoadFunctions();
    window.onLoad.listen((Event e) => lf.loadDatasetProjects("#projectNames"));
    ltb.listenToSecureProjectButtons();
  }
  
  void tagFolders()
  {
    ltb.listenToTagFolderButtons();
  }
}