
import 'listentobuttons.dart';

class LoadScreenElements
{
  ListenToButtons ltb = new ListenToButtons();
  
  void loginPage()
  {
    ltb.listenToLoginButtons();
  }
}