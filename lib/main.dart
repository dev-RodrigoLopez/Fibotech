import 'package:fibotech/core/mixin/after_first_layout_mixin.dart';
import 'package:fibotech/core/singleton/user_preferences_singletons.dart';
import 'package:fibotech/data/enums.dart';
import 'package:fibotech/data/provider/local/cubit/session_cubit.dart';
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
  late SessionCubit sessionCubit;
  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Future<void> onAfterFirstLayout() async {
    WidgetsBinding.instance.addObserver(this);
    await UserPreferences.initPrefts();      
    await sessionCubit.verifyUser();
  }

  void initSingleton({required BuildContext buildContext}) {
    sessionCubit = buildContext.read<SessionCubit>();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => SessionCubit(),
      child: BlocBuilder<SessionCubit, SessionState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: _navigatorKey,
            onGenerateRoute: routes,
            builder: (context, child) {
            initSingleton(buildContext: context);
              return MultiBlocListener(
                listeners: [
                  BlocListener<SessionCubit, SessionState>(
                    listener: (context, state) async {
                      switch (state.sessionStatus) {
                        case SessionStatus.success:
                          await _navigator.pushNamedAndRemoveUntil(
                            '/home',
                            (Route<dynamic> route) => false,
                          );
                          break;
                        case SessionStatus.none:
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
