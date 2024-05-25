// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/blog/data/repositories/blog_repository.dart' as _i4;
import '../features/blog/domain/domain.dart' as _i3;
import '../features/blog/domain/use_cases/get_articles.dart' as _i5;
import '../features/blog/presentation/manager/blog_bloc.dart' as _i9;
import '../features/my_projects/data/data_sources/data_sources.dart' as _i8;
import '../features/my_projects/data/repositories/my_projects_repository.dart'
    as _i7;
import '../features/my_projects/domain/domain.dart' as _i6;
import '../features/my_projects/domain/use_cases/get_projects.dart' as _i10;
import '../features/my_projects/presentation/manager/my_projects_bloc.dart'
    as _i11;

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
    gh.lazySingleton<_i3.IBlogRepository>(() => _i4.BlogRepository());
    gh.factory<_i5.GetArticles>(
        () => _i5.GetArticles(gh<_i3.IBlogRepository>()));
    gh.lazySingleton<_i6.IMyProjectsRepository>(
        () => _i7.MyProjectsRepository(gh<_i8.ProjectsApi>()));
    gh.factory<_i9.BlogBloc>(() => _i9.BlogBloc(gh<_i3.GetArticles>()));
    gh.factory<_i10.GetProjects>(
        () => _i10.GetProjects(gh<_i6.IMyProjectsRepository>()));
    gh.factory<_i11.MyProjectsBloc>(
        () => _i11.MyProjectsBloc(gh<_i6.GetProjects>()));
    return this;
  }
}
