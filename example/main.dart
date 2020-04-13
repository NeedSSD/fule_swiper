import 'package:flutter/material.dart';
import 'package:fule_swiper/fule_swiper.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan,
        body: Center(
          child: Swiper(
            width: 200,
            height: 300,
            autoplay: true,
            duration: 500,
            interval: 2000,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 300,
                    child: Text('Page One'),
                    color: Colors.red,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 150,
                  ),
                  Container(
                    width: 200,
                    height: 150,
                    child: Text('Page Two'),
                    color: Colors.green,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    width: 200,
                    height: 100,
                    child: Text('Page Three'),
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  Text(
                    'Give me a like please,thx! ;)',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}