class Note {
  // 标签唯一标识符
  final int id;
  // 标签标题
  final String title;
  // 标签内容
  final String content;
  // 标签创建时间
  final String createTime;
  // 标签状态
  final bool isDone;

  const Note(this.id,this.title, this.content, this.createTime, this.isDone);
}