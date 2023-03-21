import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'article_logic.dart';

///文章
class ArticlePage extends StatefulWidget {
  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final logic = Get.put(ArticleLogic());

  @override
  Widget build(BuildContext context) {
    return Container(child: Text("文章"));
  }
}