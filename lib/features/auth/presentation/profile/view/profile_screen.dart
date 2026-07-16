import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_link_supplier/features/auth/presentation/login/view/login_screen.dart';
import 'package:pharma_link_supplier/features/auth/presentation/logout/cubit/logout_cubit.dart';
import 'package:pharma_link_supplier/features/auth/presentation/logout/state/logout_state.dart';
import 'package:pharma_link_supplier/features/auth/presentation/profile/cubit/profile_cubit.dart';
import 'package:pharma_link_supplier/features/auth/presentation/profile/state/profile_state.dart';

import '../../../../../core/constant/color_const.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    context.read<ProfileCubit>().profile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
      listener: (BuildContext context, LogoutState state) {
        if (state is LogoutSuccessState) {
          Navigator.pop(context);
          Future.delayed(Duration.zero, () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const LoginScreen()),
                  (route) => false,
            );
          });
        }
        if (state is LogoutErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.error,
                textAlign: TextAlign.center,

                style: const TextStyle(fontSize: 16),
              ),
            ),
          );
        }
      },
      child:  BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ProfileErrorState) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),

                  child: Text(
                    state.error,
                    textAlign: TextAlign.center,

                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFB42318),
                    ),
                  ),
                ),
              );
            }
            if (state is ProfileLoadedState) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(12),

                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,

                    borderRadius: BorderRadius.circular(30),

                    border: Border.all(color: ColorConst.border, width: 1),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 24,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                   child: Column(
                      children: [
                        Center(
                          child: Container(
                            height: 92,
                            width: 92,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFF3F4F6),
                            ),
                            child: const Icon(
                              Icons.person_outline,
                              color: Color(0xFF9CA3AF),
                              size: 34,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              state.profileResponse.name,
                              style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w700,
                                color: ColorConst.primary,
                                letterSpacing: 0.2,
                              ),
                            ),
                            Container(
                              width: 100,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xB0FDF7F7),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.verified_outlined,
                                    color: ColorConst.primary,
                                    size: 16,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    state.profileResponse.role.name,

                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                      color: ColorConst.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(20),
                          width: 400,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,

                            borderRadius: BorderRadius.circular(30),

                            border: Border.all(
                              color: ColorConst.border,
                              width: 1,
                            ),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.04),
                                blurRadius: 24,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),

                          child: Column(
                            children: [
                              Row(
                                spacing: 15,
                                children: [
                                  SizedBox(width: 1),
                                  Icon(
                                    Icons.badge_outlined,
                                    color: ColorConst.textDark,
                                    size: 25,
                                  ),

                                  Text(
                                    "Personal Information  ",
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: ColorConst.textDark,
                                      letterSpacing: 0.2,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                spacing: 10,
                                children: [
                                  SizedBox(width: 0.1),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE6DDD2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.person_outline,
                                      color: Color(0xFF504040),
                                      size: 20,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name",
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF827674),
                                          letterSpacing: 0.2,
                                        ),
                                      ),
                                      Text(
                                        state.profileResponse.name,
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          color: ColorConst.textDark,
                                          letterSpacing: 0.2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                spacing: 10,
                                children: [
                                  SizedBox(width: 0.1),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE6DDD2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.email_outlined,
                                      color: Color(0xFF504040),
                                      size: 20,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Email",
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFF827674),
                                            letterSpacing: 0.2,
                                          ),
                                        ),
                                        Text(
                                          state.profileResponse.email,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                            color: ColorConst.textDark,
                                            letterSpacing:0.2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                spacing: 10,
                                children: [
                                  SizedBox(width: 0.1),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE6DDD2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.call_outlined,
                                      color: Color(0xFF504040),
                                      size: 20,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Phone number",
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF827674),
                                          letterSpacing: 0.2,
                                        ),
                                      ),
                                      Text(
                                        state.profileResponse.phoneNumber,
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          color: ColorConst.textDark,
                                          letterSpacing: 0.2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(color: Colors.red),
                              backgroundColor: ColorConst.bgLight,
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),

                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    title: Text("Logout"),
                                    content: Text("Are you sure want logout ?"),
                                    actions: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          side: BorderSide(color: Colors.red),
                                          backgroundColor: ColorConst.bgLight,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 18,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              50,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8),

                                      ElevatedButton(
                                        onPressed: () {
                                          context.read<LogoutCubit>().logout();
                                        },
                                        child: Text("logout"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.logout_outlined, color: Colors.red),
                                SizedBox(width: 8),
                                Text(
                                  "Logout Account",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                ),
              );
            }
            return const SizedBox(
              child: Center(
                child: Text(
                  "Something wrong",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ),
            );
          },
        ),
      );
  }
}
