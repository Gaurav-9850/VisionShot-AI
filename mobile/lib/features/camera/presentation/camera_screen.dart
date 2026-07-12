import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../../gallery/presentation/photo_preview_screen.dart';
import '../widgets/camera_controls.dart';
import '../widgets/grid_overlay.dart';
import '../../../core/vision/quality_engine/services/quality_engine_service.dart';
import '../../analysis/presentation/analysis_screen.dart';


class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;

  @override
  void initState() {
    super.initState();
    initializeCamera();
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

    // Capture photo
    final image = await _controller!.takePicture();

    // Analyze image
    final qualityEngine = QualityEngineService();

    final report = await qualityEngine.analyzeImage(image.path);

    if (!mounted) return;

    // Open Analysis Screen
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

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          CameraPreview(_controller!),

          const GridOverlay(),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: CameraControls(
                onCapture: capturePhoto,
                onSwitchCamera: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
