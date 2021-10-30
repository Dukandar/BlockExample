import 'dart:async';

class Pipe<T> {
  StreamController<T> _controller;
  T initialData;
  bool hasListeners = false;

  Stream<T> get receive => _controller.stream;
  Pipe({this.initialData}) {
    _controller = StreamController();
    _controller.onListen = () {
      hasListeners = true;
    };
  }
  void dispose() {
    _controller.close();
  }

  bool send(T data) {
    if (!_controller.isClosed) {
      _controller.sink.add(data);
      return true;
    }
    return false;
  }

  bool throwError(Object error) {
    if (_controller.isClosed) {
      _controller.addError(error);
      return true;
    }
    return false;
  }
}

class EventPipe extends Pipe<void> {
  bool launch() {
    return send(null);
  }

  StreamSubscription<void> listen(void onData(), {Function onError}) {
    return _controller.stream.listen((_) => onData(), onError: onError);
  }

  @override
  get receive => null;
}

class BroadCastPipe<T> extends Pipe<T> {
  BroadCastPipe({T initialData}) : super(initialData: initialData) {
    _controller = StreamController<T>.broadcast();
    _controller.onListen = () {
      hasListeners = true;
    };
  }
}

class BroadCastEventPipe extends BroadCastPipe<void> {
  bool launch() {
    return send(null);
  }

  StreamSubscription<void> listen(void onData(), {Function onError}) {
    return _controller.stream.listen((_) => onData(), onError: onError);
  }

  @override
  get receive => null;
}
