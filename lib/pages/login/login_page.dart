import 'dart:math';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:move_ticketing/app.dart';
import 'package:move_ticketing/app_define/app_assets.dart';
import 'package:move_ticketing/app_define/app_color.dart';
import 'package:move_ticketing/pages/login/email_login_bloc.dart';
import 'package:move_ticketing/pages/signup/signup_bloc.dart';
import 'package:move_ticketing/pages/signup/signup_page.dart';
import 'package:move_ticketing/utils/other/navi.dart' as navi;
import '../../bloc/bloc_provider.dart';
import '../../generated/l10n.dart';
import '../../widgets/input_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isRememberPassword = false;
  final _formKey = GlobalKey<FormState>();
  late EmailLoginBloc _emailLoginBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAssets.origin().imgLogin,
            fit: BoxFit.fill,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 100.0),
                  const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  _ErrorMessage(_emailLoginBloc),
                  Container(
                    margin: const EdgeInsets.only(left: 39, right: 39),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _EmailInput(_emailLoginBloc),
                        _PasswordInput(_emailLoginBloc),
                        Row(
                          children: [
                            Switch(
                              trackColor: MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                                  return Color(0xFFA09F99);
                                },
                              ),
                              thumbColor: MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return Colors.deepPurpleAccent;
                                  }
                                  return Colors.white;
                                },
                              ),
                              value: _isRememberPassword,
                              onChanged: (bool value) {
                                setState(() {
                                  _isRememberPassword = value;
                                });
                              },
                            ),
                            Text(
                              S.of(context).remember_me,
                              style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                S.of(context).forgot_password,
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 15.0),
                        Container(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(40),
                              backgroundColor: AppColors.arsenic,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _emailLoginBloc.performLogin();
                              }
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                height: 10,
                                color: AppColors.white,
                              ),
                            ),
                            const SizedBox(width: 16),
                            const Text(
                              "or login with",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Divider(
                                height: 10,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Container(
                          height: 55.0,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                    AppAssets.origin().icGoogle,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                    AppAssets.origin().icApple,
                                    // width: 105,
                                    // height: 55,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                    AppAssets.origin().icFacebook,
                                    // width: 105,
                                    // height: 55,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.all(0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  S.of(context).do_not_have_an_accounts,
                                  style: TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextButton(
                                  onPressed: (() => navi.newScreen(
                                      newScreen: () => CustomBlocProvider<SignupBloc>(blocSupplier: SignupBloc(), child: SignupPage()),
                                      context: context)
                                  ),
                                  child: const Text(
                                    "Signup",
                                    style: TextStyle(
                                      color: AppColors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: StreamBuilder(
              stream: _emailLoginBloc.isLoading,
              builder: (context, AsyncSnapshot<bool> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data == true) {
                    return const CircularProgressIndicator(
                      color: AppColors.arsenic,
                    );
                  } else {
                    final user = _emailLoginBloc.user.value;
                    if ( user != null) {
                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        Navigator.pushAndRemoveUntil<void>(
                          context,
                          MaterialPageRoute<void>(builder: (BuildContext context) => const MyApp()),
                              (Route<dynamic> route) => false,
                        );
                      });
                    }
                  }
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _emailLoginBloc = CustomBlocProvider.of<EmailLoginBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    _emailLoginBloc.dispose();
  }
}

class _EmailInput extends StatelessWidget {
  final EmailLoginBloc _emailLoginBloc;

  const _EmailInput(this._emailLoginBloc);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _emailLoginBloc.email,
      builder: (context, snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Email",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: InputTextWidget(
                hintText: 'Email Address',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onChanged: (val) {
                  if (val != null) {
                    _emailLoginBloc.sinkEmail.add(val.toString());
                  }
                },
                validator: (email) {
                  return snapshot.hasError ? snapshot.error.toString() : null;
                  // if (email != null && EmailValidator.validate(email)) {
                  //   return null;
                  // }
                  // if (email == null || email.isEmpty) {
                  //   return "Empty email";
                  //   return "Empty email";
                  // }
                  // return "Invalid email address";
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _PasswordInput extends StatefulWidget {
  final EmailLoginBloc _emailLoginBloc;

  _PasswordInput(this._emailLoginBloc);

  @override
  State<_PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<_PasswordInput> {
  bool _visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget._emailLoginBloc.password,
      builder: (context, snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Password",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: InputTextWidget(
                obscureText: !_visiblePassword,
                hintText: 'Enter Password',
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (val) {
                  if (val != null) {
                    widget._emailLoginBloc.sinkPassword.add(val.toString().trim());
                  }
                },
                validator: (password) {
                  return snapshot.hasError ? snapshot.error.toString() : null;
                  // if (password == null || password.isEmpty) {
                  //   return "Empty password";
                  // }
                  // return null;
                },
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      _visiblePassword = !_visiblePassword;
                    });
                  },
                  child: Icon(
                    _visiblePassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ErrorMessage extends StatefulWidget {
  final EmailLoginBloc _emailLoginBloc;

  const _ErrorMessage(this._emailLoginBloc);

  @override
  State<_ErrorMessage> createState() => _ErrorMessageState();
}

class _ErrorMessageState extends State<_ErrorMessage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget._emailLoginBloc.errorMessage,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return Visibility(
            visible: snapshot.data!.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Container(
                height: 35.0,
                alignment: Alignment.center,
                child: Text(
                  snapshot.data.toString(),
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}


