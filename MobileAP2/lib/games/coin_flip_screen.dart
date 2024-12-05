import 'package:flutter/material.dart';
import 'dart:math';

// Classe principal para a tela de cara ou coroa
class CoinFlipScreen extends StatefulWidget {
  @override
  _CoinFlipScreenState createState() => _CoinFlipScreenState();
}

class _CoinFlipScreenState extends State<CoinFlipScreen>
    with SingleTickerProviderStateMixin {
  var _resultado = "Clique para jogar!"; // Texto inicial do resultado
  var _imageResult = AssetImage("assets/images/padrao.png"); // Imagem inicial
  final List<String> _opcoes = ["Cara", "Coroa"]; // Opções de resultado
  late AnimationController _controller; // Controlador de animação
  late Animation<double> _animation; // Animação de rotação

  @override
  void initState() {
    super.initState();
    // Inicializa o controlador de animação
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    // Define a animação de rotação
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    // Descarrega o controlador de animação quando a tela é destruída
    _controller.dispose();
    super.dispose();
  }

  // Função para realizar o sorteio de cara ou coroa
  void _jogar() {
    final random = Random();
    var resultado = _opcoes[random.nextInt(_opcoes.length)];

    setState(() {
      _resultado =
          "Escolhendo..."; // Texto temporário enquanto a animação ocorre
      _controller.forward(from: 0.0).then((value) {
        setState(() {
          // Atualiza o resultado e a imagem com base no sorteio
          _resultado = resultado;
          if (resultado == "Cara") {
            _imageResult = AssetImage("assets/images/cara.png");
          } else {
            _imageResult = AssetImage("assets/images/coroa.png");
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cara ou Coroa'), // Título da AppBar
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Imagem que gira mostrando o resultado
              Transform(
                transform: Matrix4.rotationY(pi * _animation.value),
                alignment: Alignment.center,
                child: Image(image: _imageResult, width: 150, height: 150),
              ),
              SizedBox(height: 20),
              // Texto que exibe o resultado
              Text(
                _resultado,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              // Botão para realizar o sorteio
              ElevatedButton(
                onPressed: _jogar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Cor do botão: Branca
                  foregroundColor:
                      Colors.orange, // Cor da fonte do botão: Laranja
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  'Jogar',
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
    );
  }
}
