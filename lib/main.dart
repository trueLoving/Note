import 'package:flutter/material.dart';

import './note_item.dart';
import './add_item.dart';

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'TODO', icon: IconData(0xe8e6, fontFamily: 'iconfont')),
  const Choice(title: 'DONE', icon: IconData(0xe616, fontFamily: 'iconfont'))
];

class ChoiceCard extends StatelessWidget {
  
  ChoiceCard({this.isDone});

  final bool isDone;

  @override
  Widget build(BuildContext context) {
    if (this.isDone) {
      return new ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return new NoteItem(note: notes[index]);
          },
          itemCount: notes.length);
    } else {
      return new Card(
          color: Colors.white,
          child: new Center(
            child: new Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[new Text('Hello World')]),
          ));
    }
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: choices.length,
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text('NOTES'),
            bottom: new TabBar(
              tabs: choices.map((Choice choice) {
                return new Tab(text: choice.title, icon: new Icon(choice.icon));
              }).toList(),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // 跳转到添加页面
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return AddNoteScreen();
              }));
            },
            child: Icon(Icons.add, color: Colors.white, size: 40),
          ),
          body: new TabBarView(children: [
            new ChoiceCard(isDone: true),
            new ChoiceCard(isDone: false),
          ]),
        ));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "tabTar示例",
        home: new Home());
  }
}

void main() => runApp(new MyApp());
