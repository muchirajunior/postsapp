import 'package:flutter/material.dart';
import 'package:postsapp/models/post.dart';
import 'package:postsapp/utils/globals.dart';

class UpdateDialog extends StatelessWidget {
  final Post post;
  const UpdateDialog({super.key, required this.post});

  updatePost(context){
    post.read=!post.read;  
    AppState.posts.value=AppState.posts.value.map((item) => item.id==post.id ? post : item).toList();
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
   
    return AlertDialog(
      title: Text('Update Post ${post.id}'),
      content: Text(post.title.toString()),
      actions: [
        TextButton(onPressed: ()=>Navigator.pop(context), child: const Text('cancel')),
        TextButton(onPressed:()=> updatePost(context), child: const Text('submit'))
      ],
    );
  }
}