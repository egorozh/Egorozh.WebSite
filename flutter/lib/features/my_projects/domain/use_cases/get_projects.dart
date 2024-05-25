import 'package:egorozh_cv/core/core.dart';
import 'package:injectable/injectable.dart';

import '../domain.dart';

@injectable
class GetProjects {
  final IMyProjectsRepository _myProjectsRepository;

  GetProjects(this._myProjectsRepository);

  Future<CommonDomainResult<List<ProjectListInfo>>> call() => _myProjectsRepository.getProjects();
}
