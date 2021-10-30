import 'package:BlockExample/presenter_ui.dart';
import 'package:BlockExample/sample_bloc.dart';
import 'package:BlockExample/sample_screen.dart';
import 'package:flutter/material.dart';

class SamplePresenter extends Presenter<SampleBloc,SampleModel>{
  Widget buildScreen(BuildContext context,SampleBloc bloc,SampleModel model){
    return SampleScreen();
  }

  @override
  Stream<SampleModel> getViewModelStream(BuildContext context, SampleBloc bloc) {
    return bloc.sampleModel.receive;
  }
  
    @override
    void sendViewModelRequest(BuildContext context, SampleBloc bloc) {
      bloc.sampleModelEventPipe.launch(); 
  }
}