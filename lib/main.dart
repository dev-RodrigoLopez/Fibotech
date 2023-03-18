import 'package:fibotech/app/modules/home/cubit/home_cubit.dart';
import 'package:fibotech/core/mixin/after_first_layout_mixin.dart';
import 'package:fibotech/core/singleton/user_preferences_singletons.dart';
import 'package:fibotech/data/enums.dart';
import 'package:fibotech/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver, AfterFirstLayoutMixin{

  final _navigatorKey = GlobalKey<NavigatorState>();
  late HomeCubit homeCubit;
  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Future<void> onAfterFirstLayout() async {
    WidgetsBinding.instance.addObserver(this);
    await UserPreferences.initPrefts();      
    await homeCubit.verifyUser();
  }

  void initSingleton({required BuildContext buildContext}) {
    homeCubit = buildContext.read<HomeCubit>();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          initSingleton(buildContext: context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: _navigatorKey,
            onGenerateRoute: routes,
            builder: (context, child) {
              return MultiBlocListener(
                listeners: [
                  BlocListener<HomeCubit, HomeState>(
                    listener: (context, state) async {
                      switch (state.sessionStatus) {
                        case SessionStatus.success:
                          await _navigator.pushNamedAndRemoveUntil(
                            '/home',
                            (Route<dynamic> route) => false,
                          );
                          break;
                        case SessionStatus.gpsbadstate:
                          await _navigator.pushNamedAndRemoveUntil(
                            '/permission',
                            (Route<dynamic> route) => false,
                          );
                          break;
                      }
                    },
                  ),
                ],
                child: child!,
              );
            },
          );
        },
      ),
    );

  }
}
