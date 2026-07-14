import 'dart:async';

class FrameCaptureService {
  Timer? _timer;

  void start({
    required VoidCallback onFrame,
  }) {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        onFrame();
      },
    );
  }

  void stop() {
    _timer?.cancel();
  }
}