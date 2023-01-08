// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'failures.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;
  UnexpectedValueError({
    required this.valueFailure,
  });

  @override
  String toString() => Error.safeToString(
      'Encountered a ValueFailure at an unrecoverable point. Terminating. Failure was: $valueFailure');
}
