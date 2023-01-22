import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_new/presentation/core/assets.dart';

import '../../../application/auth/sign_in_form/sign_in_form_bloc.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) => state.authFailureOrSuccess.fold(
          () => {},
          (either) => either.fold(
              (failure) => FlushbarHelper.createError(
                    message: failure.map(
                      canceledByUser: (_) => "Canceled",
                      serverError: (_) => "Server error",
                      emailAlreadyInUse: (_) => "Email already in use",
                      invalidEmailAndPasswordCombination: (_) =>
                          "Invalid email and password combination",
                    ),
                  ).show(context),
              (_) => {})),
      builder: (context, state) => Form(
        autovalidateMode: state.showErrorMessages
            ? AutovalidateMode.always
            : AutovalidateMode.disabled,
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            children: [
              SvgPicture.asset(
                Assets.splash,
                height: MediaQuery.of(context).size.height / 2,
                fit: BoxFit.fitHeight,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_rounded), labelText: "Email"),
                onChanged: (emailStr) =>
                    BlocProvider.of<SignInFormBloc>(context).add(
                  SignInFormEvent.emailChanged(emailStr),
                ),
                validator: (_) => BlocProvider.of<SignInFormBloc>(context)
                    .state
                    .emailAddress
                    .value
                    .fold(
                        (f) => f.maybeMap(
                            invalidEmail: (_) => "Invalid Email",
                            orElse: () => null),
                        (_) => null),
              ),
              const SizedBox(height: 8),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.password_rounded),
                    labelText: "Password"),
                onChanged: (passwordStr) =>
                    BlocProvider.of<SignInFormBloc>(context).add(
                  SignInFormEvent.passwordChanged(passwordStr),
                ),
                validator: (_) => BlocProvider.of<SignInFormBloc>(context)
                    .state
                    .password
                    .value
                    .fold(
                        (f) => f.maybeMap(
                            shortPassword: (_) => "Short Password",
                            orElse: () => null),
                        (_) => null),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () =>
                          BlocProvider.of<SignInFormBloc>(context).add(
                        const SignInFormEvent
                            .signInWithEmailAndPasswordPressed(),
                      ),
                      child: const Text("SIGN IN"),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () =>
                          BlocProvider.of<SignInFormBloc>(context).add(
                        const SignInFormEvent
                            .registerWithEmailAndPasswordPressed(),
                      ),
                      child: const Text("REGISTER"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => BlocProvider.of<SignInFormBloc>(context).add(
                  const SignInFormEvent.signInWithGooglePressed(),
                ),
                child: const Text("SIGN IN WITH GOOGLE"),
              ),
              if (state.isSubmitting) ...[
                const SizedBox(height: 8),
                const LinearProgressIndicator()
              ],
              const SizedBox(height: 8),
            ]),
      ),
    );
  }
}
