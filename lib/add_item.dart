import 'package:flutter/material.dart';

class ToolbarButton extends StatelessWidget {
  final IconData iconData;

  final Function clickEvent;

  const ToolbarButton(Key key, this.iconData, this.clickEvent)
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Expanded(
        flex: 1,
        child: IconButton(
          icon: Icon(this.iconData),
          onPressed: this.clickEvent,
          iconSize: 23.0,
        ));
  }
}

class Toolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        new ToolbarButton(
            new Key('1'), IconData(0xe600, fontFamily: 'iconfont'), null),
        new ToolbarButton(
            new Key('2'), IconData(0xe8dc, fontFamily: 'iconfont'), null),
        new ToolbarButton(
            new Key('3'), IconData(0xe629, fontFamily: 'iconfont'), null),
        new ToolbarButton(
            new Key('4'), IconData(0xe60c, fontFamily: 'iconfont'), null),
        new ToolbarButton(
            new Key('5'), IconData(0xe6f5, fontFamily: 'iconfont'), null),
        new ToolbarButton(
            new Key('6'), IconData(0xe601, fontFamily: 'iconfont'), null),
      ],
    );
  }
}

class AddNoteScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new AddNoteScreenState();
}

class AddNoteScreenState extends State<AddNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.check, color: Colors.white),
                onPressed: () {
                  print('finished');
                })
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: new Toolbar(),
        ),
        body: new Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(color: Colors.white),
            child: new Column(children: <Widget>[
              new TextField(
                style: TextStyle(fontSize: 30.0),
                maxLines: 5,
                minLines: 1,
                decoration: new InputDecoration(
                    border: InputBorder.none,
                    hintText: "输入标题",
                    hintStyle: TextStyle(color: Colors.purple[400])),
              ),
              new TextField(
                  maxLines: null,
                  minLines: 1,
                  keyboardType: TextInputType.multiline,
                  decoration: new InputDecoration(
                      border: InputBorder.none, hintText: '输入正文')),   
            ])));
  }
}
