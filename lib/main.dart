//DONT DELETE
//export PATH=/Users/crich/Documents/flutter/bin:$PATH

//***********Backend-related Imports***********//
import 'package:beat/cubits/amplify_cubit.dart';
import 'package:beat/cubits/auth_cubit.dart';
import 'package:beat/config/locale_config.dart';
//***********Frontend-related Imports***********//
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:beat/views/init_view.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AmplifyCubit>(
      create: (context) => AmplifyCubit()..init(),
      child: BlocBuilder<AmplifyCubit, AmplifyState>(
        builder: (context, state) {
          if (state is AmplifyConfigured) {
            return Authenticator(
              signUpForm: BlocProvider.of<AmplifyCubit>(context).signUpForm,
              child: MaterialApp(
                localizationsDelegates: localizationsDelegates,
                supportedLocales: supportedLocales,
                builder: Authenticator.builder(),
                title: 'BEAT',
                home: Scaffold(
                  body: BlocProvider(
                    create: (context) => AuthCubit()..authUser(),
                    child: BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        if (state is AuthSuccess) {
                          //TODO Determine if its a first time or returning user
                          return const InitPage();
                        } else if (state is AuthFail) {
                          return Center(
                              child: Text(
                                  "Auth Failed with state ${state.exception}"));
                        } else {
                          //state is Unauth()
                          return Center(
                            child: Column(children: const [
                              Text("Unauthorized"),
                              CircularProgressIndicator()
                            ]),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            );
          } else if (state is AmplifyFailure) {
            return MaterialApp(
                title: "Not Config",
                home: Scaffold(
                    body: Center(
                  child: Text(state.exception.toString()),
                )));
          } else {
            //state is AmplifyNotConfigured
            return const MaterialApp(
                title: "Not Config",
                home: Scaffold(
                    body: Center(
                  child: Text('Amplify not configured'),
                )));
          }
        },
      ),
    );
  }
}
