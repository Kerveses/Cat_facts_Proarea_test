import 'package:devicelocale/devicelocale_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  DevicelocaleWeb.registerWith(registrar);
  registrar.registerMessageHandler();
}
