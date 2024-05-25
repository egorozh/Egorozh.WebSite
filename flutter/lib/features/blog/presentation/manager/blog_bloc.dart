import 'dart:async';

import 'package:egorozh_cv/core/domain/entities/domain_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';

part 'blog_bloc.freezed.dart';
part 'blog_event.dart';
part 'blog_state.dart';

@injectable
class BlogBloc extends Bloc<BlogEvent, BlogState> {
  late final BuildContext _context;

  final GetArticles _getArticles;

  BlogBloc(this._getArticles) : super(const BlogState.loading()) {
    on<_Started>(_onStarted);
    on<_Load>(_onLoad);
  }

  void _onStarted(_Started event, Emitter<BlogState> emit) {
    _context = event.context;

    add(const BlogEvent.load());
  }

  Future<void> _onLoad(_Load event, Emitter<BlogState> emit) async {
    emit(const BlogState.loading());

    final result = await _getArticles();

    switch (result) {
      case Success():
        emit(BlogState.loaded(result.data));
      case Error():
        emit(const BlogState.failure());
    }
  }
}
