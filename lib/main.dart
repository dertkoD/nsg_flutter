import 'package:flutter/material.dart';

void main() {
  runApp(
      new MaterialApp(
          debugShowCheckedModeBanner: false,// скрываем надпись debug
          home: new Scaffold(
              body: new MyButton()
          )
      )
  );
}

class MyButton extends StatefulWidget {
  @override
  MyButtonState createState() => MyButtonState();
}

class MyButtonState extends State<MyButton> {
  bool isVisibleCircle = false;
  bool isVisibleRectangle = false;

  @override
  Widget build(BuildContext context) {
    return new Container(padding: EdgeInsets.all(40),
        child: new Column( children: <Widget> [
          new Row (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              new TextButton(
                  onPressed: () {
                    setState(() {
                      isVisibleCircle = true;
                      isVisibleRectangle = false; });},
                  child: Text('Красный круг'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),)),

              new TextButton(
                  onPressed: () {
                    setState(() {
                      isVisibleRectangle = true;
                      isVisibleCircle = false; });},
                  child: Text('Синий прямоугольник'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),)),
            ]),
            if (isVisibleCircle) new Circle(),
            if (isVisibleRectangle) new Rectangle(),
            ]));
  }
}

class Circle extends StatelessWidget {
  const Circle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 300.0,
      height: 300.0,
      decoration: new BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
    );
  }
}

class Rectangle extends StatelessWidget {
  const Rectangle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 300.0,
      height: 300.0,
      decoration: new BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.rectangle,
      ),
    );
  }
}