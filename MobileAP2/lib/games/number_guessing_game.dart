import 'package:flutter/material.dart';
import 'dart:math';

// Classe principal para o jogo de adivinhar o número
class NumberGuessingGame extends StatefulWidget {
  @override
  _NumberGuessingGameState createState() => _NumberGuessingGameState();
}

class _NumberGuessingGameState extends State<NumberGuessingGame> {
  // Controlador de texto para obter a entrada do usuário
  final TextEditingController _controller = TextEditingController();
  // Mensagem inicial exibida ao usuário
  String _message = "Adivinhe um número entre 1 e 100";
  // Número gerado aleatoriamente
  late int _numeroGerado;
  final Random _random = Random();
  // Ícone de feedback inicial
  Icon _feedbackIcon = Icon(Icons.help_outline, size: 50);

  @override
  void initState() {
    super.initState();
    // Gera um número aleatório entre 1 e 100 quando o widget é inicializado
    _numeroGerado = _random.nextInt(100) + 1;
  }

  // Função para verificar o número digitado pelo usuário
  void _verificarNumero() {
    // Converte a entrada do usuário para um inteiro
    int tentativa = int.tryParse(_controller.text) ?? 0;
    setState(() {
      // Verifica se a tentativa é menor que o número gerado
      if (tentativa < _numeroGerado) {
        _message = "Você digitou $tentativa. O número é maior!";
        _feedbackIcon =
            Icon(Icons.close, color: Colors.red, size: 50); // X vermelho
        // Verifica se a tentativa é maior que o número gerado
      } else if (tentativa > _numeroGerado) {
        _message = "Você digitou $tentativa. O número é menor!";
        _feedbackIcon =
            Icon(Icons.close, color: Colors.red, size: 50); // X vermelho
        // Verifica se a tentativa é igual ao número gerado
      } else if (tentativa == _numeroGerado) {
        _message = "Parabéns! Você digitou $tentativa e acertou!";
        _feedbackIcon =
            Icon(Icons.check, color: Colors.green, size: 50); // CHECK verde
        // Caso a entrada não seja válida
      } else {
        _message = "Por favor, insira um número válido.";
      }
      // Limpa o campo de entrada de texto
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Descubra o Número'), // Título da AppBar
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
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Exibe a mensagem ao usuário
                  Text(
                    _message,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  // Exibe o ícone de feedback
                  _feedbackIcon,
                  SizedBox(height: 20),
                  // Campo de texto para o usuário digitar seu palpite
                  TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Digite seu palpite',
                      labelStyle: TextStyle(color: Colors.orange),
                    ),
                    style: TextStyle(color: Colors.orange),
                  ),
                  SizedBox(height: 20),
                  // Botão para verificar o número digitado
                  ElevatedButton(
                    onPressed: _verificarNumero,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.orange,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text(
                      'Verificar',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
