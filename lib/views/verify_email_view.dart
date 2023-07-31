import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hello/services/auth/bloc/auth_bloc.dart';
import 'package:hello/services/auth/bloc/auth_event.dart';
//import 'package:hello/constants/routes.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              const Text('Verify your Email', style: TextStyle(fontSize: 25)),
          backgroundColor: const Color.fromARGB(255, 155, 236, 158),
          centerTitle: true,
        ),
        body: Container(
          color: const Color.fromARGB(255, 155, 236, 158),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                  'We have already send a verification email.Please open it and verify your email'),
              Text('If you have not received yet,resent email.... '),
              SizedBox(height: 10),
              TextButton(
                onPressed: () async {
                  context
                      .read<AuthBloc>()
                      .add(const AuthEventSendEmailVerification());
                },
                child: const Text('Resend email Verification',
                    style: TextStyle(fontSize: 15)),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  context.read<AuthBloc>().add(const AuthEventLogOut());
                },
                child: const Text("Restart", style: TextStyle(fontSize: 15)),
              )
            ],
          ),
        ));
  }
}
