// ignore_for_file: constant_identifier_names

enum FontApp { urban_semibold, urban_medium, urban_light, urban_regular }

extension FontAppExtension on FontApp {
  String get font {
    switch (this) {
      case FontApp.urban_semibold:
        return 'Urbanist_SemiBold';
      case FontApp.urban_medium:
        return 'Urbanist_Medium';
      case FontApp.urban_light:
        return 'Urbanist_Light';
      case FontApp.urban_regular:
        return 'Urbanist_Regular';
    }
  }
}
