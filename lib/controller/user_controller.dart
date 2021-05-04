import 'package:cookie/locator.dart';
import 'package:cookie/models/user.dart';
import 'package:cookie/screens/auth/authentification_service.dart';

class UserController {
  UserModel _currentUser;
  AuthentificationService _authService = locator.get<AuthentificationService>();
  Future init;

  UserController() {
    init = initUser();
  }

  Future<UserModel> initUser() async {
    _currentUser = await _authService.getUser();
    return _currentUser;
  }

  UserModel get currentUser => _currentUser;
}
