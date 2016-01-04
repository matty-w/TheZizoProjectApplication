
import 'dart:html';
import 'package:ServerFunctions/ServerFunctions.dart';
import 'package:PopupLibrary/PopupLibrary.dart';

class ListenToButtons
{
  NavigationFunctions navigate = new NavigationFunctions();
  PopupConstructor pc = new PopupConstructor();
  
  void listenToLoginButtons()
  {
    querySelector("#submitButton").onClick.listen();
    querySelector("#dismissFinal").onClick.listen(pc.dismissBasicPrompt);
  }
}