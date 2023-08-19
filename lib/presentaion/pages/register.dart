import 'package:cosmoventure/presentaion/pages/login.dart';
import 'package:cosmoventure/presentaion/pages/walkthrough.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dependency_injection.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../bloc/register/register_bloc.dart';
import '../widgets/gradient_button.dart';
import '../widgets/message_dialog.dart';
import '../widgets/text_feild.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final RegisterBloc bloc = sl<RegisterBloc>();
  bool isLoading = false;

  final TextEditingController idController = TextEditingController();
  final TextEditingController unameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController CPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocProvider(
        create: (_) => bloc..add(RegisterLoading()),
        child: BlocConsumer<RegisterBloc, RegisterState>(
          builder: (context, state) {
            if (state is RegisterInitial) {
              return _bodyWidget();
            }
            if (state is RegisterError) {
              return _bodyWidget();
            }
            if (state is RegisterSuccess) {
              return WalkThroughScreen();
            }
            return const Scaffold(
              backgroundColor: AppColors.black,
              body: Center(
                child: CircularProgressIndicator(
                  backgroundColor: AppColors.outlineColor,
                ),
              ),
            );
          },
          listener: (context, state) {
            if (state is RegisterError) {
              setState(() {
                isLoading = false;
              });

              MessageDialog dialog = MessageDialog(context,
                  title: state.errorTitle,
                  buttonTitle: AppStrings.tryAgain,
                  imagePath: AppImages.errorImage,
                  description: state.errorDesc, onPress: () {
                Navigator.pop(context);
                bloc.add(RegisterLoading());
              });
              dialog.show();
            }
            if (state is RegisterSuccess) {
              idController.clear();
              unameController.clear();
              CPasswordController.clear();
              passwordController.clear();
              setState(() {
                isLoading = false;
              });

              MessageDialog dialog = MessageDialog(context,
                  title: state.successTitle,
                  buttonTitle: AppStrings.ok,
                  imagePath: AppImages.successImage,
                  description: state.successDesc, onPress: () {
                Navigator.pop(context);
              });
              dialog.show();
            }
          },
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  _bodyWidget() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Image(
              image: AssetImage(AppImages.loginImage),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
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
                      AppStrings.signUpWelcome,
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
                        setState(() {
                          isLoading = true;
                        });

                        bloc.add(RegisterEventRequested(
                          name: unameController.text,
                          cPassword: CPasswordController.text,
                          iId: idController.text,
                          password: passwordController.text,
                        ));

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => WalkThroughScreen()));
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
          ],
        ),
      ),
    );
  }
}
