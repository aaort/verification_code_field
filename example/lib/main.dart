import 'package:flutter/material.dart';
import 'package:verification_code_field/verification_code_field.dart';

void main() {
  runApp(MaterialApp(
    home: const App(),
    theme: ThemeData.dark(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: VerificationCodeField(
              length: 5,
              onSubmit: () => print('Submitted'),
              cellTheme: CellTheme(
                borderColor: Colors.white,
                backgroundColor: Colors.black12,
                borderWidth: 2,
                width: 40,
                height: 60,
                textStyle: const TextStyle(fontSize: 25.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
