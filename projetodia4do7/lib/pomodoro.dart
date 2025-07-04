import 'package:fluter/main.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'profile_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class Pomodoro extends StatefulWidget {
  const Pomodoro({super.key});

  @override
  _Pomodoro createState() => _Pomodoro();
}

class _Pomodoro extends State<Pomodoro> {
  int _seconds = 1500;
  Timer? _timer;

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  Map<String, dynamic> _ideia = {};

  Future<void> _getIdea() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("Ideias")
        .doc("1")
        .get();

    //Caso não exite o documento usuario 1, ele direciona para o usario
    if (!snapshot.exists) {
      setState(() {
        _ideia = {};
      });
    }
    // Se deu certo ele vem para e executa o setState da coleção
    else {
      setState(() {
        _ideia["nome"] = snapshot["nome"];
      });
    }
  }

  String _formatTime(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    if (minutes == 0 && seconds == 0) {
      return 'Hora do Café!';
    }
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancela o timer ao destruir o widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF011D3A), // Deep Space

      appBar: AppBar(
        backgroundColor: Color(0xFF011D3A), // Deep Space
        title: Text(
          "Pomodoro Timer",
          style: TextStyle(color: Color(0xFFD0E1FF)), // Code Comment
        ),
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
              _formatTime(_seconds),
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00F6FF), // Cyber Teal
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Fala, Dev , bora codar?',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFFD0E1FF), // Code Comment
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startCountdown,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00F6FF), // Cyber Teal
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text(
                "Iniciar _Pomodoro",
                style: TextStyle(
                  color: Color(0xFF011D3A), // Deep Space (inverso no texto)
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _getIdea,
              child: Text(
                _ideia.isNotEmpty ? _ideia["nome"].toString() : "Buscar Ideia",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
