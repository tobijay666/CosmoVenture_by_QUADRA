import 'package:cosmoventure/utils/app_images.dart';
import 'package:cosmoventure/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utils/app_colors.dart';
import '../widgets/gradient_button.dart';
import '../widgets/text_feild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
      backgroundColor: Colors.black,
    );
  }

  _bodyWidget() {
    // return Container(
    //   decoration: BoxDecoration(
    //     image: DecorationImage(
    //       image:
    //           AssetImage(AppImages.loginImage), // Replace with your image path
    //       fit: BoxFit.cover, // Adjust the image fitting as needed
    //     ),
    //   ),
    // );
    return SingleChildScrollView(
      child: Column(
        children: [
          Image(
            image: AssetImage(AppImages.loginImage),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.loginBottomImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
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
                      textEditingController: emailController,
                      labelText: AppStrings.id,
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
                      height: 8,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        AppStrings.forgotPassword,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.outlineColor,
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GradientButton(
                      isDisabled: false,
                      title: AppStrings.signIn,
                      onPress: () {
                        emailController.clear();
                        passwordController.clear();
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          AppStrings.signUpLink,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColors.outlineColor,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
