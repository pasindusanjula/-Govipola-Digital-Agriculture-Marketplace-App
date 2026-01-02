import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Login and signup/SignUpScreen.dart';
import 'Login and signup/login_screen.dart';

void main() {
  runApp(const GoviPolaApp());
}

class GoviPolaApp extends StatelessWidget {
  const GoviPolaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GoviPola',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const LoginScreen(),
    );
  }
}
