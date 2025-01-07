import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ivn/app/core/bloc/bloc_providers.dart';
import 'package:flutter_ivn/app/router/app_router.dart';
import 'package:flutter_ivn/injection_container.dart' as di;
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /* Initialization Dependecy Injection */
  await di.init();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.providers,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(),
        theme: ThemeData(
          textTheme: GoogleFonts.interTextTheme(),
          primarySwatch: Colors.green,
          primaryColor: Colors.green,
        ),
      ),
    );
  }
}
