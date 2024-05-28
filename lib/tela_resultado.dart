import 'package:flutter/material.dart';
import 'tela_inicial.dart';

class TelaResultado extends StatefulWidget {
  final int pontuacao;
  final int totalPerguntas;
  const TelaResultado(this.pontuacao, this.totalPerguntas, {super.key});
  @override
  createState() => _FinalPageState();
}

class _FinalPageState extends State<TelaResultado> {
  int _pontuacao = 0;
  int _totalPerguntas = 0;
  @override
  void initState() {
    super.initState();
    _pontuacao = widget.pontuacao;
    _totalPerguntas = widget.totalPerguntas;
  }

  @override
  Widget build(BuildContext context) {
    String mensagem;

    if (_pontuacao >= (_totalPerguntas)) {
      mensagem = 'Parabens voce é um gamer';
    } else {
      mensagem = 'Acho que voce não é um Geek';
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/images/k.jpg'), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 48),
              const Text(
                'Voce conluiu o Quiz',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 24),
              GestureDetector(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TelaInicial(),
                        ),
                      ),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: const Center(
                        child: Text(
                          'REINICIAR',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                          ),
                        ),
                      ))),
              const SizedBox(height: 20),
              Text(
                "Acertou: $_pontuacao de $_totalPerguntas",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                mensagem,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
