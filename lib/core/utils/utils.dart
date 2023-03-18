  import 'package:fibotech/data/enums.dart';
import 'package:permission_handler/permission_handler.dart';

class Utils{
    static Future<bool> checkPermission() async {
      return await Permission.location.isGranted ||
        await Permission.location.isLimited ||
        await Permission.location.isRestricted;
    }

    static Future<GpsPermissionStatus> requestpermitionCheckGps() async {
    final permissionStatus = await Permission.location.request();
    late GpsPermissionStatus status;
    switch (permissionStatus) {
      case PermissionStatus.granted:
        status = GpsPermissionStatus.successFull;
        break;
      case PermissionStatus.restricted:
        status = GpsPermissionStatus.successFull;
        break;
      case PermissionStatus.limited:
        status = GpsPermissionStatus.successFull;
        break;
      case PermissionStatus.permanentlyDenied:
        status = GpsPermissionStatus.deniedForever;
        break;
      case PermissionStatus.denied:
        status = GpsPermissionStatus.denied;
        break;
    }
    return status;
    }

    static int roundOutGrades(double grade){
      final lgrade = grade.toString().split('.');
      if( lgrade.length > 1 ){
        final porcent = lgrade[1];
        if( int.parse( porcent) > 50 )
        {
          return int.parse( lgrade[0] ) + 1;
        } 
        else{
          return int.parse(lgrade[0]);  
        }
      }else{
        return int.parse(lgrade[0]);    
      }
    }

    static String validateCityAndState({ required String city, required String state }){
      final nameCompleted = '$city, $state';
      if( nameCompleted.length > 20 ){
        return city;
      }
      return nameCompleted;
    }

     static String validateCityAndStateCardPopular({ required String city, required String state }){
      final nameCompleted = '$city, $state';
      if( nameCompleted.length > 18 ){
        return city;
      }
      return nameCompleted;
    }

  }
  