import 'package:flutter/material.dart';
import 'tela_resultado.dart';

class TelaDestino extends StatefulWidget {
  const TelaDestino({super.key});
  @override
  createState() => _TelaDestinoState();
}

class _TelaDestinoState extends State<TelaDestino> {
  int _perguntaAtual = 0;
  int _pontuacao = 0;

  final List<Pergunta> _perguntas = [
    Pergunta(
      pergunta: 'Qual o primeiro console lancado?',
      respostas: ['Atari', 'Nintendo', 'Odyssey', 'Xbox'],
      respostaCorreta: 'Odyssey',
      imagePath: 'lib/images/console1.jpg',
    ),
    Pergunta(
      pergunta: 'Onde o Mario apareceu pela primeira vez?',
      respostas: ['Donkey Kong', 'Save the Princess', 'Mario Bross', 'Jumpman'],
      respostaCorreta: 'Donkey Kong',
      imagePath: 'lib/images/wallpaper2.jpg',
    ),
    Pergunta(
      pergunta: 'Qual o segundo console mais vendido de todos os tempos?',
      respostas: ['Nintendo DS', 'Playtation 2', 'Xbox360', 'GameBoy Advanced'],
      respostaCorreta: 'Nintendo DS',
      imagePath: 'lib/images/8571.jpg',
    ),
    Pergunta(
      pergunta:
          'Qual jogo é frequentemente considerado o melhor jogo de todos os tempos? ',
      respostas: [
        'God of War: Hagnarok',
        'Resident Evil 4: Remasted',
        'Spiderman: Milles Morales',
        'The Legend of Zelda: Ocarina of Time'
      ],
      respostaCorreta: 'The Legend of Zelda: Ocarina of Time',
      imagePath: 'lib/images/game.jpg',
    ),
    Pergunta(
      pergunta: 'qual empresa mais vende jogos atualmente?',
      respostas: ['Soni', 'Microsoft', 'Tencent ', 'Nintendo'],
      respostaCorreta: 'Tencent',
      imagePath: 'lib/images/console2.png',
    ),
  ];

  void _responderPergunta(String resposta) {
    if (_perguntas[_perguntaAtual].respostaCorreta == resposta) {
      setState(() {
        _pontuacao++;
      });
    }

    if (_perguntaAtual < _perguntas.length - 1) {
      setState(() {
        _perguntaAtual++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TelaResultado(_pontuacao, _perguntas.length)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/images/k.jpg'), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset(
                  _perguntas[_perguntaAtual].imagePath,
                  height: 240,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "$_perguntaAtual de 5",
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                _perguntas[_perguntaAtual].pergunta,
                style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 15),
              ),
              const SizedBox(height: 25),
              ...(_perguntas[_perguntaAtual].respostas).map((resposta) {
                return ElevatedButton(
                  onPressed: () {
                    _responderPergunta(resposta);
                  },
                  child: Text(resposta,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          color: Colors.black)),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class Pergunta {
  final String pergunta;
  final List<String> respostas;
  final String respostaCorreta;
  final String imagePath;

  Pergunta({
    required this.pergunta,
    required this.respostas,
    required this.respostaCorreta,
    required this.imagePath,
  });
}
