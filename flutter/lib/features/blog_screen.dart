import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Markdown(
        selectable: true,
        data: 'Insert emoji here😀 ',
      ),
    );
  }
}
