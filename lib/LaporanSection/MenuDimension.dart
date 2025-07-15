class MenuDimensions {
  final double screenWidth;
  final bool isPortrait;

  MenuDimensions(this.screenWidth, this.isPortrait);

  double get sizedBoxHeight => isPortrait ? screenWidth * 0.24 : screenWidth * 0.16;

  double get fontSize => isPortrait ? screenWidth * 0.033 : screenWidth * 0.02;

  double get spacing => screenWidth * 0.02;

  double get containerSize => sizedBoxHeight * 0.5;

  double get iconSize => containerSize * 0.6;
}