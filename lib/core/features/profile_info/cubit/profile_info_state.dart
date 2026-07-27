part of 'profile_info_cubit.dart';

class ProfileInfoState extends Equatable {
  final RequestStatus requestStatus;
  final ProfileInfoModel? userProfile; 
  final String? errorMessage;         
  const ProfileInfoState({
    this.requestStatus = RequestStatus.initial,
    this.userProfile,
    this.errorMessage,
  });

  ProfileInfoState copyWith({
    RequestStatus? requestStatus,
    ProfileInfoModel? userProfile,
    String? errorMessage,
  }) {
    return ProfileInfoState(
      requestStatus: requestStatus ?? this.requestStatus,
      userProfile: userProfile ?? this.userProfile,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
  
  @override
 
  List<Object?> get props => [requestStatus, userProfile, errorMessage];
}