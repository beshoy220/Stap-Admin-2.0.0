import 'package:stap_admin/app/color_pallet.dart';
import 'package:stap_admin/app/typography.dart';

class _Meta {
  String appName = 'STAP';
  String fullAppName = 'STAP Admin';
  String appVersion = '2.0.0';
  String appLogo = 'assets/logo.png';
  String appSlogan = 'Slogan should be here and fill one line';

  ColorPallet colorPallet = ColorPallet();
  Typography typography = Typography();
}

// ignore: library_private_types_in_public_api
_Meta meta = _Meta();
