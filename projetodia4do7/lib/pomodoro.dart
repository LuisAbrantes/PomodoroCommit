import 'package:flutter/material.dart';
import 'dart:async'; // Necessário para Timer
import 'profile_page.dart'; // Certifique-se de que este arquivo existe e está no mesmo nível ou caminho correto
import 'package:cloud_firestore/cloud_firestore.dart'; // Importa o Cloud Firestore
import 'firebase_options.dart'; // Importa as opções do Firebase
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  // Garante que o binding do Flutter esteja inicializado antes de qualquer chamada nativa, incluindo o Firebase
  WidgetsFlutterBinding.ensureInitialized();
  // Inicializa o Firebase com as opções da plataforma atual
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const PomodoroApp(),
  ); // Altere de MyApp() para PomodoroApp() ou Pomodoro() diretamente
}

// Uma classe para o app, que serve como raiz da árvore de widgets
class PomodoroApp extends StatelessWidget {
  const PomodoroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro Timer',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Você pode ajustar o tema aqui
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Usando o esquema de cores que você indicou para o AppBar e outras partes
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF011D3A), // Deep Space
          foregroundColor: Color(
            0xFFD0E1FF,
          ), // Code Comment para o texto e ícones
        ),
      ),
      home: const Pomodoro(),
    );
  }
}

class Pomodoro extends StatefulWidget {
  const Pomodoro({super.key}); // Adicionado const e Key para boas práticas

  @override
  _PomodoroState createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> {
  int _seconds = 1500; // 25 minutos
  Timer? _timer;
  String _ideia =
      'Carregando Ideia...'; // Variável para armazenar a ideia do Firestore

  @override
  void initState() {
    super.initState();
    _getIdea(); // Chama a função para buscar a ideia do Firestore quando o widget for inicializado
  }

  void _startCountdown() {
    _timer
        ?.cancel(); // Cancela qualquer timer anterior para evitar múltiplos timers
    _seconds = 1500; // Reinicia o contador para 25 minutos
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _timer?.cancel(); // Para o timer quando chega a zero
          // Adicione aqui a lógica para o intervalo (ex: 5 minutos de pausa) se desejar
        }
      });
    });
  }

  int c = 0; // Variável para controlar o ID do documento
  Future<void> _getIdea() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection("Ideias") // Nome da coleção
          .doc("$c") // ID do documento
          .get();
      if (c < 4) {
        c++; // Reseta o contador para evitar IDs fora do intervalo
      } else {
        c = 0; // Reseta o contador para evitar IDs fora do intervalo
      }

      if (!snapshot.exists) {
        setState(() {
          _ideia = 'Documento de ideia não encontrado.';
        });
      } else {
        // Acessa o campo 'Ideia' (com 'I' maiúsculo) como está no seu Firestore
        final ideiaDoFirestore = snapshot['ideia'];
        setState(() {
          _ideia = ideiaDoFirestore ?? 'Campo "Ideia" ausente ou nulo.';
        });
      }
    } catch (e) {
      setState(() {
        _ideia = 'Erro ao carregar ideia: $e';
      });
      print('Erro ao carregar ideia do Firestore: $e'); // Para depuração
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
    _timer
        ?.cancel(); // Cancela o timer ao destruir o widget para evitar vazamentos de memória
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF011D3A), // Deep Space

      appBar: AppBar(
        title: const Text(
          "Pomodoro Timer",
          style: TextStyle(color: Color(0xFFD0E1FF)), // Code Comment
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFFD0E1FF),
        ), // Cor dos ícones da AppBar
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
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
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00F6FF), // Cyber Teal
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Fala, Dev, bora codar?',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFFD0E1FF), // Code Comment
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startCountdown,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00F6FF), // Cyber Teal
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              child: const Text(
                "Iniciar Pomodoro", // Ajustado o texto
                style: TextStyle(
                  color: Color(0xFF011D3A), // Deep Space (inverso no texto)
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20), // Espaçamento entre os botões
            ElevatedButton(
              onPressed:
                  _getIdea, // Passa a referência da função, não a chamada
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors
                    .deepOrange, // Exemplo de cor diferente para este botão
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              child: Text(
                'IDEIA : $_ideia', // Exibe a ideia carregada
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
