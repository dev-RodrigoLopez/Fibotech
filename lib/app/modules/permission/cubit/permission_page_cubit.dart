// ignore_for_file: cancel_subscriptions

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fibotech/core/utils/utils.dart';
import 'package:fibotech/data/enums.dart';
import 'package:fibotech/data/provider/local/cubit/session_cubit.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
part 'permission_page_state.dart';

class PagePermissionCubit extends Cubit<PagePermissionState> {
  PagePermissionCubit({required this.sessionCubit,required this.controller, }) : super( const PagePermissionState());

  final SessionCubit sessionCubit; 
  final PageController controller; 
   static final gpsIsActive = Geolocator.getServiceStatusStream();
  StreamSubscription<dynamic>?  listen; 

  Future<void> init() async {

    final check = await Geolocator.isLocationServiceEnabled();

    emit(state.copyWith(statusPermission: check ? GpsPermissionStatus.pure : GpsPermissionStatus.notactivated));
    
    if(Platform.isIOS){
      if(await Permission.location.status.isGranted){
        await controller.animateToPage(1, duration: const Duration(milliseconds: 500),curve: Curves.easeIn);
      }
    }

    listen = gpsIsActive.listen(
      (event) async {  
        final bool =  await Geolocator.isLocationServiceEnabled();
          final laststate = state.statusPermission;
          if( bool){        
            if( await Utils.checkPermission()){
             
              try{
                final laststate = state.statusPermission;
                emit(state.copyWith(statusPermission: Platform.isAndroid ?  GpsPermissionStatus.waiting : GpsPermissionStatus.pure));
                if(Platform.isAndroid)sessionCubit.alertGps();
                if(Platform.isIOS && laststate != GpsPermissionStatus.notactivated)await controller.animateToPage(1, duration: const Duration(milliseconds: 500),curve: Curves.easeIn);
               
              }
              catch(e){
                log( e.toString());
              }
               return;
            
            }
            emit(state.copyWith(statusPermission: GpsPermissionStatus.pure));
            if(Platform.isIOS && laststate != GpsPermissionStatus.notactivated )await controller.animateToPage(0, duration: const Duration(milliseconds: 500),curve: Curves.easeIn);
            return;        
          }
        emit(state.copyWith(statusPermission: GpsPermissionStatus.notactivated)); 
      }
    );
  }

  Future<void> getPermissionStatus({required PageController controller}) async {    
    final request = await Utils.requestpermitionCheckGps();
    if (request == GpsPermissionStatus.successFull) {
      if(Platform.isAndroid) {
        sessionCubit.alertGps();  
        return;           
      }
      await controller.animateToPage(1, duration: const Duration(milliseconds: 500),curve: Curves.easeIn);
      
    }  
    if(request ==  GpsPermissionStatus.deniedForever ){
      await openAppSettings();
    }
  }

  Future<void> getAppTransparency() async {    
    await Permission.appTrackingTransparency.request();
    sessionCubit.alertGps();
  }


  Future<void> cubitDispose() async{}

  @override
  Future<void> close() async {
    controller.dispose();
     await  listen!.cancel();
    return super.close();
  }

}
