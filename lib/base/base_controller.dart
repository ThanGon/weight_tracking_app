import 'package:flutter/material.dart';
import 'package:weight_tracking_app/globals.dart';

class BaseController {
  // BASIC ERROR SNACKBAR IMPLEMENTATION
  void errorSnackbar(String errorMessage) {
    Globals.scaffoldMessengerKey.currentState
        ?.showSnackBar(SnackBar(content: Text(errorMessage)));
  }
}
