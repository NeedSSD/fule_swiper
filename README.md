# fule_swiper
![Pub Version](https://img.shields.io/pub/v/fule_swiper?style=flat-square)
![GitHub](https://img.shields.io/github/license/Yang-Xuhao/fule_swiper?style=flat-square)

一个简单的Swiper组件，它允许你在其中放置任意的组件。

<img src="https://i.loli.net/2020/04/16/9Pi7Tb81AqjQFho.gif"  width="40%"/>

## 开始
### 安装
在pubspec.yaml中添加引用
``` yaml
fule_swiper: ^0.1.2
```
下载插件
```shell
$ flutter pub get
```
### 引入
``` dart
import 'package:fule_swiper/fule_swiper.dart';
```
### 上面演示的源码
``` dart
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
```
### 参数
| 属性 | 类型 | 默认值 | 必填 | 说明 | 组件版本 |
| --- | --- | --- | :---: | --- | :---: |
| width| double | 100.0 | 否 | 组件的宽度 | 0.1.0 |
| height | double | 100.0 | 否 | 组件的高度 | 0.1.0 |
| children | List&lt;Widget&gt; | - | 是 | 子组件 | 0.1.0 |
| current | int | 0 | 否 | 默认选中的下标 | 0.1.0 |
| autoplay | bool | false | 否 | 是否自动切换 | 0.1.0 |
| interval | int | 2000 | 否 | 自动切换时间间隔 | 0.1.0 |
| duration | int | 1000 | 否 | 滑动动画时长 | 0.1.0 |
| curve | Curve | Curves.ease | 否 | 滑动动画 | 0.1.0 |
| indicatorDot | bool | true | 否 | 是否显示指示点 | 0.1.2 |
| indicatorColor | Color | Colors.white | 否 | 指示点默认颜色 | 0.1.0 |
| indicatorActiveColor | Color | Colors.white | 否 | 指示点选中颜色 | 0.1.0 |
| indicatorRadius | double | 4.0 | 否 | 指示点半径 | 0.1.0 |
| indicatorSpacing | double | 8.0 | 否 | 指示点间距 | 0.1.0 |
| indicatorAlignment | Alignment | Alignment.bottomCenter | 否 | 指示点的位置 | 0.1.2 |
| onPageChanged | bool | - | 否 | 切换回调函数 | 0.1.0 |

## TODO
- [ ] 实现纵向滑动
- [ ] 实现循环播放