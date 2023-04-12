import 'package:flutter_sample/core/service_locator/service_locator_impl.dart';


abstract class ServiceLocator {
  const ServiceLocator();

  void registerSingleton<T extends Object>(T instance, {String? instanceName});

  void registerLazySingleton<T extends Object>(T instance, {String? instanceName});

  void registerFactory<T extends Object>(T instance, {String? instanceName});

  void resetRegisteration();

  void unRegister<T extends Object>({String? instanceName});

  T get<T extends Object>({String? instanceName});

  Future<T> getAsync<T extends Object>({String? instanceName});

  /// Callable class so that you can write `DI<MyType>` instead of
  /// `DI.get<MyType>`
  T call<T extends Object>({String? instanceName});
}
