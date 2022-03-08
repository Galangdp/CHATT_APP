import 'package:chatt_app/screen/chat_screen.dart';
import 'package:chatt_app/screen/login_screen.dart';
import 'package:chatt_app/screen/register_screen.dart';
import 'package:chatt_app/screen/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();     //Tahap Awal Untuk Menggunakan Firebase
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner : false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue 
      ),
      initialRoute: WelcomeScreen.id,     //Ini buat ngarahin kita pertama kali mau kemana
      routes: {
        WelcomeScreen.id : (context) => const WelcomeScreen(),    //Mau pindah halaman ke ....
        RegisterScreen.id : (context) => const RegisterScreen(), 
        LoginScreen.id : (context) => const LoginScreen(),
        ChatScreen.id : (context) => const ChatScreen(),
      },
    );
  }
}
