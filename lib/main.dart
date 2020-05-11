import 'package:bartered/Answer.dart';
import 'package:bartered/question.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String value = "";
  var quotes = [];
  TextEditingController messageController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  void _addMessage(){
    setState(() {
      quotes.add(
        {
          'message':messageController.text,
          'author':authorController.text,
          'link':linkController.text,
          'datetime':DateTime.now().toString(),
        }
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        child:Scaffold(
        appBar: AppBar(
          title: Text('Quoter'),
        ),
        body: SingleChildScrollView(
            child:Container(child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children:<Widget>[
                    Container(
                      child:TextField(
                        controller: messageController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.message),
                          hintText: 'Pen your quote',
                          labelText: 'quote',
                        ),
                        style: TextStyle(color:Colors.white),
                      ),
                      margin: EdgeInsets.all(10),
                    ),
                    Container(
                      child:TextField(
                        controller: authorController,
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                          hintText: 'pen the author',
                          labelText: 'author',
                        ),
                        style: TextStyle(color:Colors.white),
                      ),
                      margin: EdgeInsets.all(10),
                    ),
                    Container(
                      child:TextField(
                        controller: linkController,
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.image),
                          hintText: 'Pen the image link',
                          labelText: 'link',
                        ),
                        style: TextStyle(color:Colors.white),
                      ),
                      margin: EdgeInsets.all(10),
                    )
                  ]
                ),
                decoration: BoxDecoration(
                  border:Border.all(color:Colors.white70),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
              ),
              RaisedButton(
                  onPressed: _addMessage,
                  child:Text('Quote It!'),
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
              Text(value),
              ...quotes.map((e){
                return Card(
                    child: Container(
                        child:ListTile(
                        title: Text(e['author']),
                        subtitle: Column(
                          children: <Widget>[
                            Container(
                              child:Text(e['message']),
                              margin: EdgeInsets.all(5),
                            ),
                            Container(
                              child:Text(e['datetime']),
                              margin: EdgeInsets.all(5),
                            ),
                          ],
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue,
                        ),
                        isThreeLine: true,
                        onLongPress: (){
                          setState(() {
                            quotes.removeWhere((element) => element==e);
                          });
                        },
                      ),
                      decoration: BoxDecoration(
                        color:Colors.lightBlue[100],
                      ),
                    ),
                    elevation: 6,
                  );
                }).toList()
            ],
          ),
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.blue[800],
            Colors.blue[600],
            Colors.blue[400],
            Colors.blue[200],
          ],
        ),
      ),
      ),
      theme: ThemeData(
    // Define the default brightness and colors.
        primaryColor: Colors.blue[100],
        accentColor: Colors.blue[100],
        textSelectionColor: Colors.blue[100],
        fontFamily: 'Georgia',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
    );
  }
}

/*
questionIndex < _questions.length ? Column(
          children: <Widget>[
            Question(_questions[questionIndex]['questionText']),
            ...(_questions[questionIndex]['answers'] as List<String>).map((answer){
                  return Answer(answer,_check);
            }
            ).toList(),
            RaisedButton(
              onPressed: _answerQuestion,
              child: Text('Next'),
              ),
          ],
        ): Column(children: <Widget>[
          Text('Its done'),
          RaisedButton(
            onPressed: _reset,
            child: Text('Reset'),
            color: Colors.lightGreenAccent,
            )
        ],),

        var _questions = [
    {
      'questionText':'Your favourite Movie?',
      'answers':['Interstellar','13 RW','The princess switch','5 feet apart'],
      'correctIndex':1,
    },
    {
      'questionText':'Your favourite Color?',
      'answers':['Red','Blue','White','Green'],
      'correctIndex':3,
    },
    {
      'questionText':'Your favourite Actress?',
      'answers':['Sophie Turner','Katherine Langford','Emilia Clarke','Vanessa Hudgens'],
      'correctIndex':2,
    },
    {
      'questionText':'Your favourite Number?',
      'answers':['1','2','3','4'],
      'correctIndex':2,
    }
  ];
  int questionIndex = 0;

  void _answerQuestion(){
    setState(() {
      questionIndex = questionIndex+1;
    });
  }

  bool _check(int index){
    if(_questions[questionIndex]['correctIndex'] == index)return true;
    return false;
  }

  void _reset(){
    setState(() {
      questionIndex = 0;
    });
  }


  
*/