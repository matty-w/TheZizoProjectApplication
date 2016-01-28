
import 'dart:html';
import 'package:ServerFunctions/ServerFunctions.dart';
import 'package:PopupLibrary/PopupLibrary.dart';

class ListenToButtons
{
  NavigationFunctions navigate = new NavigationFunctions();
  PopupConstructor pc = new PopupConstructor();
  AddProject ap = new AddProject();
  DeleteProject dp = new DeleteProject();
  LoadFunctions lf = new LoadFunctions();
  
  
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
    InputElement toRight = querySelector("#toRightButton");
    InputElement toLeft = querySelector("#toLeftButton");
    querySelector("#pluginsLeft").onClick.listen(checkForSelectedHelperLeft);
    querySelector("#pluginsRight").onClick.listen(checkForSelectedHelperRight);
    querySelector("#browseButton2").onClick.listen(showFileExplorer);
    querySelector("#cancelExplorer").onClick.listen(hideExplorer);
    
    querySelector("#no").onClick.listen(pc.dismissBasicPrompt);
    querySelector("#ok").onClick.listen(pc.dismissBasicPromptReload);
    querySelector("#dismissFinal").onClick.listen(pc.dismissBasicPrompt);
    
    toRight.onClick.listen(moveToRight);
    toLeft.onClick.listen(moveToLeft);
    querySelector("#addProjectSubmitButton").onClick.listen(ap.addProject);
    navigationButtons();
  }
  
  void moveToRight(MouseEvent m)
  {
    SelectElement helpers = querySelector("#pluginsLeft");
    SelectElement selectedHelpers = querySelector("#pluginsRight");
    for(int i = 0; i < helpers.length; i++)
    {
      if(helpers.options[i].selected)
      {
        String id = helpers.options[i].id;
        OptionElement option = new OptionElement();
        option.text = helpers.options[i].innerHtml;
        option.text = helpers.options[i].innerHtml;
        option.id = id;
        selectedHelpers.add(option,-1);
        helpers.options[i].remove();
      }
    }
  }
  
  void moveToLeft(MouseEvent m)
  {
    SelectElement removedHelpers = querySelector("#pluginsLeft");
    SelectElement helpers = querySelector("#pluginsRight");
    for(int i = 0; i < helpers.length; i++)
    {
      if(helpers.options[i].selected)
      {
        String id = helpers.options[i].id;
        OptionElement option = new OptionElement();
        option.text = helpers.options[i].innerHtml;
        option.id = id;
        removedHelpers.add(option,-1);
        helpers.options[i].remove();
      }
    }
  }
  
  void checkForSelectedHelperLeft(MouseEvent m)
  {
    SelectElement helpers = querySelector("#pluginsLeft");
    SelectElement selectedHelpers = querySelector("#pluginsRight");
    
    for(int i = 0; i < helpers.length; i++)
    {
      if(helpers.options[i].selected)
      {
        displayDescription(helpers.options[i].id, "#pluginDescription");
        for(int i = 0; i < selectedHelpers.length; i++)
        {
          selectedHelpers.options[i].selected = false;
        }
      }
    }
  }
  
  void checkForSelectedHelperRight(MouseEvent m)
  {
    SelectElement helpers = querySelector("#pluginsRight");
    SelectElement selectedHelpers = querySelector("#pluginsLeft");
    
    for(int i = 0; i < helpers.length; i++)
    {
      if(helpers.options[i].selected)
      {
        displayDescription(helpers.options[i].id, "#pluginDescription");
        for(int i = 0; i < selectedHelpers.length; i++)
        {
          selectedHelpers.options[i].selected = false;
        }
      }
    }
  }
  
  void displayDescription(String pluginId, String descriptionIdentifier)
  {
    lf.loadPluginDescriptors(pluginId, descriptionIdentifier);
  }

  void test(MouseEvent m)
  {
    window.alert("hi!");
  }
  
  void listenToEditProjectButtons()
  {
    querySelector("#projectDropDown").onChange.listen((Event e) => lf.loadProjectDetails("#projName", "#projDescription"));
    navigationButtons();
  }
  
  void listenToDeleteProjectButtons()
  {
    querySelector("#no").onClick.listen(pc.dismissBasicPrompt);
    querySelector("#ok").onClick.listen(pc.dismissBasicPromptReload);
    querySelector("#dismissFinal").onClick.listen(pc.dismissBasicPrompt);
    
    querySelector("#defaultProjectSubmitButton").onClick.listen(dp.deleteProject);
    
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
  
  void showFileExplorer(MouseEvent m)
  {
    PopupSelection ps = new PopupSelection();
    ps.fileExplorerPopup();
  }  
  
  void hideExplorer(MouseEvent m)
  {
    SelectElement fileFilter = querySelector("#fileTypeDropDown");
    fileFilter.disabled = true;
    pc.dismiss("#fileBrowserDiv");
  }
}