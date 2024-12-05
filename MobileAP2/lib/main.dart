import 'package:flutter/material.dart';
import 'fuel_choice_screen.dart';
import 'daily_quotes_screen.dart';
import 'games_screen.dart';

// Função principal que inicia o aplicativo
void main() => runApp(MyApp());

// Classe principal do aplicativo que define o MaterialApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pimenta Productivity', // Título do aplicativo
      theme: ThemeData(
        primarySwatch:
            Colors.orange, // Tema do aplicativo com cor primária laranja
      ),
      home: HomeScreen(), // Tela inicial do aplicativo
    );
  }
}

// Classe que define a tela inicial do aplicativo
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pimenta Productivity'), // Título da AppBar
      ),
      body: Container(
        // Fundo com gradiente
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orange.shade200,
              Colors.orange.shade600
            ], // Cores do gradiente
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            // Coluna principal com os widgets
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Texto de boas-vindas
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Bem-vindo ao Pimenta Productivity!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20), // Espaçamento entre o texto e os botões

                // Card para navegar para a tela de cálculo de combustível
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading:
                        Icon(Icons.local_gas_station, color: Colors.orange),
                    title: Text('Calcular Combustível'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FuelChoiceScreen()),
                      );
                    },
                  ),
                ),

                // Card para navegar para a tela de frases diárias
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.format_quote, color: Colors.orange),
                    title: Text('Vai uma frase aí!?'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DailyQuotesScreen()),
                      );
                    },
                  ),
                ),

                // Card para navegar para a tela de mini-jogos
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.games, color: Colors.orange),
                    title: Text('Mini-Games'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GamesScreen()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
