import 'package:flutter/material.dart';
import 'package:fule_swiper/fule_swiper.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List images = [
    {
      "src": "https://i.loli.net/2020/04/16/gpIVeN8a2m93nXt.jpg",
      "desc": "小船在水上"
    },
    {
      "src": "https://i.loli.net/2020/04/16/zRf7qoAlJV6kIcN.jpg",
      "desc": "冰雪覆盖"
    },
    {
      "src": "https://i.loli.net/2020/04/16/eQx6rlmXNiwUzPO.jpg",
      "desc": "绿色中的棕房子"
    },
  ];

  List<Widget> getImages() {
    List<Widget> _list = List();
    images.forEach((_item) {
      _list.add(Stack(
        children: <Widget>[
          Image.network(
            _item['src'],
            fit: BoxFit.fitHeight,
            width: 750,
            height: 1334,
          ),
          Align(
            alignment: Alignment(-0.9, 0.3),
            child: Text(
              _item['desc'],
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
              ),
            ),
          )
        ],
      ));
    });
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Swiper(
            width: 750,
            height: 1334,
            autoplay: true,
            duration: 500,
            interval: 2000,
            indicatorActiveColor: Colors.white,
            indicatorColor: Colors.white38,
            indicatorRadius: 4,
            indicatorSpacing: 16,
            indicatorAlignment: Alignment(0, 0.95),
            children: getImages(),
          ),
        ),
      ),
    );
  }
}
