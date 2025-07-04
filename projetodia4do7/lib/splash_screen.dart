import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart'; // arquivo da próxima tela

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF011D3A), // Deep Space
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Text(
              'Pomodoro.commit()',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00F6FF), // Cyber Teal
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              '../image/pomodoro.png', // CORRIGIDO: caminho correto para pasta assets
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Menos "merge conflict" na sua mente.',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFFD0E1FF), // Code Comment
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Carregando...',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF6F82A4), // String Literal
              ),
            ),
          ],
        ),
      ),
    );
  }
}
