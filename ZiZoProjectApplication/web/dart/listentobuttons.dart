
import 'dart:html';
import 'package:ServerFunctions/ServerFunctions.dart';
import 'package:PopupLibrary/PopupLibrary.dart';

class ListenToButtons
{
  NavigationFunctions navigate = new NavigationFunctions();
  PopupConstructor pc = new PopupConstructor();
  AddProject ap = new AddProject();
  AddRemoveUserToProject arutp = new AddRemoveUserToProject();
  DeleteProject dp = new DeleteProject();
  OnLoadProject olp = new OnLoadProject();
  ProjectSecurity ps = new ProjectSecurity();
  EditProjectDetails epd = new EditProjectDetails();
  ProjectActionFunctions paf = new ProjectActionFunctions();
  
  
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
    querySelector("#addFolderButton").onClick.listen((MouseEvent m) => goToPage("addFolder"));
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
    querySelector("#pluginsLeft").onClick.listen((MouseEvent m) => 
        paf.checkForSelectedHelperLeft("#pluginsLeft", "#pluginsRight", "#pluginDescription"));
    querySelector("#pluginsRight").onClick.listen((MouseEvent m) =>
        paf.checkForSelectedHelperRight("#pluginsLeft", "#pluginsRight", "#pluginDescription"));
    querySelector("#cancelExplorer").onClick.listen(hideExplorer);
    
    querySelector("#no").onClick.listen(pc.dismissBasicPrompt);
    querySelector("#ok").onClick.listen(pc.dismissBasicPromptReload);
    querySelector("#dismissFinal").onClick.listen(pc.dismissBasicPrompt);
    
    toRight.onClick.listen((MouseEvent m) => paf.moveToRight("#pluginsLeft", "#pluginsRight"));
    toLeft.onClick.listen((MouseEvent m) => paf.moveToLeft("#pluginsLeft", "#pluginsRight"));
    querySelector("#defaultProjectSubmitButtonSmall").onClick.listen((MouseEvent m) => ap.addProject("#projName", "#projLocation", "#pluginsRight"));
    navigationButtons();
  }
  
  void listenToEditProjectButtons()
  {
    querySelector("#no").onClick.listen(pc.dismissBasicPrompt);
    querySelector("#ok").onClick.listen(pc.dismissBasicPromptReload);
    querySelector("#dismissFinal").onClick.listen(pc.dismissBasicPrompt);
    
    querySelector("#projectDropDown").onChange.listen((Event e) => olp.loadProjectDetails("#projName", "#projDescription"));
    querySelector("#defaultProjectSubmitButtonSmall").onClick.listen((MouseEvent m) => 
        epd.editProjectDetails("#projectDropDown", "#projName", "#projDescription", "#pluginsRight"));
    navigationButtons();
  }
  
  void listenToDeleteProjectButtons()
  {
    querySelector("#no").onClick.listen(pc.dismissBasicPrompt);
    querySelector("#ok").onClick.listen(pc.dismissBasicPromptReload);
    querySelector("#dismissFinal").onClick.listen(pc.dismissBasicPrompt);
    
    querySelector("#defaultProjectSubmitButton2").onClick.listen((MouseEvent m) => dp.deleteProject("#projectNames"));
    
    navigationButtons();
  }
  
  void listenToAddRemoveUserButtons()
  {
    querySelector("#projectAddRemoveUser").onChange.listen((Event e) => 
        arutp.togglePermissionsBox("#projectAddRemoveUser", "#projectPermissions"));
    querySelector("#no").onClick.listen(pc.dismissBasicPrompt);
    querySelector("#ok").onClick.listen(pc.dismissBasicPromptReload);
    querySelector("#dismissFinal").onClick.listen(pc.dismissBasicPrompt);
    querySelector("#defaultProjectSubmitButton2").onClick.listen((MouseEvent m) => 
        arutp.addRemoveUserToProject("#projectNames", "#projAddUser", "#projectPermissions", "#projectAddRemoveUser"));
    navigationButtons();
  }
  
  void listenToSecureProjectButtons()
  {
    querySelector("#no").onClick.listen(pc.dismissBasicPrompt);
    querySelector("#ok").onClick.listen(pc.dismissBasicPromptReload);
    querySelector("#dismissFinal").onClick.listen(pc.dismissBasicPrompt);
    querySelector("#defaultProjectSubmitButton2").onClick.listen((MouseEvent m) => 
        ps.secureOrUnsecureProject("#secureProjectDropdown", "#projectDropDownLarge", "#usernameOutput"));
    navigationButtons();
  }
  
  void listenToAddFolderButtons()
  {
    querySelector("#no").onClick.listen(pc.dismissBasicPrompt);
    querySelector("#ok").onClick.listen(pc.dismissBasicPromptReload);
    querySelector("#dismissFinal").onClick.listen(pc.dismissBasicPrompt);
    querySelector("#projectMakeSubFolder").onChange.listen((Event e) => 
        paf.displayHiddenDropDown("#hiddenFolderPrompt", "#projectMakeSubFolder"));
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
    if(pageDestination == "addFolder")
      window.location.href = "addfolders.html";
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