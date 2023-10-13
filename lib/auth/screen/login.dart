import 'package:chatlly/auth/auth.dart';
import 'package:chatlly/auth/bloc/auth_bloc.dart';
import 'package:chatlly/chats/screen/screen.dart';
import 'package:chatlly/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = true;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state == const AuthState.unauthenticated()) {
          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(30.0.sp),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('ChatllY'),
                        const Divider(),
                        const Text('Login'),
                        SizedBox(height: 45.h),
                        AuthTextField(
                          controller: emailController,
                          labe: 'Email',
                          hint: 'musa.damu@gmail.com',
                          inputType: TextInputType.emailAddress,
                          validator: (s) {
                            if (s!.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!kEmailRegex.hasMatch(s)) {
                              return 'Invalid email address';
                            }

                            return null;
                          },
                        ),
                        SizedBox(height: 20.h),
                        AuthTextField(
                          controller: passwordController,
                          labe: 'Password',
                          hint: '******',
                          isPasswordField: true,
                          isPasswordVisible: isPasswordVisible,
                          onPasswordVisibilityChanged: () {
                            setState(
                              () {
                                isPasswordVisible = !isPasswordVisible;
                              },
                            );
                          },
                          validator: (s) {
                            if (s!.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (s.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 40.h),
                        SizedBox(
                          width: double.infinity,
                          height: 45.h,
                          child: ElevatedButton(
                            onPressed: _validateAndLogin,
                            child: const Text('Login'),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        SizedBox(
                          width: double.infinity,
                          height: 45.h,
                          child: TextButton(
                            onPressed: () {
                              context.pushReplacement(const RegisterScreen());
                            },
                            child: const Text('Dont\'t have an account?'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return const AllChatsListScreen();
      },
    );
  }

  void _validateAndLogin() {
    if (formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            AuthLogInRequested(
              emailController.text,
              passwordController.text,
            ),
          );
    }
  }
}
