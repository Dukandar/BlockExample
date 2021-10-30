import 'package:BlockExample/bloc.dart';
import 'package:BlockExample/pipes.dart';

class SampleBloc extends Bloc{
  BroadCastPipe<SampleModel> sampleModel = BroadCastPipe();
  EventPipe sampleModelEventPipe = EventPipe();
  SampleBloc() {
    sampleModelEventPipe.listen(_sampleModelListen);
  }
  void _sampleModelListen() {
    sampleModel.send(_sampleModel());
  }

  SampleModel _sampleModel() {
    SampleModel sampleModel = SampleModel();
    return sampleModel;
  }
}

class SampleModel extends ViewModel{
  final String sampleString;
  SampleModel({this.sampleString});
}

abstract class ViewModel {}

