import 'dart:io';

void main() {

  String mail;
  String password;
  String username;
  String logUser;
  String logPass;


  print('\n');
  print("Welcome to the REGISTER PAGE! \nPlease enter your credentials for registration!");
  print("###Do not forget your username must include at least one digit, start with uppercase letter, username's length must be at least 8 characters \nThe password must include at least one uppercase letter, one digit, password's length must be at least 8 characters and include one symbol such as .,?*!@#%;:'");

  print('\n');

  /// REGISTRATION PAGE

  print("Please enter your email address: ");
  while(true) {
    mail = stdin.readLineSync()!;
    if(mail.isNotEmpty && emailMatch(mail) && !upperCaseMatch(mail) && !symbolMatch(mail[0]) && !mail.contains(' ')) { // null ola bilmez, simvol ile baslaya bilmez, @ ve . olmalidir, boyuk herf olmaz, arada bosluq olmaz
      print("Successful email address!\n");
      break;
    }
    print("Invalid email address!\n");
  }

  print("Please enter your username: ");
  while (true)
  {
    username = stdin.readLineSync()!;
    if(username.isNotEmpty && upperCaseMatch(username[0]) && !digitMatch(username[0]) && digitMatch(username) && !username.contains(' ') && username.length>=8) // boyuk herfle baslayir, en az 1 eded ehtiva edir, ilk character eded ola bilmez, arada bosluq olmaz, en az 8 character olmalidir, null ola bilmez
        {
      print("Successful username!\n");
      break;
    }
    print("Your username must include at least one digit, start with uppercase letter, username's length must be at least 8 characters\n");
  }

  print("Please enter your password: ");
  while (true) {
    password = stdin.readLineSync()!;
    if (password.isNotEmpty && password.length >= 8 && upperCaseMatch(password) && digitMatch(password) && symbolMatch(password)) {
      print("Successful password!\n");
      break;
    }
    print("Your password must include at least one uppercase letter, one digit, password's length must be at least 8 characters and include one symbol such as.,?*!@#%;:' etc.\n");
  }

  /// LOGIN PAGE


  print("Welcome to the LOGIN PAGE! \n");
  print("Please enter your username: ");
  while(true)
  {
    logUser = stdin.readLineSync()!;
    if(logUser==username)
    {
      print("Success!\n");
      break;
    }
    print("Incorrect username!\n");
  }

  print("Please enter your password: ");
  while(true)
  {
    logPass = stdin.readLineSync()!;
    if(logPass==password)
    {
      print("Success!\n");
      print("You have successfully entered!");
      break;
    }
    print("Incorrect password!\n");
  }


  /*
 String a = 'Hello';
  if(a[0].toUpperCase() == a[0] && !a[0].contains(RegExp(r'\d')))
    {
      print("hi");
    }
*/

}

bool upperCaseMatch(String psw)
{
  RegExp regExp = RegExp(r'[A-Z]'); // icinde boyuk herf olub olmadigini yoxlayir
  bool match = regExp.hasMatch(psw); // psw-nin icinde regExp varmi deye yoxlayir, varsa match-e true qaytarir
  return match;
}

bool digitMatch(String psw)
{
  RegExp regExp = RegExp(r'\d'); // icinde eded olub olmadigini yoxlayir
  bool match = regExp.hasMatch(psw); // psw-nin icinde regExp varmi deye yoxlayir, varsa match-e true qaytarir
  return match;
}

bool symbolMatch(String psw)
{
  RegExp regexp = RegExp(r'\W'); // icinde simvol olub olmadigini yoxlayir (. , ; : ' " @ ! # ve s. kimi simvolar)
  bool match = regexp.hasMatch(psw); // psw-nin icinde regExp varmi deye yoxlayir, varsa match-e true qaytarir
  return match;
}

bool emailMatch(String mail)
{
  bool match = true;
  if(mail.contains('@') && mail.contains('.')) // icinde @ ve . olub olmadigini yoxlayir
      {
    return match;
  }
  return false;
}

