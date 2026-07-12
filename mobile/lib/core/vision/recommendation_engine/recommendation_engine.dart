List<String> brightnessAdvice(double brightness) {
  if (brightness < 30) {
    return [
      "Move to a brighter place.",
      "Use natural lighting.",
    ];
  }

  if (brightness > 80) {
    return [
      "Reduce exposure.",
      "Avoid direct sunlight.",
    ];
  }

  return [
    "Lighting looks good.",
  ];
}

List<String> blurAdvice(double blur) {
  if (blur < 25) {
    return [
      "Image looks sharp."
    ];
  }

  if (blur < 50) {
    return [
      "Try holding the phone steadier."
    ];
  }

  return [
    "Photo is blurry.",
    "Hold the camera steady.",
    "Tap to focus before capturing."
  ];
}