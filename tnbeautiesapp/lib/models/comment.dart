class Comment {
  int id;
  DateTime publishTime;
  String content;
  int userID;
  int? reviewID;
  int? postID;

  Comment(
      {required this.id,
      required this.publishTime,
      required this.content,
      required this.userID,
      required this.reviewID,
      required this.postID});

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
      id: int.parse(json['id']),
      publishTime: DateTime.parse(json['publish_time']),
      content: json['content'],
      userID: int.parse(json['user_id']),
      reviewID: json['review_id'] == null ? null : int.parse(json['review_id']),
      postID: json['post_id'] == null ? null : int.parse(json['post_id']));
}
