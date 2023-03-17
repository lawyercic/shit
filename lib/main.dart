import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawer/features/presentation/controller/bloc/lawyerd%20bloc/lawyerd_bloc.dart';

import 'core/serivce locator/service_locator.dart';
// import 'features/presentation/controller/bloc/my_bloc_observer.dart';
import 'features/presentation/controller/bloc/theme bloc/theme_bloc.dart';
import 'features/presentation/screens/auth.dart';
import 'features/presentation/screens/login.dart';
import 'features/presentation/screens/signup.dart';
import 'features/presentation/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  //Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  await Firebase.initializeApp();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => LawyerdBloc(sl(), sl())..add(LogInEvent()),
    ),
    BlocProvider(
      create: (context) => ThemeBloc()..add(LightThemeEvent()),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      if (state is Light) {
        return MaterialApp(
            title: 'Lawyer App',
            theme: state.themeData,
            debugShowCheckedModeBanner: false,
            home: Splash());
      }
      if (state is Dark) {
        return MaterialApp(
            title: 'Lawyer App',
            theme: state.themeData,
            debugShowCheckedModeBanner: false,
            //home:Splash(),
            initialRoute: 'Welcom_screen',
            routes: {
              '/':(context) => const Auth(),
              'Welcom_screen':(context) => Splash(),
              'login_screen':(context) => LogInScreen(),
              'SignupScreen':(context) =>  SignupScreen(),

            }
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
