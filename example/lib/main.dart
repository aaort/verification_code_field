import 'package:flutter/material.dart';
import 'package:verification_code_field/verification_code_field.dart';

void main() {
  runApp(const MaterialApp(home: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: VerificationCodeField(
          length: 4,
          onSubmit: () => print('Submitted'),
        ),
      ),
    );
  }
}
