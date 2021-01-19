import 'dart:async';

class LoginBLoC {
  StreamController _userStreamController = new StreamController();
  StreamController _passwordStreamController = new StreamController();

  Stream get usernameStream => _userStreamController.stream;

  Stream get passwordStream => _passwordStreamController.stream;

  bool isDataValid(String userName,String password){
   if(userName.length<3){
        _userStreamController.sink.addError("Username invalid");
        return false;
   }
   _userStreamController.add("OK");
   if(password.length<5){
        _passwordStreamController.sink.addError("Password invalid");
        return false;
      }
   _passwordStreamController.add("OK");
   return true;
  }

}