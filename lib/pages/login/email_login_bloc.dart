import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:move_ticketing/data/user/firebase_user_repository.dart';
import 'package:move_ticketing/data/user/firebase_user_repository_impl.dart';
import 'package:rxdart/rxdart.dart';
import '../../bloc/bloc_provider.dart';
import 'login_state.dart';
import 'dart:developer' as dev;

bool _isValidPassword(String password) {
  return password.length >= 6;
}

bool _isValidEmail(String email) {
  const emailRegExpString = r'[a-zA-Z0-9\+\.\_\%\-\+]{1,256}\@[a-zA-Z0-9]'
      r'[a-zA-Z0-9\-]{0,64}(\.[a-zA-Z0-9][a-zA-Z0-9\-]{0,25})+';
  return RegExp(emailRegExpString, caseSensitive: false).hasMatch(email);
}

class EmailLoginBloc implements BaseBloc {
  final _email = BehaviorSubject<String>.seeded('');
  final _password = BehaviorSubject<String>.seeded('');
  final FirebaseUserRepository _userRepository = FirebaseUserRepositoryIml(FirebaseAuth.instance);

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

  final _authStateChange = StreamTransformer<User?, bool>.fromHandlers(handleData: (auth, sink) {
    if (auth != null) {
      sink.add(true);
    } else {
      sink.add(false);
    }
  });

  Stream<String> get email => _email.stream.transform(validateEmail);
  Sink<String> get sinkEmail => _email.sink;

  Stream<String> get password => _password.stream.transform(validPassword);
  Sink<String> get sinkPassword => _password.sink;

  final isLoading = PublishSubject<bool>();
  final user = BehaviorSubject<User?>.seeded(null);
  final errorMessage = PublishSubject<String>();

  void performLogin() async {
    try {
      await _userRepository.signOut();
      isLoading.sink.add(true);
      errorMessage.sink.add("");
      await _userRepository.signInWithEmailAndPassword(email: _email.value, password: _password.value);
    } on FirebaseAuthException catch (error) {
      final message = error.message.toString();
      errorMessage.sink.add(message);
    } finally {
      _userRepository.authStateChanges
        .listen((event) {
          dev.log("$event", name: ".nk");
          user.sink.add(event);
        });
      isLoading.sink.add(false);
    }
  }

  @override
  void dispose() {
    _email.close();
    _password.close();
    user.close();
    isLoading.close();
    errorMessage.close();
  }
}

