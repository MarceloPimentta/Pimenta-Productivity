import 'package:flutter/material.dart';

// Classe principal para a tela de escolha de combustível
class FuelChoiceScreen extends StatefulWidget {
  @override
  _FuelChoiceScreenState createState() => _FuelChoiceScreenState();
}

class _FuelChoiceScreenState extends State<FuelChoiceScreen> {
  // Controladores de texto para obter os valores de álcool e gasolina
  final TextEditingController _alcoolController = TextEditingController();
  final TextEditingController _gasolinaController = TextEditingController();
  // Resultado a ser exibido após o cálculo
  String _result = "";

  // Função para calcular o melhor combustível
  void _calcularMelhorCombustivel() {
    // Substitui vírgulas por pontos e converte para double
    String alcoolInput = _alcoolController.text.replaceAll(',', '.');
    String gasolinaInput = _gasolinaController.text.replaceAll(',', '.');

    double alcool = double.tryParse(alcoolInput) ?? 0.0;
    double gasolina = double.tryParse(gasolinaInput) ?? 0.0;
    double proporcao = 0.0;

    // Calcula a proporção entre álcool e gasolina
    if (gasolina != 0.0) {
      proporcao = alcool / gasolina;
    }

    setState(() {
      // Define o resultado com base na proporção
      if (proporcao <= 0.7 && proporcao != 0.0) {
        _result = "É mais econômico abastecer com Álcool.";
      } else if (proporcao > 0.7) {
        _result = "É mais econômico abastecer com Gasolina.";
      } else {
        _result = "Por favor, insira valores válidos.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculo de Combustível'), // Título da AppBar
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Texto de instrução
                  Text(
                    'Digite os preços:',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  // Campo de texto para o preço do álcool
                  TextField(
                    controller: _alcoolController,
                    decoration: InputDecoration(
                      labelText: 'Preço do Álcool',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16),
                  // Campo de texto para o preço da gasolina
                  TextField(
                    controller: _gasolinaController,
                    decoration: InputDecoration(
                      labelText: 'Preço da Gasolina',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  // Botão para calcular o melhor combustível
                  ElevatedButton(
                    onPressed: _calcularMelhorCombustivel,
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
                      'Calcular',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Exibe o resultado do cálculo
                  Text(
                    _result,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
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
