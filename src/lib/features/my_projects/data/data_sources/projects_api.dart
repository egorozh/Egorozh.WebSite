import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../models/models.dart';

class ProjectsApi {
  Future<List<ProjectListDto>> getProjects(String locale) async {
    final fileName = locale == "ru" ? "my_projects_ru.json" : "my_projects.json";

    final json = await rootBundle.loadString('assets/mock_data/$fileName');

    final jsonDecoded = jsonDecode(json);
    final s = jsonDecoded as List<dynamic>;

    return s.map((s) => ProjectListDto.fromJson(s)).toList();
  }
}
