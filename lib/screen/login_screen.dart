import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LOGIN_SCREEN';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner, //!Buat nampilin loading
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),    //!Symetric Gunanya buat ngasih horiziontal or vertical/ bisa milih
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200,
                child: Image.asset('images/logo.png'),
              ),
              const SizedBox(
                height: 48,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
                onChanged: (newValue) {
                  email = newValue;
                },
                decoration: const InputDecoration(
                  hintText: 'Enter Your Email',
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding:
                      EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20),
                  border:  OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(32),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(      //
                    borderRadius: BorderRadius.all(Radius.circular(32),), //!Circular buletan
                    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(    //!Ketika di klik focus ke border yang di klik
                    borderRadius: BorderRadius.all(Radius.circular(32),),
                    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                obscureText: true,
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
                onChanged: (newValue) {
                  password = newValue;
                },
                decoration: const InputDecoration(
                  hintText: 'Enter Your Password',
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding:
                      EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20),
                  border:  OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(32),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(      
                    borderRadius: BorderRadius.all(Radius.circular(32),), //!Circular buletan
                    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(    //!Ketika di klik focus ke border yang di klik
                    borderRadius: BorderRadius.all(Radius.circular(32),),
                    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Material(
                  color : Colors.lightBlueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(30),),
                  elevation: 5,
                  child: MaterialButton(
                    onPressed: ()async{
                      setState(() {
                        showSpinner = true ;
                      });
                      try{
                        await _auth.createUserWithEmailAndPassword(email: email, password: password);
                        Navigator.pushNamed(context, ChatScreen.id);   //!pushReplacementNamed digunakan ketika kita ingin berganti screen kemudia screen yang sebelumnya di hapus
                        setState(() {
                          showSpinner = false;
                        });
                      }
                      catch(e){
                        print(e);
                      }
                  },
                  minWidth: 200,
                  height: 42,
                  child: Text('Login'),
                  ),
                ),
          ),
            ],
      ),
        )
      )
    );
  }
}
