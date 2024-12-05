import 'dart:math';
import 'package:flutter/material.dart';

// Classe principal para a tela de frases diárias
class DailyQuotesScreen extends StatefulWidget {
  @override
  _DailyQuotesScreenState createState() => _DailyQuotesScreenState();
}

class _DailyQuotesScreenState extends State<DailyQuotesScreen> {
  // Lista de frases a serem exibidas
  List<String> _frases = [
    "A vida é 10% o que acontece a você e 90% como você reage.",
    "Seja a mudança que você quer ver no mundo.",
    "A persistência é o caminho do êxito.",
    "Acredite em você e todo o resto se encaixará.",
    "A única maneira de fazer um ótimo trabalho é amar o que você faz.",
    "O sucesso é a soma de pequenos esforços repetidos dia após dia.",
    "Não espere por oportunidades extraordinárias. Aproveite as ocasiões comuns e faça com que sejam grandiosas.",
    "A verdadeira coragem é ir atrás dos seus sonhos mesmo quando todos dizem que eles são impossíveis.",
    "Sua vida não melhora por acaso, ela melhora com mudança.",
    "A jornada de mil milhas começa com um passo.",
    "A única coisa impossível é aquela que você não tenta.",
    "O fracasso é apenas a oportunidade de começar de novo, desta vez de forma mais inteligente.",
    "Não deixe o medo de perder ser maior que a vontade de ganhar.",
    "Você nunca é velho demais para definir outro objetivo ou para sonhar um novo sonho.",
    "Acredite em si mesmo e todo o resto se encaixará.",
    "Cada dia é uma nova oportunidade para mudar sua vida.",
    "Não é sobre quão rápido você chega lá, mas sobre a jornada que leva você até lá.",
    "Tudo o que um sonho precisa para ser realizado é alguém que acredite que ele possa ser realizado.",
    "A vida é curta, então faça valer a pena.",
    "As melhores vistas vêm depois das maiores escaladas."
  ];

  // Frase gerada a ser exibida
  String _fraseGerada = "Clique abaixo para gerar uma frase!";

  // Função para gerar uma nova frase aleatória
  void _gerarFrase() {
    final random = Random();
    setState(() {
      _fraseGerada = _frases[random.nextInt(_frases.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do dia"), // Título da AppBar
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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Exibe a frase gerada
                  Text(
                    _fraseGerada,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 22,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30),
                  // Botão para gerar uma nova frase
                  ElevatedButton(
                    onPressed: _gerarFrase,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Cor do botão: Branca
                      foregroundColor:
                          Colors.orange, // Cor da fonte do botão: Laranja
                    ),
                    child: Text(
                      "Nova Frase",
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
