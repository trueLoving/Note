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

class MyBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Flex(direction: Axis.horizontal, children: <Widget>[
      Expanded(
        flex: 1,
        child: RaisedButton.icon(
          icon: Icon(Icons.send),
          label: Text("发送"),
          onPressed: null,
        ),
      ),
      Expanded(
        flex: 1,
        child: RaisedButton.icon(
          icon: Icon(Icons.send),
          label: Text("发送"),
          onPressed: null,
        ),
      ),
    ]);
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      backgroundColor: Colors.black,
      icon: Icon(Icons.alarm),
      title: Text("提醒"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.black,
      icon: Icon(IconData(0xe602, fontFamily: 'iconfont')),
      title: Text("新建便签"),
    )
  ];

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
          bottomNavigationBar: BottomNavigationBar(
            items: bottomNavItems,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              _clickButton(context, index);
            },
            fixedColor: Colors.black,
          ),
          body: new TabBarView(children: [
            new ChoiceCard(isDone: true),
            new ChoiceCard(isDone: false),
          ]),
        ));
  }

  _clickButton(BuildContext context, index) {
    // debug
    print(index);
    // Navigator.push(context, MaterialPageRoute(builder: (_) {
    //   return AddNoteScreen();
    // }));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: "tabTar示例", home: new Home());
  }
}

void main() => runApp(new MyApp());
