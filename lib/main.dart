import 'package:flutter/material.dart';

import 'package:note/views/add_item.dart';

import 'package:note/components/note_item.dart';

class ChoiceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return new NoteItem(note: notes[index]);
        },
        itemCount: notes.length);
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
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Note'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.more_horiz, color: Colors.white),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return new Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              new ListTile(
                                leading: new Icon(Icons.photo_camera),
                                title: new Text('Camera'),
                                onTap: () {
                                  print('camera');
                                },
                              ),
                              new ListTile(
                                leading: new Icon(Icons.photo_library),
                                title: new Text('Photos'),
                                onTap: () {
                                  print('photos');
                                },
                              ),
                            ]);
                      });
                })
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
          decoration: new BoxDecoration(color: Colors.white),
          child: new ChoiceCard(),
        ));
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
