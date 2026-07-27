import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wasel_app/core/config/request_status.dart';
import 'package:wasel_app/core/features/profile_info/model/profile_info_model.dart';

part 'profile_info_state.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {
  ProfileInfoCubit() : super(ProfileInfoState());

  void getProfileInfo() async {
    if (isClosed) {
      return;
    }

    try {
      emit(state.copyWith(requestStatus: RequestStatus.loading));
     await Future.delayed(Duration(seconds: 2));
      emit(
        state.copyWith(
          requestStatus: RequestStatus.loaded,
          userProfile: ProfileInfoModel(
            imagUrl:
                'https://i.pinimg.com/1200x/4f/37/26/4f3726e481efeca38abe2e991cd773b9.jpg',
            fullName: 'Walid Othman',
            phoneNumber: '01156717761',
            email: 'Walid@gmail.com',
            dataOfBirth: '20 Nov 1996',
            location: 'Sohag,Egypt',
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          requestStatus: RequestStatus.error,
        ),
      );
    }
  }
}
