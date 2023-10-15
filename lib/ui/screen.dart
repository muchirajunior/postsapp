import 'package:flutter/material.dart';
import 'package:postsapp/models/post.dart';
import 'package:postsapp/ui/search_bar.dart';
import 'package:postsapp/ui/update_dialog.dart';
import 'package:postsapp/utils/globals.dart';
import 'package:postsapp/utils/requests.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {

  addPost(){
    Map samplepost={
        'id':AppState.posts.value.length+1,
        "title":"some sample title",
        "body":'some sample body for id ${AppState.posts.value.length+1}'
    };
    AppState.posts.value=[...AppState.posts.value,Post.fromJson(samplepost)];
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('post added ...!'), 
      behavior: SnackBarBehavior.floating,
    ));
  }

  @override
  void initState() {
    getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('STATE LISTENABLE'),
        elevation: 2,
        actions: [
          IconButton(
            onPressed: ()=> AppState.theme.value = AppState.theme.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light, 
            icon:  ValueListenableBuilder(
              valueListenable: AppState.theme,
              builder: (context,appTheme,_) {
                return Icon(appTheme == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode);
              }
            )
          )
        ],

        bottom:const PreferredSize(
          preferredSize: Size(double.infinity, 70),
          child: CustomSearchBar(),
        ),
      ),

      body: ValueListenableBuilder(
        valueListenable: AppState.posts,
        builder: (context,posts,_){
          return ListView(
            padding: const EdgeInsets.all(10),
            children: posts.map((post) => Card(
              child: ListTile(
                title: Text(post.title.toString(), style:const TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text(post.read ? "post read" : post.body.toString() ),
                trailing: Icon(post.read ? Icons.check : Icons.close),
                onTap: ()=>showDialog(context: context, builder: (context)=>UpdateDialog(post: post)),
              ),
            )).toList(),
          );
        }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: addPost,
        child: const Icon(Icons.add),
      ),
    );
  }
}