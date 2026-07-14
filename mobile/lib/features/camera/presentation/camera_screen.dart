import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../../core/vision/quality_engine/services/quality_engine_service.dart';
import '../../analysis/presentation/analysis_screen.dart';
import '../widgets/camera_controls.dart';
import '../widgets/grid_overlay.dart';
import 'dart:async';

import '../services/frame_capture_service.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  
  final FrameCaptureService _frameService =
    FrameCaptureService();

  double _liveScore = 0;
  String _liveMessage = "Starting...";
  bool _canCapture = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();

    _frameService.start(
      onFrame: analyzeLiveFrame,
    );

    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (!mounted) return;

        setState(() {
          _liveScore = 90;
          _liveMessage = "Ready to Capture";
          _canCapture = true;
        });
      },
    );
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();

    final rearCamera = cameras.first;

    _controller = CameraController(
      rearCamera,
      ResolutionPreset.veryHigh,
      enableAudio: false,
    );

    await _controller!.initialize();

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> capturePhoto() async {
    try {
      if (_controller == null) return;

      if (!_controller!.value.isInitialized) return;

      final image = await _controller!.takePicture();

      final qualityEngine = QualityEngineService();

      final report =
          await qualityEngine.analyzeImage(image.path);

      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => AnalysisScreen(
            report: report,
            imagePath: image.path,
          ),
        ),
      );
    } catch (e) {
      debugPrint("Capture Error: $e");
    }
  }

Future<void> analyzeLiveFrame() async {

  if (!mounted) return;

  if (_controller == null) return;

  if (!_controller!.value.isInitialized) return;

  setState(() {

    _liveScore = 90;

    _liveMessage = "Lighting looks good";

    _canCapture = true;

  });

}

  @override
void dispose() {
  _frameService.stop();
  _controller?.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    if (_controller == null ||
        !_controller!.value.isInitialized) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [

          // Camera Preview
          CameraPreview(_controller!),

          // Grid Overlay
          const GridOverlay(),

          // AI Overlay Card
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Card(
              elevation: 8,
              color: Colors.black.withOpacity(0.7),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [

                    const Text(
                      "VisionShot AI",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    LinearProgressIndicator(
                      value: _liveScore / 100,
                    ),

                    const SizedBox(height: 12),

                    Text(
                      "${_liveScore.toStringAsFixed(0)}/100",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      _liveMessage,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Camera Controls
          CameraControls(
            onCapture: capturePhoto,
            onSwitchCamera: () {},
            canCapture: _canCapture,
          ),
        ],
      ),
    );
  }
}