import 'package:flutter/material.dart';
import '../../app_define/app_assets.dart';
import '../../app_define/app_color.dart';
import '../../bloc/bloc_provider.dart';
import '../../widgets/input_text_field.dart';
import '../signup/signup_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  late SignupBloc _emailSignupBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body:  Stack(
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
                  const SizedBox(height: 60.0),
                  const Text(
                    "Singup",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    margin: const EdgeInsets.only(left: 39, right: 39),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _UserNameInput(_emailSignupBloc),
                        _EmailInput(_emailSignupBloc),
                        _PasswordInput(_emailSignupBloc),
                        _ConfirmPasswordInput(_emailSignupBloc),
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
                                _emailSignupBloc.performRegister();
                              }
                            },
                            child: const Text(
                              "Signup",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.all(0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Login",
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
              stream: _emailSignupBloc.isLoading,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data == true) {
                    return const CircularProgressIndicator(
                      color: AppColors.arsenic,
                    );
                  } else {
                      Navigator.pop(context);
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
    _emailSignupBloc = CustomBlocProvider.of<SignupBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    _emailSignupBloc.dispose();
  }
}
class _UserNameInput extends StatelessWidget {
  final SignupBloc _emailSignupBloc;

  _UserNameInput(this._emailSignupBloc);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _emailSignupBloc.userName,
      builder: (context, snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Full Name",
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
                hintText: 'Full name',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onChanged: (val) {
                  if (val != null) {
                    _emailSignupBloc.sinkUserName.add(val.toString());
                  }
                },
                validator: (_){
                  return snapshot.hasError ? snapshot.error.toString() : null;
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  final SignupBloc _emailSignupBloc;

  _EmailInput(this._emailSignupBloc);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _emailSignupBloc.email,
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
                    _emailSignupBloc.sinkEmail.add(val.toString());
                  }
                },
                validator: (_) {
                  return snapshot.hasError ? snapshot.error.toString() : null;
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
  final SignupBloc _emailSignupBloc;

  _PasswordInput(this._emailSignupBloc);

  @override
  State<_PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<_PasswordInput> {
  bool _visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget._emailSignupBloc.password,
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
                    widget._emailSignupBloc.sinkPassword.add(val.toString());
                  }
                },
                validator: (_) {
                  return snapshot.hasError ? snapshot.error.toString() : null;
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

class _ConfirmPasswordInput extends StatefulWidget {
  final SignupBloc _emailSignupBloc;

  _ConfirmPasswordInput(this._emailSignupBloc);

  @override
  State<_ConfirmPasswordInput> createState() => _ConfirmPasswordInputState();
}

class _ConfirmPasswordInputState extends State<_ConfirmPasswordInput> {
  bool _visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget._emailSignupBloc.confirmPassword,
      builder: (context, snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Confirm password",
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
                hintText: 'Confirm password',
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (val) {
                  if (val != null) {
                    widget._emailSignupBloc.sinkConfirmPassword.add(val.toString().trim());
                  }
                },
                validator: (_) {
                  return snapshot.hasError ? snapshot.error.toString() : null;
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
