import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constant/color_const.dart';
import '../../../domain/entity/user_role.dart';
import '../cubit/login_cubit.dart';
import '../state/login_state.dart';
import '../widget/pharma_button.dart';
import '../widget/pharma_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordHidden = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void togglePassword() {
    setState(() {
      isPasswordHidden = !isPasswordHidden;
    });
  }

  void login() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please fill all fields")));
      return;
    }

    context.read<LoginCubit>().login(email: email, password: password);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isDarkMode = theme.brightness == Brightness.dark;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Login Failed'),
                content: Text(state.error),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
        if (state is LoginSuccessState) {
          final role = state.loginResponse.role;

          if (role == UserRole.admin) {
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (_) => AdminScreen(),
            //   ),
            // );
          } else if (role == UserRole.supplier) {
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (_) => SupplierScreen(),
            //   ),
            // );
          }
        }
      },
      builder: (context, state) {
        final bool isLoading = state is LoginLoadingState;
        return Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome back",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontFamily: 'Newsreader',
                    fontWeight: FontWeight.w700,
                    fontSize: 38,
                    color: isDarkMode
                        ? ColorConst.tertiary
                        : theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Access your premium pharmacy dashboard",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: isDarkMode
                        ? ColorConst.tertiary
                        : theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: size.width * 0.9,
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 28),
                  decoration: BoxDecoration(
                    color: ColorConst.surfaceLight,

                    borderRadius: BorderRadius.circular(38),

                    border: Border.all(color: ColorConst.border, width: 1.2),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PharmaTextField(
                        controller: emailController,
                        title: 'Email Address',
                        hint: 'supplier.smith@pharmalink.com',
                        prefixIcon: Icons.mail_outline,
                        obscureText: false,
                      ),
                      SizedBox(height: 24),
                      PharmaTextField(
                        controller: passwordController,
                        title: 'Password',
                        hint: '........',
                        prefixIcon: Icons.lock_outline,
                        obscureText: isPasswordHidden,
                        suffixIcon: TextButton(
                          onPressed: () {
                            togglePassword();
                          },
                          child: isPasswordHidden
                              ? const Icon(
                                  Icons.visibility_off_outlined,
                                  color: ColorConst.textDark,
                                )
                              : const Icon(
                                  Icons.visibility_outlined,
                                  color: ColorConst.textDark,
                                ),
                        ),
                      ),
                      SizedBox(height: 10),
                      PharmaButton(
                        onPressed: isLoading ? null : login,
                        text: "Sing In",
                        buttonIcon: Icons.arrow_forward_ios_rounded,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
