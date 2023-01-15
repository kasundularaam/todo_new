// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:todo_new/domain/auth/i_auth_facade.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;
  AuthBloc(
    this._authFacade,
  ) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) {
      event.map(authCheckRequested: (_) {}, signedOut: (_) {});
    });
  }
}
