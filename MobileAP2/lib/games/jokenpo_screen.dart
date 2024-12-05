import 'package:flutter/material.dart';
import 'dart:math';

// Classe principal para a tela de Jokenpô
class JokenpoScreen extends StatefulWidget {
  @override
  _JokenpoScreenState createState() => _JokenpoScreenState();
}

class _JokenpoScreenState extends State<JokenpoScreen>
    with SingleTickerProviderStateMixin {
  var _imageApp = AssetImage("assets/images/padrao.png"); // Imagem inicial
  var _message = "Escolha uma opção abaixo"; // Mensagem inicial
  late AnimationController _controller; // Controlador de animação
  late Animation<double> _animation; // Animação de rotação
  late String _escolhaApp; // Escolha do aplicativo

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

  // Função para selecionar a opção do usuário e determinar o resultado do jogo
  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    _escolhaApp = opcoes[numero];

    setState(() {
      _message = "Escolhendo..."; // Texto temporário enquanto a animação ocorre
      _controller.forward(from: 0.0).then((value) {
        setState(() {
          // Configura a imagem escolhida pelo app
          if (_escolhaApp == "pedra") {
            _imageApp = AssetImage("assets/images/pedra.png");
          } else if (_escolhaApp == "papel") {
            _imageApp = AssetImage("assets/images/papel.png");
          } else {
            _imageApp = AssetImage("assets/images/tesoura.png");
          }

          // Valida o ganhador
          if ((escolhaUsuario == "pedra" && _escolhaApp == "tesoura") ||
              (escolhaUsuario == "tesoura" && _escolhaApp == "papel") ||
              (escolhaUsuario == "papel" && _escolhaApp == "pedra")) {
            _message = "Você ganhou!";
          } else if ((_escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
              (_escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
              (_escolhaApp == "papel" && escolhaUsuario == "pedra")) {
            _message = "Você perdeu!";
          } else {
            _message = "Empate!";
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"), // Título da AppBar
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Texto de instrução
                Padding(
                  padding: EdgeInsets.only(top: 32, bottom: 16),
                  child: Text(
                    "Escolha do App",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Imagem que gira mostrando a escolha do app
                Transform(
                  transform: Matrix4.rotationY(pi * _animation.value),
                  alignment: Alignment.center,
                  child: Image(image: _imageApp),
                ),
                // Texto que exibe o resultado
                Padding(
                  padding: EdgeInsets.only(top: 32, bottom: 16),
                  child: Text(
                    _message,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Botões para selecionar a opção do usuário
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 20, // Espaçamento entre os elementos
                    runSpacing: 20, // Espaçamento entre as linhas
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => _opcaoSelecionada("pedra"),
                        child: Image.asset(
                          "assets/images/pedra.png",
                          width: 100, // Limitar a largura da imagem
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _opcaoSelecionada("papel"),
                        child: Image.asset(
                          "assets/images/papel.png",
                          width: 100, // Limitar a largura da imagem
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _opcaoSelecionada("tesoura"),
                        child: Image.asset(
                          "assets/images/tesoura.png",
                          width: 100, // Limitar a largura da imagem
                        ),
                      ),
                    ],
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
