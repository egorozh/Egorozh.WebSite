import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../../../router/router.dart';
import '../../domain/domain.dart';

part 'blog_bloc.freezed.dart';
part 'blog_event.dart';
part 'blog_state.dart';

@injectable
class BlogBloc extends ContextBloc<BlogEvent, BlogState> {
  final GetArticles _getArticles;

  BlogBloc(this._getArticles, @factoryParam BuildContext context) : super(const BlogState.loading(), context) {
    on<_Started>(_onStarted);
    on<_Load>(_onLoad);
    on<_GoToArticle>(_onGoToArticle);
  }

  void _onStarted(_Started event, Emitter<BlogState> emit) {
    add(const BlogEvent.load());
  }

  Future<void> _onLoad(_Load event, Emitter<BlogState> emit) async {
    emit(const BlogState.loading());

    final locale = event.locale ?? Localizations.localeOf(context).languageCode;

    final result = await _getArticles(locale);

    switch (result) {
      case Success():
        emit(BlogState.loaded(result.data));
      case Error():
        emit(const BlogState.failure());
    }
  }

  Future<void> _onGoToArticle(_GoToArticle event, Emitter<BlogState> emit) async {
    if (event.article.url?.isNotEmpty ?? false) {
      await UrlHelper.open(event.article.url!);
      return;
    }

    await context.push("${Routes.articleRoute}/${event.article.id.toString()}");
  }
}
