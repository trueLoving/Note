import 'package:flutter/material.dart';

import 'package:note/model/note.dart';

const List<Note> notes = const <Note>[
  const Note(1,'标题1', '内容1', '2019-01-01', false),
  const Note(2,'标题2', '内容2', '2019-01-01', true),
  const Note(3,'标题3', '内容3', '2019-01-01', false),
  const Note(4,'标题4', '内容4', '2019-01-01', true),
  const Note(5,'标题5', '内容5', '2019-01-01', false),
  const Note(6,'标题1', '内容1', '2019-01-01', false),
  const Note(7,'标题2', '内容2', '2019-01-01', true),
  const Note(8,'标题3', '内容3', '2019-01-01', false),
  const Note(9,'标题4', '内容4', '2019-01-01', true),
  const Note(10,'标题5', '内容5', '2019-01-01', false),
  const Note(11,'标题1', '内容1', '2019-01-01', false),
  const Note(12,'标题2', '内容2', '2019-01-01', true),
  const Note(13,'标题3', '内容3', '2019-01-01', false),
  const Note(14,'标题4', '内容4', '2019-01-01', true),
  const Note(15,'标题5', '内容5', '2019-01-01', false),
  const Note(16,'标题1', '内容1', '2019-01-01', false),
  const Note(17,'标题2', '内容2', '2019-01-01', true),
  const Note(18,'标题3', '内容3', '2019-01-01', false),
  const Note(19,'标题4', '内容4', '2019-01-01', true),
  const Note(20,'标题5', '内容5', '2019-01-01', false),
];

class OverflowText extends StatelessWidget {

  final String text;

  const OverflowText({Key key, this.text = 'Hello World'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: 90.0,
        child: new Text(
          text,
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ));
  }
}

class NoteItem extends StatefulWidget {
  final Note note;

  const NoteItem({Key key, this.note}) : super(key: key);

  @override
  _NoteItemState createState() => new _NoteItemState(this.note);
}

class _NoteItemState extends State<NoteItem> {
  final Note note;

  _NoteItemState(this.note);

  @override
  Widget build(BuildContext context) {
    return new Card(
        color: Colors.white,
        margin: const EdgeInsets.all(10.0),
        child: new Container(
          height: 100.0,
          padding: const EdgeInsets.only(left: 20.0, top: 16.0),
          child: new Row(
            children: <Widget>[
              new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(note.title, style: TextStyle(fontSize: 22.0)),
                    Divider(),
                    new Text(
                      note.createTime,
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ])
            ],
          ),
        ));
  }
}
