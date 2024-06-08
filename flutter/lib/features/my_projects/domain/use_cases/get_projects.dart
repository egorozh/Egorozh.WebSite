import 'package:egorozh_cv/core/core.dart';
import 'package:injectable/injectable.dart';

import '../domain.dart';

@injectable
class GetProjects {
  final IMyProjectsRepository _myProjectsRepository;

  GetProjects(this._myProjectsRepository);

  Future<CommonDomainResult<List<ProjectListInfo>>> call(String locale) => _myProjectsRepository.getProjects(locale);
}
