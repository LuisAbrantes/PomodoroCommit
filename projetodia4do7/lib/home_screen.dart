import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'pomodoro.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF011D3A), // Deep Space

      appBar: AppBar(
        backgroundColor: Color(0xFF011D3A), // Deep Space
        title: Image.asset("../image/pomodoro.png", width: 70, height: 70),
        iconTheme: IconThemeData(color: Color(0xFFD0E1FF)),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pomodoro Timer',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00F6FF), // Cyber Teal
              ),
            ),
            SizedBox(height: 20, width: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50.0,
                vertical: 20,
              ),
              child: Text(
                'Este é o seu aplicativo de concentração. No botão abaixo, você consegue iniciar seu cronômetro para começar a codar, com seus 25 minutos de trabalho e 5 minutos de intervalo. Tanto pelo outro botão à direita quanto pelo ícone de perfil no canto superior direito, você tem acesso ao seu histórico de trabalho e descanso. Pense nele como o seu histórico do Git, e em cada sessão de trabalho ou de descanso como um commit, para você controlar a sua própria versão de produtividade! ;)',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFFD0E1FF), // Code Comment
                ),
                textAlign: TextAlign.center,
              ),
            ),
            TextButton(
              child: Text("Iniciar Pomodoro"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pomodoro()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00F6FF), // Cyber Teal
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
