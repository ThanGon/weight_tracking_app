import 'package:flutter/material.dart';
import 'package:weight_tracking_app/core/globals.dart';
import 'package:weight_tracking_app/repositories/base/base_repository.dart';

abstract class BaseController<T extends BaseRepository> {
  final T repository;

  BaseController(this.repository);

  // BASIC ERROR SNACKBAR IMPLEMENTATION
  void errorSnackbar(String errorMessage) {
    Globals.scaffoldMessengerKey.currentState
        ?.showSnackBar(SnackBar(content: Text(errorMessage)));
  }

  void init();
}
