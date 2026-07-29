import 'package:artificially_unified_responsive_intelligent_xpert/Bloc/aurix_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AurixBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title:  'Aurix',
        theme: ThemeData.dark(useMaterial3: true),
      ),
    );
  }
}
