class Note {
  // 标签唯一标识符
  int id;
  // 标签标题
  String title;
  // 标签内容
  String content;
  // 标签创建时间
  String createTime;
  // 标签状态
  int isDone;
  // 构造函数
  Note(id, title, content, createTime, isDone) {
    this.id = id;
    this.title = title;
    this.content = content;
    this.createTime = createTime;
    this.isDone = isDone;
  }

  Note.fromMap(Map map) {
    this.id = map[id];
    this.title = map[title];
    this.content = map[content];
    this.createTime = map[createTime];
    this.isDone = map[isDone];
  }

  Map toMap() {
    Map map = new Map();
    map[id] = this.id;
    map[title] = this.title;
    map[content] = this.content;
    map[createTime] = this.createTime;
    map[isDone] = this.isDone;
    return map;
  }
}
