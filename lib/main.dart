import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/styles/themes.dart';
import 'package:news_app/modules/splash/splash_screen.dart';
import 'shared/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  MyApp({
    this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NewsCubit()
          ..getBusiness()
          ..getScience()
          ..getSports(),
        child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: theme,
              themeMode: ThemeMode.light,
              home: SplashScreen(),
            );
          },
        ));
  }
}
