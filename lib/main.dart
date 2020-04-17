import 'dart:math';

import 'package:flutter/material.dart';

import 'RandomWords.dart';

void main() => runApp(new HelloApp());

class HelloApp extends StatelessWidget {


  Widget _titleSection() {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0), //设置边角的padding
      child: new Row(
        //横向排列
        children: [
          new Expanded(
            //内容变成可扩展的
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground O ',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland  ',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('48'),
        ],
      ),
    );
    return titleSection;
  }

  //通过组合的方式构建了一个Icon+Text的组合Widget
  Column _buildButtonColumn(Color color, IconData icon, String label) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    //如何打log
    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: "Flutter layout demo",
      theme: new ThemeData(
        primarySwatch: Colors.green
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Flutter layout demo"),
          ),
          body: ListView(//纵向排列
            children: <Widget>[
              new Image.asset(
                'images/lake.jpg',
                width: 600.0,
                height: 240.0,
                fit: BoxFit.cover,
              ),
              _titleSection(),
              buttonSection,
              textSection
            ],
          )),
    );
  }
}

//Stateless widgets 是不可变的, 这意味着它们的属性不能改变 - 所有的值都是最终的.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //build方法谁调用?
    return new MaterialApp(
      title: "First Flutter App",
      theme: new ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
      ),
      home: new RandomWords(),
    );
  }
}
