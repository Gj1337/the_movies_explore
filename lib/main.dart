import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_movies_expore/src/movies_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MoviesApp());
}
