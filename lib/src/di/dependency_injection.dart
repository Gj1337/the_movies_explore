import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:the_movies_expore/src/di/dependency_injection.config.dart';

@InjectableInit(
  preferRelativeImports: false,
  asExtension: false,
)
Future<void> initializeDependencyContainer(GetIt getIt) async => init(getIt);
