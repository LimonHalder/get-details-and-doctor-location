
import 'package:bloc_pattern/MapSample.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'Homepage.dart';
import 'Doctor.dart';
import 'DoctorBloc.dart';

import 'package:bloc_pattern/Homepage.dart';
import 'package:bloc_pattern/bloc.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {

  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  changethepage(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Homepage()));
  }
  @override
  Widget build(BuildContext context) {
    final bloc = Bloc();
    return Scaffold(
      appBar: AppBar(
        title: Text("LogIn First"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              
                Text("Please Log In",style: TextStyle(fontSize:30,fontWeight: FontWeight.bold,color: Colors.lightBlueAccent),),
                SizedBox(height:40.0),
              StreamBuilder<String>(
                stream: bloc.email,
                builder: (context,snapshot) =>TextField(
                  onChanged: bloc.emailChanged,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Email",
                    labelText: "Email",
                    errorText: snapshot.error
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              StreamBuilder<String>(
                stream: bloc.password,
                              builder:(context,snapshot) => TextField(
                                onChanged: bloc.passworChanged,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Password",
                    labelText: "Password"
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              // ignore: deprecated_member_use
              StreamBuilder<bool>(
                stream: bloc.submitCheck,
                              builder: (context,snapshot) =>RaisedButton(
                  color: Colors.tealAccent,
                  onPressed: snapshot.hasData? () =>changethepage(context):null,
                  child: Text("Submit"),
                  ),
              ),
                
            ],
            
          ),
        ),
      ),
    );
  }
}
