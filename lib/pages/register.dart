import 'package:cosmoventure/pages/login.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_strings.dart';
import '../widgets/gradient_button.dart';
import '../widgets/text_feild.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController unameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController CPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: _bodyWidget(),
      backgroundColor: Colors.black,
    );
  }

  _bodyWidget() {
    return Column(
      children: [
        const Image(
          image: AssetImage(AppImages.loginImage),
        ),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.loginBottomImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppStrings.loginWelcome,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: AppColors.whiteColor,
                              ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      textInputAction: TextInputAction.next,
                      textEditingController: idController,
                      labelText: AppStrings.id,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      textInputAction: TextInputAction.next,
                      textEditingController: unameController,
                      labelText: AppStrings.uname,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      textInputAction: TextInputAction.next,
                      textEditingController: passwordController,
                      labelText: AppStrings.password,
                      obscureText: true,
                      lines: 1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      textInputAction: TextInputAction.next,
                      textEditingController: CPasswordController,
                      labelText: AppStrings.cPassword,
                      obscureText: true,
                      lines: 1,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GradientButton(
                      isDisabled: false,
                      title: AppStrings.signUp,
                      onPress: () {
                        idController.clear();
                        unameController.clear();
                        CPasswordController.clear();
                        passwordController.clear();
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          AppStrings.signInLink,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColors.outlineColor,
                                  ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
