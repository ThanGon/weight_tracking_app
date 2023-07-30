// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SetupController on _SetupController, Store {
  late final _$isLoadingAtom =
      Atom(name: '_SetupController.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$proceedToNextActionAtom =
      Atom(name: '_SetupController.proceedToNextAction', context: context);

  @override
  bool get proceedToNextAction {
    _$proceedToNextActionAtom.reportRead();
    return super.proceedToNextAction;
  }

  @override
  set proceedToNextAction(bool value) {
    _$proceedToNextActionAtom.reportWrite(value, super.proceedToNextAction, () {
      super.proceedToNextAction = value;
    });
  }

  late final _$_SetupControllerActionController =
      ActionController(name: '_SetupController', context: context);

  @override
  void next() {
    final _$actionInfo = _$_SetupControllerActionController.startAction(
        name: '_SetupController.next');
    try {
      return super.next();
    } finally {
      _$_SetupControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleIsLoading() {
    final _$actionInfo = _$_SetupControllerActionController.startAction(
        name: '_SetupController.toggleIsLoading');
    try {
      return super.toggleIsLoading();
    } finally {
      _$_SetupControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
proceedToNextAction: ${proceedToNextAction}
    ''';
  }
}
