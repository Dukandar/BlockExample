import 'package:BlockExample/bloc.dart';
import 'package:BlockExample/bloc_provider.dart';
import 'package:BlockExample/sample_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

abstract class Presenter<B extends Bloc, V extends ViewModel>
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    B bloc = BlocProvider.of<B>(context);
     SchedulerBinding.instance.addPostFrameCallback((_) {
      sendViewModelRequest(context, bloc);
    });

    return StreamBuilder<V>(
        stream: getViewModelStream(context, bloc),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildScreen(context, bloc, snapshot.data);
          } else if (snapshot.hasError) {
            return buildErrorScreen(context);
          }
          return buildLoadingScreen(context);
        });
  }

  Widget buildScreen(BuildContext context, B bloc, V viewModel);

  void sendViewModelRequest(BuildContext context, B bloc);

  Stream<V> getViewModelStream(BuildContext context, B bloc);

  Widget buildLoadingScreen(BuildContext context) {
    return Container(key: Key('waitingFromStream'));
  }

  Widget buildErrorScreen(BuildContext context) {
    return Container(key: Key('noContentFromStream'));
  }
}
