// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/my_projects/data/repositories/my_projects_repository.dart'
    as _i4;
import '../features/my_projects/domain/domain.dart' as _i3;
import '../features/my_projects/domain/use_cases/get_projects.dart' as _i5;
import '../features/my_projects/presentation/manager/my_projects_bloc.dart'
    as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.IMyProjectsRepository>(
        () => _i4.MyProjectsRepository());
    gh.factory<_i5.GetProjects>(
        () => _i5.GetProjects(gh<_i3.IMyProjectsRepository>()));
    gh.factory<_i6.MyProjectsBloc>(
        () => _i6.MyProjectsBloc(gh<_i3.GetProjects>()));
    return this;
  }
}
