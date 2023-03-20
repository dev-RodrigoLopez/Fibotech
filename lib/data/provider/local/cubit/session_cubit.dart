import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fibotech/core/singleton/user_preferences_singletons.dart';
import 'package:fibotech/core/utils/utils.dart';
import 'package:fibotech/data/enums.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

part 'session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  SessionCubit( ) : super(const SessionState());

  bool inicialitedListener = false;
  late StreamSubscription<dynamic> listenGpsActivate;
  static final gpsIsActive = Geolocator.getServiceStatusStream();

  Future<void> verifyUser() async {
    if (await Utils.checkPermission()) {
      await Geolocator.isLocationServiceEnabled();

      if (!inicialitedListener) {
        await changeStatusGps();
      }

      emit(
        state.copyWith(
          sessionStatus: UserPreferences.getAlert
            ? SessionStatus.success
            : SessionStatus.gpsbadstate,
          viewGpsAlert: UserPreferences.getAlert,
          checkAppApptransparency: UserPreferences.checkAppApptransparency,
        ),
      );
      return;

    }
    emit(
      state.copyWith(
        sessionStatus: SessionStatus.gpsbadstate,
      ),
    );
  }
    // });

  void alertGps() {
    // if(UserPreferences.getAlert != null ){
      // final goToHome = goHome(idUsuarioTeam: UserPreferences.user!.idTeam);
      UserPreferences.getAlert = true;
      // UserPreferences.checkAppApptransparency = true;
      emit(
        state.copyWith(
          viewGpsAlert: true,
          sessionStatus: SessionStatus.success,
          // checkAppApptransparency: true,
        ),
      );
    // }
  }

  Future<void> changeStatusGps() async {
    inicialitedListener = true;
    listenGpsActivate = gpsIsActive.listen((change) async {
      final bool = await Geolocator.isLocationServiceEnabled();

      if (bool && await Permission.location.isGranted) {
        await verifyUser();
        return;
      }
      emit(
        state.copyWith(
          sessionStatus: SessionStatus.gpsbadstate,
        ),
      );
    });
  }

  // Future<void> diposeCubit() async {
  //   await listenGpsActivate.cancel();
  // }


}
