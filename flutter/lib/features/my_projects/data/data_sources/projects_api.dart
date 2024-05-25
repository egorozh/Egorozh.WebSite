import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../models/models.dart';

class ProjectsApi {
  Future<List<ProjectListDto>> getProjects() async {
    final json = await rootBundle.loadString('assets/my_projects.json');

    final jsonDecoded = jsonDecode(json);
    final s = jsonDecoded as List<dynamic>;

    return s.map((s) => ProjectListDto.fromJson(s)).toList();
  }
}
