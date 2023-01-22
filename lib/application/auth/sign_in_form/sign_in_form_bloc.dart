// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/auth/auth_failure.dart';
import '../../../domain/auth/i_auth_facade.dart';
import '../../../domain/auth/value_objects.dart';

part 'sign_in_form_bloc.freezed.dart';
part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(
    this._authFacade,
  ) : super(SignInFormState.initial()) {
    on<_EmailChanged>(_onEmailChanged);
    on<_PasswordChanged>(_onPasswordChanged);
    on<_SignInWithEmailAndPasswordPressed>(
        _onSignInWithEmailAndPasswordPressed);
    on<_RegisterWithEmailAndPasswordPressed>(
        _onRegisterWithEmailAndPasswordPressed);
    on<_SignInWithGooglePressed>(_onSignInWithGooglePressed);
  }

  void _onEmailChanged(_EmailChanged event, Emitter<SignInFormState> emit) {
    emit(
      state.copyWith(
        emailAddress: EmailAddress(event.emailStr),
        authFailureOrSuccess: none(),
      ),
    );
  }

  void _onPasswordChanged(
      _PasswordChanged event, Emitter<SignInFormState> emit) {
    emit(
      state.copyWith(
        password: Password(event.passwordStr),
        authFailureOrSuccess: none(),
      ),
    );
  }

  void _onSignInWithEmailAndPasswordPressed(
      _SignInWithEmailAndPasswordPressed event, Emitter<SignInFormState> emit) {
    _performActionOnAuthFacadeWithEmailAndPassword(
        forwardedCall: _authFacade.signInWithEmailAndPassword, emit: emit);
  }

  void _onRegisterWithEmailAndPasswordPressed(
      _RegisterWithEmailAndPasswordPressed event,
      Emitter<SignInFormState> emit) {
    _performActionOnAuthFacadeWithEmailAndPassword(
        forwardedCall: _authFacade.registerWithEmailAndPassword, emit: emit);
  }

  Future<void> _onSignInWithGooglePressed(
      _SignInWithGooglePressed event, Emitter<SignInFormState> emit) async {
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

  Future<void> _performActionOnAuthFacadeWithEmailAndPassword(
      {required Future<Either<AuthFailure, Unit>> Function({
        required EmailAddress emailAddress,
        required Password password,
      })
          forwardedCall,
      required Emitter<SignInFormState> emit}) async {
    Either<AuthFailure, Unit>? failureOrSuccess;
    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      emit(
        state.copyWith(
          isSubmitting: true,
          authFailureOrSuccess: none(),
        ),
      );

      failureOrSuccess = await forwardedCall(
          emailAddress: state.emailAddress, password: state.password);

      if (emit.isDone) {
        emit(
          state.copyWith(
            isSubmitting: false,
            authFailureOrSuccess: some(failureOrSuccess),
          ),
        );
      }
    }

    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccess: optionOf(failureOrSuccess),
      ),
    );
  }
}
