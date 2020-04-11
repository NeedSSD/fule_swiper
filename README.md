# fule_swiper
一个简单的Swiper组件。

<img src="https://i.loli.net/2020/04/11/DwQPZs5fh7XlKrO.gif"  width="40%"/>

## 开始
### 安装
在pubspec.yaml中添加引用
``` yaml
fule_swiper: ^0.0.1
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
```
### 参数
| 属性 | 类型 | 默认值 | 必填 | 说明 | 组件版本 |
| --- | --- | --- | :---: | --- | :---: |
| width| double | 100.0 | 否 | 组件的宽度 | 0.0.1 |
| height | double | 100.0 | 否 | 组件的高度 | 0.0.1 |
| children | List&lt;Widget&gt; | - | 是 |  | 0.0.1 |
| current | int | 0 | 否 | 默认选中的下标 | 0.0.1 |
| autoplay | bool | false | 否 | 是否自动切换 | 0.0.1 |
| interval | int | 2000 | 否 | 自动切换时间间隔 | 0.0.1 |
| duration | int | 1000 | 否 | 滑动动画时长 | 0.0.1 |
| curve | Curve | Curves.ease | 否 | 滑动动画 | 0.0.1 |
| indicatorDot | bool | true | 否 | 是否显示指示点 | 0.0.1 |
| indicatorColor | Color | Colors.white | 否 | 指示点默认颜色 | 0.0.1 |
| indicatorActiveColor | Color | Colors.white | 否 | 指示点选中颜色 | 0.0.1 |
| indicatorRadius | double | 4.0 | 否 | 指示点半径 | 0.0.1 |
| indicatorSpacing | double | 8.0 | 否 | 指示点间距 | 0.0.1 |
| onPageChanged | bool | - | 否 | 切换回调函数 | 0.0.1 |

## TODO
- [ ] 实现纵向滑动
- [ ] 实现循环播放