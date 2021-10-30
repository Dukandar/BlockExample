import 'package:BlockExample/bloc_provider.dart';
import 'package:BlockExample/sample_presenter.dart';
import 'package:flutter/widgets.dart';

import 'sample_bloc.dart';

class SampleFeature extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return BlocProvider( 
      bloc: SampleBloc()
    ,child:SamplePresenter());
  }
}