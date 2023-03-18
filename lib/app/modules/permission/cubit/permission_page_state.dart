part of 'permission_page_cubit.dart';

class PagePermissionState extends Equatable {
  const PagePermissionState({
      this.statusPermission = GpsPermissionStatus.pure,
      
    });

  final GpsPermissionStatus statusPermission;
  
  

  PagePermissionState copyWith({
    GpsPermissionStatus? statusPermission, 
    
  
  }) =>
      PagePermissionState(
          statusPermission: statusPermission ?? this.statusPermission,

       
      );

  @override
  List<Object> get props => [statusPermission, ];
}
