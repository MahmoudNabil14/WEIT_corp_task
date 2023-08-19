import 'package:flutter/material.dart';

extension NavigatorHelper on BuildContext {
  void push({required String routeName, var arguments}){
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }void pushAndReplace({required String routeName, var arguments}){
    Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }
  void pushAndKill({required String routeName, var arguments}){
    Navigator.of(this).pushNamedAndRemoveUntil(routeName,(route)=>false, arguments: arguments);
  }
  void pop(){
    Navigator.pop(this);
  }
}
