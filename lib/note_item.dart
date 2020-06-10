import 'package:flutter/material.dart';

const List<Note> notes = const <Note>[
  const Note('标题1', '内容1', '2019-01-01', false),
  const Note('标题2', '内容2', '2019-01-01', true),
  const Note('标题3', '内容3', '2019-01-01', false),
  const Note('标题4', '内容4', '2019-01-01', true),
  const Note('标题5', '内容5', '2019-01-01', false),
  const Note('标题1', '内容1', '2019-01-01', false),
  const Note('标题2', '内容2', '2019-01-01', true),
  const Note('标题3', '内容3', '2019-01-01', false),
  const Note('标题4', '内容4', '2019-01-01', true),
  const Note('标题5', '内容5', '2019-01-01', false),
  const Note('标题1', '内容1', '2019-01-01', false),
  const Note('标题2', '内容2', '2019-01-01', true),
  const Note('标题3', '内容3', '2019-01-01', false),
  const Note('标题4', '内容4', '2019-01-01', true),
  const Note('标题5', '内容5', '2019-01-01', false),
  const Note('标题1', '内容1', '2019-01-01', false),
  const Note('标题2', '内容2', '2019-01-01', true),
  const Note('标题3', '内容3', '2019-01-01', false),
  const Note('标题4', '内容4', '2019-01-01', true),
  const Note('标题5', '内容5', '2019-01-01', false),
];

class Note {
  // 标签标题
  final String title;
  // 标签内容
  final String content;
  // 标签创建时间
  final String createTime;
  // 标签状态
  final bool isDone;

  const Note(this.title, this.content, this.createTime, this.isDone);
}

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
