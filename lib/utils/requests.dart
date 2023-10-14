import 'dart:convert';
import 'dart:developer';


import 'package:http/http.dart';
import 'package:postsapp/models/post.dart';
import 'package:postsapp/utils/globals.dart';

Future getPosts()async{
  if(posts.value.length>5){
    return;
  }
  var response=await get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  if(response.statusCode == 200){
    List data = jsonDecode(response.body);
    List<Post> loadedposts=[];
    for (var item in data) {
      loadedposts.add(Post.fromJson(item));
    }
    posts.value=loadedposts;
  }else{
    log(response.body);
  }
}