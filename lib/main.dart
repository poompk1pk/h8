import 'dart:math';

import 'package:flutter/material.dart';

import 'game.dart';

void main() {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // callback method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: DynamicChange(),
    );
  }
}

class DynamicChange extends StatefulWidget  {
  @override
  HomePage createState() => HomePage();
}
class HomePage extends State<DynamicChange> {
  late Game _game;

  String _inputstate = '';
  String _message = 'ทายเลขตั้งแต่ 1 - 100';


  HomePage(){
    _game = Game(maxRandom: 100);
  }

  void _showOkDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var showSeven = true;

    return Scaffold(
      appBar: AppBar(
        title: const Text('GUESS THE NUMBER'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.purple.shade50,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.shade100,
                offset: Offset(5.0, 5.0),
                spreadRadius: 2.0,
                blurRadius: 5.0,
              )
            ],
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*Row(
                children: [
                  Container(width: 50.0, height: 50.0, color: Colors.blue),
                  Expanded(
                    child: Container(
                      width: 30.0,
                      height: 50.0,
                      //color: Colors.pink,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text('FLUTTER', textAlign: TextAlign.end,),
                      ),
                      alignment: Alignment.centerRight,
                    ),
                  ),
                  //SizedBox(width: 10.0),
                ],
              ),*/
              /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: Container(color: Colors.green, width: 100.0, height: 50.0)),
                  Container(color: Colors.red, width: 50.0, height: 50.0),
                ],
              ),*/
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/guess_logo.png', width: 90.0),
                    SizedBox(width: 8.0),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('GUESS',
                            style: TextStyle(
                                fontSize: 36.0, color: Colors.purple.shade200)),
                        Text(
                          'THE NUMBER',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.purple.shade600,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(_inputstate,
                    style: TextStyle(fontSize: 80.0, color: Colors.black)),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(_message,
                    style: TextStyle(fontSize: 30.0, color: Colors.black)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 1; i <= 3; i++) buildButton(num: i),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 4; i <= 6; i++) buildButton(num: i),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 7; i <= 9; i++) buildButton(num: i),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildClearBut(),
                  buildButton(num: 0),
                  buildDelButton(),
                ],
              ),


              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  child: Text('GUESS'),
                  onPressed: () {


                    var input = _inputstate;
                    var guess = int.tryParse(input);


                    print(guess);
                    if (guess == null) {
                      _show_message('กรอกข้อมูลไม่ถูกต้อง ให้กรอกเฉพาะตัวเลขเท่านั้น');

                      return;
                    }

                    late String message;
                    var guessResult = _game.doGuess(guess);
                    if (guessResult > 0) {
                      message = '$guess มากเกินไป กรุณาลองใหม่';
                      _clear_input();
                    } else if (guessResult < 0) {
                      message = '$guess น้อยเกินไป กรุณาลองใหม่';
                      _clear_input();
                    } else {
                      message =
                      '$guess ถูกต้องครับ 🎉 ( ${_game.guessCount} ครั้ง )';
                    }

                    //_showOkDialog(context, 'RESULT', message);
                    _show_message(message);


                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _clear_input() {
    setState(() {
      _inputstate = '';
    });
  }
  void _show_message(String msg) {
    setState(() {
      _message = msg;
    });
  }
  Widget _buildClearBut({int? num}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: OutlinedButton(
          onPressed: () {
            _clear_input();
          },
          child: Icon(
            Icons.close,         // รูปไอคอน
            // size: 35.0,           // ขนาดไอคอน
            //color: Colors.blueGrey,   // สีไอคอน
          )),
    );
  }
  Widget buildDelButton({int? num}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: OutlinedButton(
          onPressed: () {
            setState(() {

              if(_inputstate.length>0) {
                _inputstate = _inputstate.substring(0,_inputstate.length-1);
              }

            });
          },
          child: Icon(
            Icons.backspace,         // รูปไอคอน
            // size: 35.0,           // ขนาดไอคอน
            // color: Colors.blueGrey,   // สีไอคอน
          )),
    );
  }
  Widget buildButton({int? num}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: OutlinedButton(
          onPressed: () {

            setState(() {

              if(_inputstate.length<3) {
                _inputstate += '$num';
              }

            });
          },
          child: Text('$num')),
    );
  }
}