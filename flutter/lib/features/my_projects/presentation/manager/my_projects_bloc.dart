import 'dart:async';

import 'package:egorozh_cv/core/domain/entities/domain_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';

part 'my_projects_bloc.freezed.dart';
part 'my_projects_event.dart';
part 'my_projects_state.dart';

@injectable
class MyProjectsBloc extends Bloc<MyProjectsEvent, MyProjectsState> {
  final GetProjects _getProjects;

  late final BuildContext _context;

  MyProjectsBloc(this._getProjects) : super(const MyProjectsState.loading()) {
    on<_Started>(_onStarted);
    on<_Load>(_onLoad);
  }

  void _onStarted(_Started event, Emitter<MyProjectsState> emit) {
    _context = event.context;

    add(const MyProjectsEvent.load());
  }

  Future<void> _onLoad(_Load event, Emitter<MyProjectsState> emit) async {
    emit(const MyProjectsState.loading());

    final result = await _getProjects();

    switch (result) {
      case Success<List<ProjectListInfo>, DomainErrorType>():
        emit(MyProjectsState.loaded(result.data));
      case Error<List<ProjectListInfo>, DomainErrorType>():
        emit(const MyProjectsState.failure());
    }
  }
}
