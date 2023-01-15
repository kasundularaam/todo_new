import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_new/domain/core/value_objects.dart';

part 'user.freezed.dart';

@freezed
abstract class CurrentUser with _$CurrentUser {
  const factory CurrentUser({required UniqueId id}) = _CurrentUser;
}
