import 'dart:convert';
import 'dart:developer';


import 'package:http/http.dart';
import 'package:postsapp/models/post.dart';
import 'package:postsapp/utils/globals.dart';

Future getPosts()async{
  if(AppState.posts.value.length>5){
    return;
  }
  try {
      var response=await get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if(response.statusCode == 200){
        List data = jsonDecode(response.body);
        List<Post> loadedposts=[];
        for (var item in data) {
          loadedposts.add(Post.fromJson(item));
        }
        log('loaded posts .....');
        AppState.posts.value=[...loadedposts];
      }else{
        log(response.body);
      }
    } on Exception catch (e) {
      log(e.toString());
    }
 
}