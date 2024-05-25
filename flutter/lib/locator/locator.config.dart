// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/blog/data/repositories/blog_repository.dart' as _i6;
import '../features/blog/domain/domain.dart' as _i5;
import '../features/blog/domain/use_cases/get_articles.dart' as _i9;
import '../features/blog/presentation/manager/blog_bloc.dart' as _i10;
import '../features/my_projects/data/repositories/my_projects_repository.dart'
    as _i4;
import '../features/my_projects/domain/domain.dart' as _i3;
import '../features/my_projects/domain/use_cases/get_projects.dart' as _i7;
import '../features/my_projects/presentation/manager/my_projects_bloc.dart'
    as _i8;

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
    gh.lazySingleton<_i5.IBlogRepository>(() => _i6.BlogRepository());
    gh.factory<_i7.GetProjects>(
        () => _i7.GetProjects(gh<_i3.IMyProjectsRepository>()));
    gh.factory<_i8.MyProjectsBloc>(
        () => _i8.MyProjectsBloc(gh<_i3.GetProjects>()));
    gh.factory<_i9.GetArticles>(
        () => _i9.GetArticles(gh<_i5.IBlogRepository>()));
    gh.factory<_i10.BlogBloc>(() => _i10.BlogBloc(gh<_i5.GetArticles>()));
    return this;
  }
}
