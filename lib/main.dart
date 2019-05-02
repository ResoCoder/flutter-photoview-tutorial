import 'package:flutter/material.dart';
import 'package:photo_view_tutorial/clipped_photo_view_page.dart';
import 'package:photo_view_tutorial/controller_photo_view_page.dart';
import 'package:photo_view_tutorial/gallery_page.dart';
import 'package:photo_view_tutorial/simple_photo_view_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GalleryPage(),
    );
  }
}
