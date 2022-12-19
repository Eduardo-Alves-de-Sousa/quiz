import 'package:flutter/material.dart';
import './questao.dart';
import 'resposta.dart';

void main() {
  runApp(const PerguntaApp());
}

class _PerguntasAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
      final List<Map<String, Object>> _perguntas = const [
      {
        'texto': 'Qual é a sua cor favorita?',
        'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
      },
      {
        'texto': 'Qual o seu instrumento favorito?',
        'respostas': ['Piano', 'Violão', 'Bateria', 'Guitarra'],
      }   
    ];

  void _responder() {
    if(temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {

    List<String> respostas = temPerguntaSelecionada 
      ? _perguntas[_perguntaSelecionada].cast()['respostas']
      : [];
    
    //List<Widget> widgets;
    // for(String textoResp in perguntas[_perguntaSelecionada].cast()['respostas']){
    //   respostas.add(Resposta(textoResp, _responder));
    // }

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada ? Column(
          children: <Widget>[
            Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),            
            ...respostas.map((t) => Resposta(t, _responder)).toList(),
          ],
        ) : const Center(
          child: Text(
            'Parabéns!!',
            style: TextStyle(fontSize: 28),
            ), 
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntasAppState createState() {
    return _PerguntasAppState();
  }
}