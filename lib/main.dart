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
    return new ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return new NoteItem(note: notes[index]);
        },
        itemCount: notes.length);
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



class BaseViewBar extends PreferredSize{

  Widget childView;

  @override
  final Size preferredSize;

  BaseViewBar({this.preferredSize, this.childView});

  @override
  Widget build(BuildContext context) {
    Widget current = childView;
    if (childView == null) {
      current = LimitedBox(
        maxWidth: 0.0,
        maxHeight: 0.0,
        child: ConstrainedBox(constraints: const BoxConstraints.expand()),
      );
    }
    return current;
  }

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
    return new Scaffold(
      appBar: new AppBar(
        title:new Text('Note'),
        centerTitle: true, 
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz, color: Colors.white),
            onPressed: () {
              print('finished');
            }
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _clickButton(context, index);
        },
        fixedColor: Colors.black87,
      ),
      body: new Container(
        decoration: new BoxDecoration(
          color:Colors.white
        ),
        child:new ChoiceCard(isDone: true),
      )
    );
  }

  _clickButton(BuildContext context, index) {
    // debug
    print(index);
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return AddNoteScreen();
    }));
  }

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: "tabTar示例", home: new Home());
  }
}

void main() => runApp(new MyApp());
