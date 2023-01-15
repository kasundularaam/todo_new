import 'package:dartz/dartz.dart';
import 'package:todo_new/domain/auth/user.dart';

import 'auth_failure.dart';
import 'value_objects.dart';

abstract class IAuthFacade {
  Future<Option<CurrentUser>> getSignedUser();
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required EmailAddress emailAddress, required Password password});
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {required EmailAddress emailAddress, required Password password});

  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<void> signOut();
}
