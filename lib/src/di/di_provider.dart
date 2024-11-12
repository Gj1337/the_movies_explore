import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class DiProvider extends StatefulWidget {
  const DiProvider({
    required this.child,
    required this.getIt,
    this.setupGetIt,
    super.key,
  });

  final GetIt getIt;
  final Future<void> Function(GetIt getIt)? setupGetIt;

  final Widget child;

  static GetIt of(BuildContext context) => _DiProvider.of(context).getIt;

  @override
  State<DiProvider> createState() => _DiProviderState();
}

class _DiProviderState extends State<DiProvider> {
  Future<void> _getItSetup() async {
    await widget.setupGetIt?.call(widget.getIt);
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: _getItSetup(),
        builder: (_, asyncSnapshot) => switch (asyncSnapshot.connectionState) {
          ConnectionState.none ||
          ConnectionState.waiting ||
          ConnectionState.active =>
            const SizedBox(),
          ConnectionState.done => _DiProvider(
              getIt: widget.getIt,
              child: widget.child,
            )
        },
      );
}

class _DiProvider extends InheritedWidget {
  const _DiProvider({
    required this.getIt,
    required super.child,
  });

  final GetIt getIt;

  static _DiProvider of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<_DiProvider>();

    return result ?? (throw Exception('No DiProvider found in context'));
  }

  @override
  bool updateShouldNotify(_DiProvider oldWidget) => getIt != oldWidget.getIt;
}

extension GetItExtension on BuildContext {
  GetIt get getIt => DiProvider.of(this);
}
