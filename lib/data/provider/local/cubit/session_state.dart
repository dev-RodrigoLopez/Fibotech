part of 'session_cubit.dart';

class SessionState extends Equatable {
  
  const SessionState({
    this.sessionStatus = SessionStatus.none,
    this.viewGpsAlert = false,
    this.checkAppApptransparency  = false, 
  });

  final SessionStatus sessionStatus;
  final bool viewGpsAlert;
  final bool checkAppApptransparency;

  SessionState copyWith({
    SessionStatus? sessionStatus,
    bool? viewGpsAlert,
    bool? checkAppApptransparency,
  }) =>
    SessionState(
      sessionStatus: sessionStatus ?? this.sessionStatus,
      viewGpsAlert: viewGpsAlert ?? this.viewGpsAlert,
      checkAppApptransparency:checkAppApptransparency ?? this.checkAppApptransparency,
    );

  @override
  List<Object> get props => [
    sessionStatus,    
    viewGpsAlert,
  ];
}

