import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  top: 30,
                ),
                width: 200,
                child: Image.asset('assets/images/chat.png', fit: BoxFit.cover),
              ),
              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(17),
                    child: Form(
                      child: Column(
                        children: [
                          Text(
                            'Login',
                            style: Theme.of(context).textTheme.headlineMedium,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 32),
                          SizedBox(
                            width:
                                400, // Set a fixed width or use MediaQuery for responsiveness
                            child: TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(Icons.email),
                                hintText: 'What do people call you?',
                                labelText: 'Email Address',
                              ),
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              enableSuggestions: false,
                            ),
                          ),
                          const SizedBox(height: 16), // Space between fields
                          SizedBox(
                            width: 400, // Match the same width as above
                            child: PasswordField(
                              color: Colors.blue,
                              passwordConstraint: r'.*[@$#.*].*',
                              passwordDecoration: PasswordDecoration(),
                              hintText: 'must have special characters',
                              border: PasswordBorder(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blue.shade100,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.red.shade200,
                                  ),
                                ),
                              ),
                              errorMessage:
                                  'must contain special character either . * @ # \$',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
