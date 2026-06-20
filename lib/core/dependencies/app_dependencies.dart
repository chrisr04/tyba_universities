import 'package:flutter/material.dart';
import 'package:tyba_universities/core/dependencies/global_dependencies.dart';
import 'package:provider/provider.dart';
import 'package:tyba_universities/features/home/config/dependencies/home_dependencies.dart';

class AppDependencies extends StatelessWidget {
  const AppDependencies({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...GlobalDependencies.providers,
        ...HomeDependencies.providers,
      ],
      child: child,
    );
  }
}
