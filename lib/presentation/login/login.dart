import 'package:flutter/material.dart';
import 'package:flutter_advanced_app/presentation/login/login_viewmodel.dart';
import 'package:flutter_advanced_app/presentation/resources/assets_manager.dart';
import 'package:flutter_advanced_app/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_app/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_app/presentation/resources/values_manager.dart';

import '../../app/di.dart';
import '../resources/routes_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewModel _viewModel = instance<LoginViewModel>();

  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _bind() {
    _viewModel.start();
    _userNameController
        .addListener(() => _viewModel.setUserName(_userNameController.text));
    _passwordController
        .addListener(() => _viewModel.setPassword(_passwordController.text));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Container(
        padding: EdgeInsets.only(top: AppPadding.p100),
        color: ColorManager.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image(
                  image: AssetImage(ImageAssets.loginIc),
                  width: 300.0,
                  height: 300.0,
                ),
                SizedBox(
                  height: AppSize.s28,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: AppPadding.p28,
                    right: AppPadding.p28,
                  ),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsUserNameValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _userNameController,
                        decoration: InputDecoration(
                            hintText: AppString.userName,
                            labelText: AppString.userName,
                            errorText: (snapshot.data ?? true)
                                ? null
                                : AppString.userNameError),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: AppSize.s28,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: AppPadding.p28,
                    right: AppPadding.p28,
                  ),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsPasswordValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        decoration: InputDecoration(
                            hintText: AppString.password,
                            labelText: AppString.password,
                            errorText: (snapshot.data ?? true)
                                ? null
                                : AppString.passwordError),
                      );
                    },
                  ),
                ),
                SizedBox(height: AppSize.s28),
                Padding(
                  padding: EdgeInsets.only(
                    left: AppPadding.p28,
                    right: AppPadding.p28,
                  ),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsAllInputsValid,
                    builder: (context, snapshot) {
                      return SizedBox(
                        width: double.infinity,
                        height: AppSize.s40,
                        child: ElevatedButton(
                          onPressed: (snapshot.data ?? false)
                              ? () {
                                  _viewModel.login();
                                }
                              : null,
                          child: Text(
                            AppString.login,
                            style: TextStyle(color: ColorManager.white),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: AppPadding.p8,
                    left: AppPadding.p28,
                    right: AppPadding.p28,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.forgotPasswordRoute);
                        },
                        child: Text(
                          AppString.forgetPassword,
                          textAlign: TextAlign.end,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.registerRoute);
                        },
                        child: Text(
                          AppString.registerText,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
