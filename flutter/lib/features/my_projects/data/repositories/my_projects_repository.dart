import 'package:egorozh_cv/core/domain/entities/domain_result.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';

@LazySingleton(as: IMyProjectsRepository)
class MyProjectsRepository implements IMyProjectsRepository {
  @override
  Future<CommonDomainResult<List<ProjectListInfo>>> getProjects() async {
    return Success(
      [
        const ProjectListInfo(
          title: "Сайт-визитка",
          description: "Сайт-визитка на flutter-web",
          url: "https://github.com/egorozh/Egorozh.WebSite",
        ),
        const ProjectListInfo(
          title: "Tabalonia",
          description: "Библиотека для создания вкладочного интерфейса как в браузерах",
          url: "https://github.com/egorozh/Tabalonia",
        ),
        const ProjectListInfo(
          title: "Egorozh.ColorPicker",
          description: "ColorPicker для AvaloniaUI и WPF",
          url: "https://github.com/egorozh/Egorozh.ColorPicker",
        ),
        const ProjectListInfo(
          title: "X-Filer",
          description: "Проводник файлов с вкладочным интерфейсом, похожий на Google Chrome",
          url: "https://github.com/egorozh/X-Filer",
        ),
      ],
    );
  }
}
