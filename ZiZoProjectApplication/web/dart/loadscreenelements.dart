
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
    ltb.listenToEditProjectButtons();
  }
  
  void deleteProject()
  {
    LoadFunctions lf = new LoadFunctions();
    window.onLoad.listen(lf.loadDatasetProjects);
    ltb.listenToDeleteProjectButtons();
  }
  
  void addUsers()
  {
    ltb.listenToAddUserButtons();
  }
  
  void secureProject()
  {
    ltb.listenToSecureProjectButtons();
  }
  
  void tagFolders()
  {
    ltb.listenToTagFolderButtons();
  }
}