import 'package:cosmoventure/main.dart';
import 'package:cosmoventure/presentaion/bloc/login/login_bloc.dart';
import 'package:cosmoventure/presentaion/pages/forgetPassword.dart';
import 'package:cosmoventure/presentaion/pages/home.dart';
import 'package:cosmoventure/presentaion/pages/register.dart';
import 'package:cosmoventure/utils/app_images.dart';
import 'package:cosmoventure/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../dependency_injection.dart';
import '../../utils/app_colors.dart';
import '../bloc/register/register_bloc.dart';
import '../widgets/dialog_spinner.dart';
import '../widgets/gradient_button.dart';
import '../widgets/message_dialog.dart';
import '../widgets/text_feild.dart';
import '../widgets/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginBloc bloc = sl<LoginBloc>();
  bool isLoading = false;

  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => bloc..add(AuthenticatingEvent()),
        child: BlocConsumer<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginInitial) {
              return _bodyWidget();
            }
            if (state is LoginSuccess) {
              print(state.id);
              return MyHomePage(index: 2, uid: state.id!);
            }

            if (state is LoginError) {
              return _bodyWidget();
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
            if (state is LoginError) {
              setState(() {
                isLoading = false;
              });

              MessageDialog dialog = MessageDialog(context,
                  title: state.errorTitle,
                  buttonTitle: AppStrings.tryAgain,
                  imagePath: AppImages.errorImage,
                  description: state.errorDesc, onPress: () {
                Navigator.pop(context);
                bloc.add(AuthenticatingEvent());
              });
              dialog.show();
            }
            if (state is LoginSuccess) {
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
              height: MediaQuery.of(context).size.height / 1.5,
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen()),
                        );
                      },
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
                        setState(() {
                          isLoading = true;
                        });

                        bloc.add(LoginEventRequested(
                            iId: idController.text,
                            password: passwordController.text));

                        idController.clear();
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
                                builder: (context) => SignupScreen()),
                          );
                        },
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
