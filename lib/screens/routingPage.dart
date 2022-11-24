import 'package:flutter/material.dart';
import 'home/Trending.dart';
import 'home/homepage.dart';
import 'home/profile/Profile.dart';
import 'home/profile/profileSection/EditProfileIn.dart';
import 'home/profile/settings/account/accountSettings.dart';
import 'home/profile/settings/account/changePassword/updatepassword.dart';
import 'home/profile/settings/account/deleteAccount/deleteAccount.dart';
import 'home/profile/settings/settings.dart';
import 'login/SignUp/optionMenu.dart';
import 'login/SignUp/registrationpage.dart';
import 'login/loginpage.dart';


const String loginPage="login";
const String homePage="home";
const String optionMenu="option";
const String trendings="trending";
const String profiles="profile";
const String updatePassword="update";
const String registrationPage="registration";
const String accountSettings="account";
const String editProfile="edit";
const String groupsSection="groups";
const String basicSettings="set";
const String deleteacount="delete";

void login(){}
void home(){}
void option(){}
void trending(){}
void profile(){}
void update(){}
void registrations(){}
void account(){}
void edit(){}
void groups(){}
void set(){}
void deleted(){}
Route<dynamic> controllers(RouteSettings settingsa){
  switch(settingsa.name){

    case loginPage:{
      return MaterialPageRoute(builder: (context)=> Login());
    }
    case homePage:{
      return MaterialPageRoute(builder: (context)=> Homepage(title: "Rezzid",));
    }
    case optionMenu:{
      return MaterialPageRoute(builder: (context)=> Options());
    }
    case trendings:{
      return MaterialPageRoute(builder: (context)=> Trending());
    }
    case profiles:{
      return MaterialPageRoute(builder: (context)=> Profile(text: ''));
    }
    case updatePassword:{
      return MaterialPageRoute(builder: (context)=> UpdatePassword());
    }
    case registrationPage:{
      return MaterialPageRoute(builder: (context)=> registration());
    }
    case accountSettings:{
      return MaterialPageRoute(builder: (context)=> Accountsettings());
    }
    case editProfile:{
      return MaterialPageRoute(builder: (context)=> EditProfile());
    }

    case basicSettings :{
      return MaterialPageRoute(builder: (context)=> settings());
    }
    case deleteacount :{
      return MaterialPageRoute(builder: (context)=> DeleteAccount());
    }
    default :
      throw ('no page found');
  }
}