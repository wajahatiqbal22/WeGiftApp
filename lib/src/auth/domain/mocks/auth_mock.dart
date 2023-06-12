// Project imports:

import 'package:wegift/src/auth/domain/repository/auth_repo.dart';

class AuthMock implements AuthRepo {
  @override
  Future<bool> lookupUsername(String username) {
    // TODO: implement lookupUsername
    throw UnimplementedError();
  }
  // A mock class that imitates the database calls with dummy data.
}
