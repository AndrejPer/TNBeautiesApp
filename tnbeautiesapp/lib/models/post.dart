class Post {
  int id;
  DateTime publishTime;
  String content;
  int authorID;

  Post(
      {required this.id,
      required this.publishTime,
      required this.content,
      required this.authorID});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      id: int.parse(json['id']),
      publishTime: DateTime.parse(json['publish_time']),
      content: json['content'],
      authorID: int.parse(json['author_id']));
}
