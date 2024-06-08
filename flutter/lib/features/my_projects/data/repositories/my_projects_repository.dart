import 'package:egorozh_cv/core/domain/entities/domain_result.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';
import '../data_sources/data_sources.dart';

@LazySingleton(as: IMyProjectsRepository)
class MyProjectsRepository implements IMyProjectsRepository {
  final ProjectsApi _projectsApi;

  MyProjectsRepository(this._projectsApi);

  @override
  Future<CommonDomainResult<List<ProjectListInfo>>> getProjects(String locale) async {
    try {
      final apiResult = await _projectsApi.getProjects(locale);
      return Success(apiResult.map((m) => m.toDomain()).toList());
    } on Exception catch (_) {
      return Error(DomainErrorType.serverError);
    }
  }
}
