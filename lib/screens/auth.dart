import 'package:flutter/material.dart';
// import 'package:passwordfield/passwordfield.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  var _isLogin = true;
  var _enteredEmail = '';
  var _enteredPassword = '';

  void _submit (){ 
    // Here you would typically handle the form submission,
    // such as sending the data to a server or validating it.
    // For now, we will just print the action to the console.
    final isValid = _formKey.currentState!.validate();

    if(isValid){
      _formKey.currentState!.save();
      // Perform login or sign up action
      print('Email: $_enteredEmail');
      print('Password: $_enteredPassword');
    }
  }
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
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Login',
                            style: Theme.of(context).textTheme.headlineMedium,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 32),

                          TextFormField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.email),
                              hintText: 'What do people call you?',
                              labelText: 'Email Address',
                            ),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            enableSuggestions: false,
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@')) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            onSaved: (value){
                              _enteredEmail = value!.trim();//we dont need setState here because we are using a form to handle the state not to mention that we are not using the email value anywhere in the UI
                            },
                          ),
                          const SizedBox(height: 16), // Space between fields
                          TextFormField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.lock),
                              hintText: 'Type your password',
                              labelText: 'Password',
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.trim().length < 6) {
                                return 'Please enter a valid password (at least 6 characters)';
                              }
                              return null;
                            },
                            onSaved: (value){
                              _enteredPassword = value!.trim();//we dont need setState here because we are using a form to handle the state not to mention that we are not using the email value anywhere in the UI
                            },
                          ),
                          const SizedBox(height: 16), // Space between fields
                          ElevatedButton(
                            onPressed: _submit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(
                                    context,
                                  ).colorScheme.primaryContainer,
                            ),
                            child: Text(_isLogin ? 'Login' : 'Sign Up'),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _isLogin = !_isLogin;
                              });
                            },
                            child: Text(
                              _isLogin ? 'Create New Account' : 'Login',
                            ),
                          ),
                          // SizedBox(
                          //   width: 400, // Match the same width as above
                          //   child: PasswordField(
                          //     color: Colors.blue,
                          //     passwordConstraint: r'.*[@$#.*].*',
                          //     passwordDecoration: PasswordDecoration(),
                          //     hintText: 'must have special characters',
                          //     border: PasswordBorder(
                          //       border: OutlineInputBorder(
                          //         borderSide: BorderSide(
                          //           color:
                          //               Theme.of(context).colorScheme.primary,
                          //         ),
                          //         borderRadius: BorderRadius.circular(12),
                          //       ),
                          //       focusedBorder: OutlineInputBorder(
                          //         borderSide: BorderSide(
                          //           color: Colors.blue.shade100,
                          //         ),
                          //         borderRadius: BorderRadius.circular(12),
                          //       ),
                          //       focusedErrorBorder: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(12),
                          //         borderSide: BorderSide(
                          //           width: 2,
                          //           color: Colors.red.shade200,
                          //         ),
                          //       ),
                          //     ),
                          //     errorMessage:
                          //         'must contain special character either . * @ # \$',
                          //   ),
                          // ),
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
