class Comment {
  int _id;
  DateTime _publishTime;
  String content;
  int userID;
  int _reviewID;
  int _postID;

  Comment(this._id, this._publishTime, this.content, this.userID,
      this._reviewID, this._postID);
}
