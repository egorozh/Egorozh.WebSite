import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_bloc.freezed.dart';
part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  late final BuildContext _context;

  ArticleBloc() : super(const ArticleState.loading()) {
    on<_Started>(_onStarted);
    on<_Load>(_onLoad);
  }

  void _onStarted(_Started event, Emitter<ArticleState> emit) {
    _context = event.context;

    final analytics = FirebaseAnalytics.instance;

    analytics.logScreenView(screenName: "ArticleScreen");

    add(const ArticleEvent.load());
  }

  Future<void> _onLoad(_Load event, Emitter<ArticleState> emit) async {
    emit(const ArticleState.loading());

    try {
      final data = await DefaultAssetBundle.of(_context).loadString('assets/article1.md');
      emit(ArticleState.loaded(data));
    } on Exception catch (e) {
      debugPrint(e.toString());
      emit(const ArticleState.failure());
    }
  }
}
