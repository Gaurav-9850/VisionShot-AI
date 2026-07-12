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