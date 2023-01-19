import 'package:flutter/material.dart';

abstract class BaseBloc {
  void dispose();
}

class CustomBlocProvider<T extends BaseBloc> extends StatefulWidget {
  final T blocSupplier;
  final Widget child;

  const CustomBlocProvider({
    super.key,
    required this.blocSupplier,
    required this.child,
  });

  @override
  _CustomBlocProviderState<T> createState() => _CustomBlocProviderState<T>();

  static T of<T extends BaseBloc>(BuildContext context) {
    _BlocProviderInheritedWidget<T>? provider = context
        .dependOnInheritedWidgetOfExactType<_BlocProviderInheritedWidget<T>>();
    if (provider == null) {
      throw StateError(
          'Cannot get provider with type ${_typeOf<_BlocProviderInheritedWidget<T>>()}');
    }
    return provider.bloc;
  }

  static Type _typeOf<T>() => T;
}

class _CustomBlocProviderState<T extends BaseBloc> extends State<CustomBlocProvider<T>> {
  late T _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = widget.blocSupplier;
  }

  @override
  Widget build(BuildContext context) {
    return _BlocProviderInheritedWidget<T>(
      bloc: _bloc,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    print('[DEBUG] Bloc disposed');
    super.dispose();
  }
}

class _BlocProviderInheritedWidget<T extends BaseBloc> extends InheritedWidget {
  final T bloc;

  const _BlocProviderInheritedWidget({
    super.key,
    required super.child,
    required this.bloc,
  });

  @override
  bool updateShouldNotify(_BlocProviderInheritedWidget old) => bloc != old.bloc;
}
