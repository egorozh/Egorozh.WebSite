import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';

part 'article_bloc.freezed.dart';
part 'article_event.dart';
part 'article_state.dart';

@injectable
class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final GetArticle _getArticle;

  late final BuildContext _context;
  late final DomainId _id;

  ArticleBloc(this._getArticle) : super(const ArticleState.loading()) {
    on<_Started>(_onStarted);
    on<_Load>(_onLoad);
  }

  void _onStarted(_Started event, Emitter<ArticleState> emit) {
    _context = event.context;
    _id = event.id;

    final analytics = FirebaseAnalytics.instance;

    analytics.logScreenView(screenName: "ArticleScreen");

    add(const ArticleEvent.load());
  }

  Future<void> _onLoad(_Load event, Emitter<ArticleState> emit) async {
    emit(const ArticleState.loading());

    final locale = event.locale ?? Localizations.localeOf(_context).languageCode;

    final result = await _getArticle(_id, locale);

    switch (result) {
      case Success<String, DomainErrorType>():
        emit(ArticleState.loaded(result.data));
      case Error<String, DomainErrorType>():
        emit(const ArticleState.failure());
    }
  }
}
