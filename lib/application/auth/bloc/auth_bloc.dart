// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/auth/i_auth_facade.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;
  AuthBloc(
    this._authFacade,
  ) : super(const AuthState.initial()) {
    on<_AuthCheckRequested>(_onAuthCheckRequested);
    on<_SignedOut>(_onSignedOut);
  }

  Future<void> _onAuthCheckRequested(
      _AuthCheckRequested event, Emitter<AuthState> emit) async {
    final userOption = await _authFacade.getSignedUser();
    emit(
      userOption.fold(
        () => const AuthState.unauthenticated(),
        (_) => const AuthState.authenticated(),
      ),
    );
  }

  Future<void> _onSignedOut(_SignedOut event, Emitter<AuthState> emit) async {
    await _authFacade.signOut();
    emit(const AuthState.unauthenticated());
  }
}
