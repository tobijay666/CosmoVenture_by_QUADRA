import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../widgets/gradient_button.dart';
import '../widgets/text_feild.dart';
import 'login.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.5,
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
                    AppStrings.forgotPassword,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
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
                  const SizedBox(
                    height: 40,
                  ),
                  GradientButton(
                    isDisabled: false,
                    title: AppStrings.forgot,
                    onPress: () {
                      idController.clear();
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        AppStrings.backToSignInLink,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.outlineColor,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
