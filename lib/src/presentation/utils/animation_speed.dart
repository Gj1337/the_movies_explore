enum AnimationSpeed {
  fast(Duration(milliseconds: 250)),
  normal(Duration(milliseconds: 500)),
  slow(Duration(milliseconds: 750));

  final Duration duration;
  const AnimationSpeed(this.duration);
}
