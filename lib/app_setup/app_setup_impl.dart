import 'package:flutter_sample/core/service_locator/service_locator.dart';
import 'package:flutter_sample/core/logger/logger_lib.dart';
import 'package:flutter_sample/features/angry_user_feature/angry_user_controller.dart';
import 'package:flutter_sample/features/angry_user_feature/angry_user_controller_impl.dart';
import 'app_setup.dart';

class AppSetupImpl implements AppSetup {
  final ServiceLocator _serviceLocator;

  const AppSetupImpl(this._serviceLocator);

  @override
  ServiceLocator get serviceLocator => _serviceLocator;

  @override
  Future<void> setup() async {
    _serviceLocator.registerLazySingleton<Logger>(ConsoleLogger());
    _serviceLocator.registerLazySingleton<AngryUserController>(AngryUserControllerImpl(serviceLocator<Logger>()));
  }
}
