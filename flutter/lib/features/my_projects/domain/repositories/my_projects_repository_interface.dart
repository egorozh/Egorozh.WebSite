import '../../../../core/core.dart';
import '../domain.dart';

abstract interface class IMyProjectsRepository {
  Future<CommonDomainResult<List<ProjectListInfo>>> getProjects();
}
