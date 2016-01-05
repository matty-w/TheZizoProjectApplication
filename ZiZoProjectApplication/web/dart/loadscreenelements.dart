
import 'listentobuttons.dart';

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