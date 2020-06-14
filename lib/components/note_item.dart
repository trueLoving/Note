import 'package:flutter/material.dart';
import 'package:note/model/note.dart';

List<Note> notes = [
  new Note(1, 'title1', 'content1', 'createTime1', 1),
  new Note(2, 'title2', 'content2', 'createTime2', 0),
  new Note(3, 'title3', 'content3', 'createTime3', 1),
  new Note(4, 'title4', 'content4', 'createTime4', 0),
  new Note(5, 'title5', 'content5', 'createTime5', 1),
  new Note(6, 'title6', 'content6', 'createTime6', 0),
  new Note(7, 'title7', 'content7', 'createTime7', 1),
  new Note(8, 'title8', 'content8', 'createTime8', 0),
  new Note(9, 'title9', 'content9', 'createTime9', 1),
  new Note(10, 'title10', 'content10', 'createTime10', 1),
  new Note(11, 'title11', 'content11', 'createTime11', 1)
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
