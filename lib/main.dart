import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(title: "Contador de pessoas", home: Home())
  );
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  var _pessoa = 0;
  String _mensagem = "Pode entrar!";

  void _changePeople(int delta) {
    setState(() {
      _pessoa += delta;
      if (_pessoa >= 20) {
        _mensagem = "Desculpe, estamos sem vagas no momento :( \n";
        _pessoa = 20;
      } else if (_pessoa < 20 && _pessoa >= 0) {
        _mensagem = "Pode entrar!";
      } else {
        _pessoa = 0;
      }
    });
  }

  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "Imagens/restaurante.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_pessoa",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    child: Text(
                      "+1", 
                      style: TextStyle(fontSize: 40.0, color: Colors.black),
                    ),

                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.black),
                    ),

                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                ),
              ],
            ),
          
            Text(
              _mensagem,
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 30
              ),
            )

          ],
        ),
      ],
    );
  }
}