import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../models/models.dart';

class BlogApi {
  Future<List<ArticleListDto>> getArticles(String locale) async {
    final fileName = switch (locale) {
      "ru" => "my_articles_ru.i18n.json",
      "en" => "my_articles_en.i18n.json",
      _ => "my_articles_ru.i18n.json",
    };

    final json = await rootBundle.loadString('assets/mock_data/$fileName');

    final jsonDecoded = jsonDecode(json);
    final s = jsonDecoded as List<dynamic>;

    return s.map((s) => ArticleListDto.fromJson(s)).toList();
  }

  Future<String> getArticle(int id, String locale) async {
    final data = await rootBundle.loadString('assets/mock_data/article$id.md');

    return data;
  }
}
