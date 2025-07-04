import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF011D3A), // mesma cor Deep Space
      appBar: AppBar(
        backgroundColor: Color(0xFF011D3A),
        title: Text("Voltar", style: TextStyle(color: Color(0xFFD0E1FF))),
        iconTheme: IconThemeData(color: Color(0xFFD0E1FF)),
      ),
      body: Center(
        child: Text(
          "Bem-vindo à página de perfil!",
          style: TextStyle(fontSize: 24, color: Color(0xFFD0E1FF)),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
