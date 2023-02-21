// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "do_not_have_an_accounts":
            MessageLookupByLibrary.simpleMessage("Don\'t have an accounts?"),
        "forgot_password":
            MessageLookupByLibrary.simpleMessage("forgot password?"),
        "invalid_email_address":
            MessageLookupByLibrary.simpleMessage("Invalid email address"),
        "password_at_least_6_characters": MessageLookupByLibrary.simpleMessage(
            "Password at least 6 characters"),
        "please_enter_the_valid_email": MessageLookupByLibrary.simpleMessage(
            "Please enter the valid email!"),
        "please_enter_the_valid_password": MessageLookupByLibrary.simpleMessage(
            "Please enter the valid password!"),
        "remember_me": MessageLookupByLibrary.simpleMessage("Remember me")
      };
}
