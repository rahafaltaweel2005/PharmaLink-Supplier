import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constant/color_const.dart';
import '../../login/widget/pharma_button.dart';
import '../../login/widget/pharma_text_field.dart';
import '../cubit/register_cubit.dart';
import '../state/register_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  bool isPasswordHidden = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();

    super.dispose();
  }

  void register() {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;
    final phone = phoneNumberController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty || phone.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please fill all fields")));
      return;
    }

    context.read<RegisterCubit>().register(
      name: name,
      email: email,
      password: password,
      phoneNumber: phone,
    );
  }

  void togglePassword() {
    setState(() {
      isPasswordHidden = !isPasswordHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SizedBox(height: 10),

            const Text(
              "Create Supplier\nAccount",

              style: TextStyle(
                height: 1.1,
                fontSize: 44,
                fontWeight: FontWeight.bold,
                color: ColorConst.primary,
                fontFamily: 'Newsreader',
              ),
            ),

            const SizedBox(height: 5),

            Expanded(
              child: BlocConsumer<RegisterCubit, RegisterState>(
                listener: (context, state) {
                  if (state is RegisterErrorState) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.error)));
                  }

                  if (state is RegisterSuccessState) {
                    AlertDialog(
                      title: const Text('Create Account'),
                      content: const SingleChildScrollView(
                        child: Text("Supplier created successfully"),
                      ),
                      actions: [
                        SizedBox(

                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Ok"),
                          ),
                        ),
                      ],
                    );
                  }
                },
                builder: (context, state) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PharmaTextField(
                          controller: nameController,
                          title: "Full Name",
                          hint: "Ahmad Fayez",
                          prefixIcon: Icons.person_outline,
                          obscureText: false,
                        ),

                        const SizedBox(height: 20),

                        PharmaTextField(
                          controller: emailController,
                          title: "Email Address",
                          hint: "ahmad@gmail.com",
                          prefixIcon: Icons.email_outlined,
                          obscureText: false,
                        ),

                        const SizedBox(height: 20),

                        PharmaTextField(
                          controller: phoneNumberController,
                          title: "Phone Number",
                          hint: "+962 7XXXXXXXX",
                          prefixIcon: Icons.phone_outlined,
                          obscureText: false,
                        ),

                        const SizedBox(height: 20),

                        PharmaTextField(
                          controller: passwordController,
                          title: "Password",
                          hint: "********",
                          prefixIcon: Icons.lock_outline,
                          obscureText: isPasswordHidden,
                          suffixIcon: IconButton(
                            onPressed: togglePassword,
                            icon: Icon(
                              isPasswordHidden
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: ColorConst.primary,
                            ),
                          ),
                        ),

                        const SizedBox(height: 35),

                        PharmaButton(
                          onPressed: () {
                            context.read<RegisterCubit>().register(
                              name: nameController.text.trim(),
                              email: emailController.text.trim(),
                              password: passwordController.text,
                              phoneNumber: phoneNumberController.text.trim(),
                            );
                          },
                          text: "Create Account",
                          buttonIcon: Icons.arrow_forward_ios_rounded,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );

  }
}
