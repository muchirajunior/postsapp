class Post{
  int? id;
  String? title;
  String? body;
  bool read=false;

  Post.fromJson(Map json){
    id=json['id'];
    title=json['title'];
    body=json['body'];
  }
}