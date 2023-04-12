import 'package:get_it/get_it.dart';

import 'service_locator.dart';

/// class that will manage DI throught application depends on get_it: ^7.2.0

class ServiceLocatorImpl implements ServiceLocator {
  GetIt get _getIt => GetIt.instance;

  const ServiceLocatorImpl();

  @override
  void registerFactory<T extends Object>(T instance, {String? instanceName}) {
    _getIt.registerFactory<T>(() => instance, instanceName: instanceName);
  }

  @override
  void registerLazySingleton<T extends Object>(T instance, {String? instanceName}) {
    _getIt.registerLazySingleton<T>(() => instance, instanceName: instanceName);
  }

  @override
  void registerSingleton<T extends Object>(T instance, {String? instanceName}) {
    _getIt.registerSingleton<T>(instance, instanceName: instanceName);
  }

  @override
  void resetRegisteration() {
    _getIt.reset(dispose: true);
  }

  @override
  void unRegister<T extends Object>({String? instanceName}) {
    _getIt.unregister<T>(instanceName: instanceName);
  }

  @override
  T get<T extends Object>({String? instanceName}) {
    return _getIt.get<T>(instanceName: instanceName);
  }

  @override
  Future<T> getAsync<T extends Object>({String? instanceName}) {
    return _getIt.getAsync<T>(instanceName: instanceName);
  }

  @override
  T call<T extends Object>({String? instanceName}) {
    return get<T>(instanceName: instanceName);
  }
}
