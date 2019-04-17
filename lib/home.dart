import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home>{
  TextEditingController _agecontroller = new TextEditingController();
  TextEditingController _heightcontroller = new TextEditingController();
  TextEditingController _weightcontroller = new TextEditingController();
  double result=0;
  String resultText = "";
  void calculBMI(){
    setState(() {
      if(_agecontroller.text.isNotEmpty && _heightcontroller.text.isNotEmpty && _weightcontroller.text.isNotEmpty){
        result =  double.parse(_weightcontroller.text) /  (double.parse(_heightcontroller.text) * double.parse(_heightcontroller.text));
        if(result <= 18.5) resultText= "underweight";
        if(result > 18.5 || result <= 24.9) resultText= "nrmal weight";
        if(result > 25.0 || result <= 29.9) resultText= "overweight";
        if(result > 30   || result <= 39.9 ) resultText= "obesity";
        if(result > 40 ) resultText= "morbid obesity";
      }
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('BMI - Indice de masse corporel'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: new Container(
        alignment: Alignment.center,
        // padding: EdgeInsets.only(top: 10, left: 5, right: 5),
        child: new ListView(
          children: <Widget>[
            new Padding(padding: EdgeInsets.only(top: 20),),
            new Image.asset('images/bmi.png', height: 150,),
            new Padding(padding: EdgeInsets.only(top: 10)),
            new Container(
              padding: EdgeInsets.all(10),
              child: new TextField(
                controller: _agecontroller,
                textDirection: TextDirection.ltr,
                keyboardType: TextInputType.numberWithOptions(),
                decoration: new InputDecoration(
                  hintText: 'Age..',
                  icon: new Icon(Icons.date_range)
                ),
              )
            ),
            new Container(
              padding: EdgeInsets.all(10),
              child: new TextField(
                controller: _heightcontroller,
                autofocus: true,
                keyboardType: TextInputType.numberWithOptions(),
                decoration: new InputDecoration(
                  hintText: 'Height in m',
                  icon: new Icon(Icons.gesture),
                ),
              ),
            ),
            new Container(
              padding: EdgeInsets.all(10),
              child: new TextField(
                controller: _weightcontroller,
                autofocus: true,
                keyboardType: TextInputType.numberWithOptions(),
                decoration: new InputDecoration(
                  hintText: 'Weight in Kg',
                  icon: new Icon(Icons.panorama_wide_angle),
                ),
              ),
            ),
            new Padding(padding: EdgeInsets.only(top: 10)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(
                  onPressed: calculBMI,
                  color: Colors.pinkAccent,
                  child: new Text('Calculate', style: new TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(padding: EdgeInsets.only(top: 50)),
                new Text('BMI: $result', style: new TextStyle(fontSize: 22, fontWeight: FontWeight.w500),)
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(padding: EdgeInsets.only(top: 50)),
                new Text('$resultText', style: new TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.deepOrange),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}