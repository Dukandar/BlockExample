import 'package:BlockExample/bloc.dart';
import 'package:flutter/material.dart';

class BlocProvider<T extends Bloc> extends StatefulWidget {
  final T bloc;
  final Widget child;
  BlocProvider({Key key, @required this.child, @required this.bloc});
  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends Bloc>(BuildContext context) {
    BlocProvider<T> provider =
        context.findAncestorWidgetOfExactType<BlocProvider<T>>();
    return provider?.bloc;
  }
}

class _BlocProviderState<T> extends State<BlocProvider<Bloc>> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
