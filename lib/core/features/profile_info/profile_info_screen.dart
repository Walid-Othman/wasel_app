import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/core/di/injection_container.dart';
import 'package:wasel_app/core/features/profile_info/cubit/profile_info_cubit.dart';
import 'package:wasel_app/core/features/profile_info/custome_profile_info_shimmer.dart';
import 'package:wasel_app/core/shared/custome_cached_network_image.dart';
import 'package:wasel_app/core/shared/widgets/cart_contanir.dart';
import 'package:wasel_app/core/shared/widgets/custome_item_icon.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';
import 'package:wasel_app/core/app_sizes/app_sizes.dart';
import 'package:wasel_app/core/config/request_status.dart';

class ProfileInfoScreen extends StatelessWidget {
  const ProfileInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProfileInfoCubit>()..getProfileInfo(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Personal Info', style: TextStyle(color: Colors.white)),
          backgroundColor: LightColors.orangeColor,
          iconTheme: const IconThemeData(color: Colors.white),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
        ),
        body: BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
          builder: (context, state) {
            final user = state.userProfile;
            switch (state.requestStatus) {
              case RequestStatus.loading:
                {
                  return CustomeProfileInfoShimmer();
                }
              case RequestStatus.initial:
                {
                  return const SizedBox.shrink();
                }
              case RequestStatus.error:
                {
                  return Center(child: Text(state.errorMessage.toString()));
                }
              case RequestStatus.loaded:
                {
                  return Padding(
                    padding: EdgeInsets.all(AppSizes.r10),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CartContanir(
                            child: Padding(
                              padding: EdgeInsets.all(AppSizes.r16),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: AppSizes.h80,
                                        height: AppSizes.h80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            AppSizes.r50,
                                          ),
                                        ),
                                        child: CustomeCachedNetworkImage(
                                          radius: AppSizes.r50,
                                          urlImage: user!.imagUrl,
                                        ),
                                      ),

                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          width: AppSizes.h30,
                                          height: AppSizes.h30,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              AppSizes.r50,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.camera_alt,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: AppSizes.h10),
                                  Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        AppSizes.r10,
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(AppSizes.r10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Full Name"),
                                              SizedBox(height: AppSizes.h10),
                                              Text(
                                                user!.fullName,
                                                style: TextStyle(
                                                  fontSize: AppSizes.sp16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Icon(Icons.edit),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: AppSizes.h16),
                          CartContanir(
                            child: Column(
                              children: [
                                CustomeItemIcon(trailing: Icon(Icons.edit)),

                                SizedBox(height: AppSizes.h20),

                                CustomeItemIcon(
                                  icon: Icon(Icons.email),
                                  title: "Email Address",
                                  subtitle: user.email,
                                  trailing: Icon(Icons.edit),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: AppSizes.h16),
                          CartContanir(
                            child: Column(
                              children: [
                                CustomeItemIcon(
                                  icon: Icon(Icons.date_range),
                                  title: "Data Of Birth",
                                  subtitle: user.dataOfBirth,
                                  trailing: Icon(Icons.edit),
                                ),

                                SizedBox(height: AppSizes.h20),

                                CustomeItemIcon(
                                  icon: Icon(Icons.location_city_rounded),
                                  title: "Location",
                                  subtitle: user.location,
                                  trailing: Icon(Icons.edit),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: AppSizes.h16),
                          ElevatedButton(
                            style: ButtonStyle(
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    AppSizes.r12,
                                  ),
                                ),
                              ),
                              fixedSize: WidgetStateProperty.all(
                                Size(MediaQuery.of(context).size.width, 50),
                              ),
                              backgroundColor: WidgetStateProperty.all(
                                LightColors.orangeColor,
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Save Changes",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
