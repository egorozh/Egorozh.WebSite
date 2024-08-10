import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../models/models.dart';

class ProjectsApi {
  Future<List<ProjectListDto>> getProjects(String locale) async {
    final fileName = switch (locale) {
      "ru" => "my_projects_ru.i18n.json",
      "en" => "my_projects_en.i18n.json",
      _ => "my_projects_ru.i18n.json",
    };

    final json = await rootBundle.loadString('assets/mock_data/$fileName');

    final jsonDecoded = jsonDecode(json);
    final s = jsonDecoded as List<dynamic>;

    return s.map((s) => ProjectListDto.fromJson(s)).toList();
  }
}
