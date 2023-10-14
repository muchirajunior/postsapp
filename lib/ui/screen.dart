import 'package:flutter/material.dart';
import 'package:postsapp/utils/globals.dart';
import 'package:postsapp/utils/requests.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {

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
            onPressed: ()=> theme.value = theme.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light, 
            icon:  ValueListenableBuilder(
              valueListenable: theme,
              builder: (context,appTheme,_) {
                return Icon(appTheme == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode);
              }
            )
          )
        ],
      ),

      body: ValueListenableBuilder(
        valueListenable: posts,
        builder: (context,posts,_){
          return ListView(
            padding: const EdgeInsets.all(10),
            children: posts.map((post) => Card(
              child: ListTile(
                title: Text(post.title.toString(), style:const TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text(post.body.toString()),
                trailing: Icon(post.read ? Icons.check : Icons.close),
              ),
            )).toList(),
          );
        }
      ),
    );
  }
}