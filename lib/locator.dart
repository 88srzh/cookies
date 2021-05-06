import 'package:cookie/controller/user_controller.dart';
import 'package:cookie/firebase/storage.dart';
import 'package:cookie/screens/auth/authentification_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupServices() {
  locator.registerSingleton<AuthentificationService>(AuthentificationService());
  locator.registerSingleton<Storage>(Storage());
  locator.registerSingleton<UserController>(UserController());
}
