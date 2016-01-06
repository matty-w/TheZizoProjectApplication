
import 'dart:html';
import 'package:ServerFunctions/ServerFunctions.dart';
import 'package:PopupLibrary/PopupLibrary.dart';

class ListenToButtons
{
  NavigationFunctions navigate = new NavigationFunctions();
  PopupConstructor pc = new PopupConstructor();
  
  void navigationButtons()
  {
    if(window.sessionStorage['username'] == null || window.sessionStorage['username'] == "")
    {
      navigate.goToIndexPage();
    }
    querySelector("#usernameOutput").innerHtml = window.sessionStorage['username'];
    querySelector("#addProjectButton").onClick.listen((MouseEvent m) => goToPage("addProject"));
    querySelector("#editProjectButton").onClick.listen((MouseEvent m) => goToPage("editProject"));
    querySelector("#deleteProjectButton").onClick.listen((MouseEvent m) => goToPage("deleteProject"));
    querySelector("#usersProjectButton").onClick.listen((MouseEvent m) => goToPage("addUsers"));
    querySelector("#secureProjectButton").onClick.listen((MouseEvent m) => goToPage("secureProject"));
    querySelector("#tagProjectButton").onClick.listen((MouseEvent m) => goToPage("tagProject"));
    querySelector("#logoutButton").onClick.listen(navigate.logoutProject);
  }
  
  void listenToLoginButtons()
  {
    querySelector("#submitButton").onClick.listen(navigate.loginProject);
    querySelector("#dismissFinal").onClick.listen(pc.dismissBasicPrompt);
  }
  
  void listenToAddProjectButtons()
  {
    ButtonElement toRight = querySelector("#toRightButton");
    ButtonElement toLeft = querySelector("#toLeftButton");
    toRight.innerHtml = ">>";
    toLeft.innerHtml = "<<";
    toRight.onClick.listen(test);
    navigationButtons();
  }
  
  void test(MouseEvent m)
  {
    window.alert("hi!");
  }
  
  void listenToEditProjectButtons()
  {
    navigationButtons();
  }
  
  void listenToDeleteProjectButtons()
  {
    navigationButtons();
  }
  
  void listenToAddUserButtons()
  {
    navigationButtons();
  }
  
  void listenToSecureProjectButtons()
  {
    navigationButtons();
  }
  
  void listenToTagFolderButtons()
  {
    navigationButtons();
  }
  
  void goToPage(String pageDestination)
  {
    if(pageDestination == "addProject")
      window.location.href = "addproject.html";
    if(pageDestination == "editProject")
      window.location.href = "editproject.html";
    if(pageDestination == "deleteProject")
      window.location.href = "deleteproject.html";
    if(pageDestination == "addUsers")
      window.location.href = "addusers.html";
    if(pageDestination == "secureProject")
      window.location.href = "secureproject.html";
    if(pageDestination == "tagProject")
      window.location.href = "tagfolders.html";
  }
}