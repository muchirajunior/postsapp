import 'package:flutter/material.dart';
import 'package:postsapp/models/post.dart';
var posts=ValueNotifier<List<Post>>([]);

var theme=ValueNotifier<ThemeMode>(ThemeMode.light);