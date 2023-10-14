import 'package:flutter/material.dart';
import 'package:postsapp/models/post.dart';

class AppState{

  static var posts=ValueNotifier<List<Post>>([]);

  static var theme=ValueNotifier<ThemeMode>(ThemeMode.light);
}
