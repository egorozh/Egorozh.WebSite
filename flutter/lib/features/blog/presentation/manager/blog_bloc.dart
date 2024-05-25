import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_bloc.freezed.dart';
part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  late final BuildContext _context;

  BlogBloc() : super(const BlogState.loading()) {
    on<_Started>(_onStarted);
    on<_Load>(_onLoad);
  }

  void _onStarted(_Started event, Emitter<BlogState> emit) {
    _context = event.context;

    add(const BlogEvent.load());
  }

  Future<void> _onLoad(_Load event, Emitter<BlogState> emit) async {
    emit(const BlogState.loading());

    try {
      final data = await DefaultAssetBundle.of(_context).loadString('assets/article1.md');
      emit(BlogState.loaded(data));
    } on Exception catch (e) {
      debugPrint(e.toString());
      emit(const BlogState.failure());
    }
  }
}
