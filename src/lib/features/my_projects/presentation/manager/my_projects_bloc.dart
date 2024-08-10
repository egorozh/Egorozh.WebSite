import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';

part 'my_projects_bloc.freezed.dart';
part 'my_projects_event.dart';
part 'my_projects_state.dart';

@injectable
class MyProjectsBloc extends ContextBloc<MyProjectsEvent, MyProjectsState> {
  final GetProjects _getProjects;

  MyProjectsBloc(this._getProjects, @factoryParam BuildContext context) : super(const MyProjectsState.loading(), context) {
    on<_Started>(_onStarted);
    on<_Load>(_onLoad);
  }

  void _onStarted(_Started event, Emitter<MyProjectsState> emit) {
    add(const MyProjectsEvent.load());
  }

  Future<void> _onLoad(_Load event, Emitter<MyProjectsState> emit) async {
    emit(const MyProjectsState.loading());

    final locale = event.locale ?? Localizations.localeOf(context).languageCode;

    final result = await _getProjects(locale);

    switch (result) {
      case Success<List<ProjectListInfo>, DomainErrorType>():
        emit(MyProjectsState.loaded(result.data));
      case Error<List<ProjectListInfo>, DomainErrorType>():
        emit(const MyProjectsState.failure());
    }
  }
}
