import 'package:adroit_flutter/core/navigation/navigation_service.dart';
import 'package:adroit_flutter/core/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class AppLoadingBloc extends Cubit<AppLoadingState> {
  AppLoadingBloc() : super(AppNotLoading());

  /// Show loading dialog shortcut
  void show() => _showLoading();

  /// Hide loading dialog shortcut
  void hide() => _hideLoading();

  /// Show loading dialog
  Future<void> _showLoading() async {
    if (NavigationService.globalNavigatorKey.currentContext == null) {
      return;
    }
    if (state is AppLoading) {
      return;
    }
    emit(AppLoading());
    showCupertinoDialog<dynamic>(
        context: NavigationService.globalNavigatorKey.currentContext!,
        barrierDismissible: false,
        builder: (BuildContext dialogContext) {
          return LoadingWidget();
        }).then((v) => emit(AppNotLoading()));
  }

  void _hideLoading() {
    if (state is! AppLoading) {
      return;
    }
    emit(AppNotLoading());
    NavigationService.globalNavigatorKey.currentState?.pop();
  }
}

@immutable
abstract class AppLoadingState extends Equatable {
  final bool isShowing;

  AppLoadingState({this.isShowing = false});

  @override
  List get props => [isShowing];
}

class AppLoading extends AppLoadingState {
  AppLoading() : super(isShowing: true);
}

class AppNotLoading extends AppLoadingState {
  AppNotLoading() : super(isShowing: false);
}
