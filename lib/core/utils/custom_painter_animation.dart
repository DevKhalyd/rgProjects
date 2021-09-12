import 'dart:ui';

/// Contains the methods that allow to animate a given path to the CustomPainter...

// Resources:
// https://stackoverflow.com/a/57233047/10942018 The original post about these methods.
// https://medium.com/flutter-community/paths-in-flutter-a-visual-guide-6c906464dcd0 Visual Guide of the possibles paths.

/// [originalPath] your path created already
///
/// [animationPercent] the current value of your `AnimationController`
Path animatePath(Path originalPath, double animationPercent) {
  // ComputeMetrics can only be iterated once!
  final totalLength = originalPath
      .computeMetrics()
      .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

  final currentLength = totalLength * animationPercent;

  return _extractPathUntilLength(originalPath, currentLength);
}

/// Extract a path until a given length
Path _extractPathUntilLength(
  Path originalPath,
  double length,
) {
  double currentLength = 0.0;
  final path = new Path();
  final metricsIterator = originalPath.computeMetrics().iterator;

  while (metricsIterator.moveNext()) {
    final metric = metricsIterator.current;
    final nextLength = currentLength + metric.length;

    final isLastSegment = nextLength > length;
    if (isLastSegment) {
      final remainingLength = length - currentLength;
      final pathSegment = metric.extractPath(0.0, remainingLength);
      path.addPath(pathSegment, Offset.zero);
      break;
    } else {
      final pathSegment = metric.extractPath(0.0, metric.length);
      path.addPath(pathSegment, Offset.zero);
    }
    currentLength = nextLength;
  }
  return path;
}
