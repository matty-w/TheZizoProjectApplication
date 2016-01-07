
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
    querySelector("#someSelect1").onClick.listen(checkForSelectedHelperLeft);
    querySelector("#someSelect2").onClick.listen(checkForSelectedHelperRight);
    toRight.onClick.listen(moveToRight);
    toLeft.onClick.listen(moveToLeft);
    navigationButtons();
  }
  
  void moveToRight(MouseEvent m)
  {
    SelectElement helpers = querySelector("#someSelect1");
    SelectElement selectedHelpers = querySelector("#someSelect2");
    for(int i = 0; i < helpers.length; i++)
    {
      if(helpers.options[i].selected)
      {
        var option = document.createElement("option");
        option.text = helpers.options[i].innerHtml;
        selectedHelpers.add(option,-1);
        helpers.options[i].remove();
      }
    }
  }
  
  void moveToLeft(MouseEvent m)
  {
    SelectElement removedHelpers = querySelector("#someSelect1");
    SelectElement helpers = querySelector("#someSelect2");
    for(int i = 0; i < helpers.length; i++)
    {
      if(helpers.options[i].selected)
      {
        var option = document.createElement("option");
        option.text = helpers.options[i].innerHtml;
        removedHelpers.add(option,-1);
        helpers.options[i].remove();
      }
    }
  }
  
  void checkForSelectedHelperLeft(MouseEvent m)
  {
    SelectElement helpers = querySelector("#someSelect1");
    SelectElement selectedHelpers = querySelector("#someSelect2");
    
    for(int i = 0; i < helpers.length; i++)
    {
      if(helpers.options[i].selected)
      {
        showOptionDescription(helpers.options[i].innerHtml);
        for(int i = 0; i < selectedHelpers.length; i++)
        {
          selectedHelpers.options[i].selected = false;
        }
      }
    }
  }
  
  void showOptionDescription(String option)
  {
    if(option == "something1")
    {
      TextAreaElement text = querySelector("#someText");
      text.value = "Some description about something1";
    }
    if(option == "something2")
    {
      TextAreaElement text = querySelector("#someText");
      text.value = "Some description about something2";
    }
    if(option == "something3")
    {
      TextAreaElement text = querySelector("#someText");
      text.value = "Some description about something3";
    }
  }
  
  void checkForSelectedHelperRight(MouseEvent m)
  {
    SelectElement helpers = querySelector("#someSelect2");
    SelectElement selectedHelpers = querySelector("#someSelect1");
    
    for(int i = 0; i < helpers.length; i++)
    {
      if(helpers.options[i].selected)
      {
        showOptionDescription(helpers.options[i].innerHtml);
        for(int i = 0; i < selectedHelpers.length; i++)
        {
          selectedHelpers.options[i].selected = false;
        }
      }
    }
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