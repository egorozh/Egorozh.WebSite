import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final dio = Dio();

  String? data;

  @override
  void initState() {
    // dio.get('https://github.com/egorozh/Tabalonia/raw/develop/README.md').then(
    //   (res) {
    //     data = res.data;
    //   },
    // ).catchError((ex) {
    //   debugPrint(ex.toString());
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return data != null
        ? Markdown(
            selectable: false,
            data: data!,
          )
        : const Center(child: CircularProgressIndicator());
  }
}
