import 'package:flutter_sample/app_setup/app_setup_impl.dart';
import 'package:flutter_sample/core/service_locator/service_locator.dart';
import 'package:flutter_sample/core/service_locator/service_locator_impl.dart';

const ServiceLocator _locator = ServiceLocatorImpl();
const AppSetup appSetup =  AppSetupImpl(_locator);

abstract class AppSetup {
  ServiceLocator get serviceLocator;
  Future<void> setup();
}
