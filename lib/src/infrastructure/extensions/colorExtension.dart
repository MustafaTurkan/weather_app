import 'dart:ui';

extension ColorExtensions on Color {
  Color darken(double value) {
    assert(0 <= value && value <= 1);
    var f = 1 - value;
    return Color.fromARGB(alpha, (red * f).round(), (green * f).round(), (blue * f).round()).withOpacity(opacity);
  }

  Color lighten(double value) {
    assert(0 <= value && value <= 1);
    return Color.fromARGB(alpha, red + ((255 - red) * value).round(), green + ((255 - green) * value).round(), blue + ((255 - blue) * value).round());
  }
}
