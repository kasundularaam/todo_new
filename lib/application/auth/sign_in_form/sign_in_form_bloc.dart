// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:todo_new/domain/auth/i_auth_facade.dart';
import 'package:todo_new/domain/auth/value_objects.dart';

import '../../../domain/auth/auth_failure.dart';

part 'sign_in_form_bloc.freezed.dart';
part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(
    this._authFacade,
  ) : super(SignInFormState.initial()) {
    on<SignInFormEvent>((event, emit) async {
      if (event is _EmailChanged) {
        emit(
          state.copyWith(
            emailAddress: EmailAddress(event.emailStr),
            authFailureOrSuccess: none(),
          ),
        );
      }
      if (event is _PasswordChanged) {
        emit(
          state.copyWith(
            password: Password(
              event.passwordStr,
            ),
            authFailureOrSuccess: none(),
          ),
        );
      }

      if (event is _SignInWithGooglePressed) {
        emit.forEach(
          _performActionOnAuthFacadeWithEmailAndPassword(
              _authFacade.signInWithEmailAndPassword),
          onData: (signInFormState) => signInFormState,
        );
      }
      if (event is _RegisterWithEmailAndPasswordPressed) {
        emit.forEach(
          _performActionOnAuthFacadeWithEmailAndPassword(
              _authFacade.registerWithEmailAndPassword),
          onData: (signInFormState) => signInFormState,
        );
      }
      if (event is _SignInWithGooglePressed) {
        emit(
          state.copyWith(
            isSubmitting: true,
            authFailureOrSuccess: none(),
          ),
        );
        final failureOrSuccess = await _authFacade.signInWithGoogle();
        emit(
          state.copyWith(
            isSubmitting: false,
            authFailureOrSuccess: some(failureOrSuccess),
          ),
        );
      }
    });
  }

  Stream<SignInFormState> _performActionOnAuthFacadeWithEmailAndPassword(
      Future<Either<AuthFailure, Unit>> Function({
    required EmailAddress emailAddress,
    required Password password,
  })
          forwardedCall) async* {
    Either<AuthFailure, Unit>? failureOrSuccess;
    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      yield state.copyWith(
        isSubmitting: true,
        authFailureOrSuccess: none(),
      );

      failureOrSuccess = await forwardedCall(
          emailAddress: state.emailAddress, password: state.password);
      yield state.copyWith(
        isSubmitting: false,
        authFailureOrSuccess: some(failureOrSuccess),
      );
    }

    yield state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccess: optionOf(failureOrSuccess),
    );
  }
}
