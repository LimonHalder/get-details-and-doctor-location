import 'dart:async';
import 'package:flutter/cupertino.dart';

import 'validator.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators implements BaseBloc  {

final _emailController = BehaviorSubject<String>();
final _passwordController = BehaviorSubject<String>();

Stream<String> get email => _emailController.stream.transform(emailValidator);
Stream<String> get password => _passwordController.stream.transform(paasswordValidator);

Function(String) get emailChanged => _emailController.sink.add;
Function(String) get passworChanged => _passwordController.sink.add;

Stream<bool> get submitCheck => Rx.combineLatest2(email,password,(e,p)=>true);

 



@override
void dispose(){
    _emailController?.close();
    _passwordController?.close();
}
}






abstract class BaseBloc{
    void dispose();
}