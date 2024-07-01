extension DoubleExtensions on double {
  double limitBetween({
    required double lowerLimit,
    required double upperLimit,
  }) {
    if (this > upperLimit) {
      return upperLimit;
    } else if (this < lowerLimit) {
      return lowerLimit;
    } else {
      return this;
    }
  }
}
