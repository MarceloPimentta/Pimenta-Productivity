import 'package:flutter/material.dart';
import 'games/jokenpo_screen.dart'; // Importar JokenpoScreen
import 'games/coin_flip_screen.dart'; // Importar CoinFlipScreen
import 'games/number_guessing_game.dart'; // Importar NumberGuessingGame

// Classe que define a tela de seleção de jogos
class GamesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jogos'), // Título da AppBar
        backgroundColor: Colors.orange, // Cor da AppBar: Laranja
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
                // Texto de título da tela
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Escolha um Jogo',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20), // Espaçamento entre o texto e os botões

                // Botão para navegar para a tela de Jokenpô
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JokenpoScreen()),
                    );
                  },
                  child: ListTile(
                    leading: Icon(Icons.sports_kabaddi, color: Colors.orange),
                    title: Text('Jokenpô'),
                  ),
                ),
                SizedBox(height: 16), // Espaçamento entre os botões

                // Botão para navegar para a tela de Cara ou Coroa
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CoinFlipScreen()),
                    );
                  },
                  child: ListTile(
                    leading: Icon(Icons.flip, color: Colors.orange),
                    title: Text('Cara ou Coroa'),
                  ),
                ),
                SizedBox(height: 16), // Espaçamento entre os botões

                // Botão para navegar para a tela de Descubra o Número
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NumberGuessingGame()),
                    );
                  },
                  child: ListTile(
                    leading: Icon(Icons.gamepad, color: Colors.orange),
                    title: Text('Descubra o Número'),
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
