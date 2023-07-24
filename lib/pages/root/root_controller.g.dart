// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'root_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RootController on _RootControllerBase, Store {
  late final _$mustCreateUserAtom =
      Atom(name: '_RootControllerBase.mustCreateUser', context: context);

  @override
  bool get mustCreateUser {
    _$mustCreateUserAtom.reportRead();
    return super.mustCreateUser;
  }

  @override
  set mustCreateUser(bool value) {
    _$mustCreateUserAtom.reportWrite(value, super.mustCreateUser, () {
      super.mustCreateUser = value;
    });
  }

  late final _$mainUserAtom =
      Atom(name: '_RootControllerBase.mainUser', context: context);

  @override
  User? get mainUser {
    _$mainUserAtom.reportRead();
    return super.mainUser;
  }

  @override
  set mainUser(User? value) {
    _$mainUserAtom.reportWrite(value, super.mainUser, () {
      super.mainUser = value;
    });
  }

  late final _$_RootControllerBaseActionController =
      ActionController(name: '_RootControllerBase', context: context);

  @override
  void flagMustCreateUser() {
    final _$actionInfo = _$_RootControllerBaseActionController.startAction(
        name: '_RootControllerBase.flagMustCreateUser');
    try {
      return super.flagMustCreateUser();
    } finally {
      _$_RootControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMainUser(User? user) {
    final _$actionInfo = _$_RootControllerBaseActionController.startAction(
        name: '_RootControllerBase.setMainUser');
    try {
      return super.setMainUser(user);
    } finally {
      _$_RootControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mustCreateUser: ${mustCreateUser},
mainUser: ${mainUser}
    ''';
  }
}
