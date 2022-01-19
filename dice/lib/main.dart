import 'dart:math';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dice(),
    );
  }
}

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {

  int left = 1, middle = 2, right = 3;

  String result = '0';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('DiceApp'),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Score: $result', style: const TextStyle(color: Colors.blueAccent,fontSize: 50,),),
          const SizedBox(height: 30,),
          Row(
            children: <Widget>[
              Expanded(
                  child: Image(
                    image: AssetImage('images/dice$left.png'),
                  )
              ),
              Expanded(
                  child: Image(
                    image: AssetImage('images/dice$middle.png'),
                  )
              ),
              Expanded(
                  child: Image(
                    image: AssetImage('images/dice$right.png'),
                  )
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                left = Random().nextInt(6)+1;
                middle = Random().nextInt(6)+1;
                right = Random().nextInt(6)+1;
                int r = (left+middle+right);
                result = r.toString();
              });
            },
            child: const Text('Roll Dice', style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
              primary: Colors.amber,
              onPrimary: Colors.amber,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                result = '0';
              });
            },
            child: const Text('Reset Score', style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
              primary: Colors.amber,
              onPrimary: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}
