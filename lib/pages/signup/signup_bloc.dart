
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import '../../bloc/bloc_provider.dart';
import '../../data/user/firebase_user_repository.dart';
import '../../data/user/firebase_user_repository_impl.dart';

bool _isValidPassword(String password) {
  return password.length >= 6;
}

bool _isValidEmail(String email) {
  final _emailRegExpString = r'[a-zA-Z0-9\+\.\_\%\-\+]{1,256}\@[a-zA-Z0-9]'
      r'[a-zA-Z0-9\-]{0,64}(\.[a-zA-Z0-9][a-zA-Z0-9\-]{0,25})+';
  return RegExp(_emailRegExpString, caseSensitive: false).hasMatch(email);
}

bool _isValidFullName(String name) {
  return name.length >= 3;
}

class SignupBloc implements BaseBloc {
  final _userName = BehaviorSubject<String>.seeded('');
  final _email = BehaviorSubject<String>.seeded('');
  final _password = BehaviorSubject<String>.seeded('');
  final _confirmPassword = BehaviorSubject<String>.seeded('');
  final FirebaseUserRepository _userRepository = FirebaseUserRepositoryIml(FirebaseAuth.instance);

  final validUserName = StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (_isValidFullName(value)) {
      sink.add(value);
    } else {
      sink.addError('Please enter Full name!');
    }
  });

  final validateEmail = StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (_isValidEmail(value)) {
      sink.add(value);
    } else {
      sink.addError('Please enter the valid email!');
    }
  });

  final validPassword = StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (_isValidPassword(value)) {
      sink.add(value);
    } else {
      sink.addError('Please enter the valid password!');
    }
  });

  Stream<String> get userName => _userName.stream.transform(validUserName);
  Sink<String> get sinkUserName => _userName.sink;

  Stream<String> get email => _email.stream.transform(validateEmail);
  Sink<String> get sinkEmail => _email.sink;

  Stream<String> get password => _password.stream.transform(validPassword);
  Sink<String> get sinkPassword => _password.sink;

  Stream<String> get confirmPassword => _confirmPassword.stream.transform(validPassword).doOnData((String c) {
      if (0 != _password.value.compareTo(c)) {
        _confirmPassword.addError("The passwords do not match");
      }
  });
  Sink<String> get sinkConfirmPassword => _confirmPassword.sink;

  final isLoading = PublishSubject<bool>();

  void performRegister() async {
    try {
      isLoading.sink.add(false);
      await _userRepository.registerWithEmail(fullName: _userName.value, email: _email.value, password: _confirmPassword.value);
    } on FirebaseAuthException catch (error) {

    } finally {
      isLoading.sink.add(true);
    }
  }

  @override
  void dispose() {
    _userName.close();
    _email.close();
    _password.close();
    _confirmPassword.close();
  }
}