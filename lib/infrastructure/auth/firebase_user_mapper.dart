import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_new/domain/auth/user.dart';
import 'package:todo_new/domain/core/value_objects.dart';

extension FirebaseUserDomainX on User {
  CurrentUser toDomain() => CurrentUser(id: UniqueId.fromUniqueString(uid));
}
