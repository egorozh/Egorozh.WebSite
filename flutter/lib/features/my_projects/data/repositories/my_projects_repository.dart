import 'package:egorozh_cv/core/domain/entities/domain_result.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';
import '../data_sources/data_sources.dart';

@LazySingleton(as: IMyProjectsRepository)
class MyProjectsRepository implements IMyProjectsRepository {
  final ProjectsApi _projectsApi;

  MyProjectsRepository(this._projectsApi);

  @override
  Future<CommonDomainResult<List<ProjectListInfo>>> getProjects() async {
    final apiResult = await _projectsApi.getProjects();

    return Success(apiResult.map((m) => m.toDomain()).toList());
  }
}
