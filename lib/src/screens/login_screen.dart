import 'package:flutter/material.dart';
import 'package:flutter_meetuper/src/screens/meetup_home_screen.dart';
import 'package:flutter_meetuper/src/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {

  static final String route = '/login';

  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _emailKey = GlobalKey<FormFieldState<String>>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  initState() {
    super.initState();
    _emailController.addListener(() {
      print(_emailController.text);
    });
  }

  @override
  dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      // final password = _passwordKey.currentState.value;
      // final email = _emailKey.currentState.value;

      final password = _passwordController.text;
      final email = _emailController.text;

      print('password is: $password, email is: $email');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 15.0),
                child: Text(
                  'Login And Explore',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              TextFormField(
                key: _emailKey,
                style: Theme.of(context).textTheme.headline,
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email Address'
                ),
              ),
              TextFormField(
                key: _passwordKey,
                style: Theme.of(context).textTheme.headline,
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Password'
                ),
              ),
              _buildLinks(),
              Container(
                alignment: Alignment(-1.0, 0.0),
                margin: EdgeInsets.only(top: 10.0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  child: const Text('Submit'),
                  onPressed: _submit,
                )
              )
            ],
          ),
        )
      ),
      appBar: AppBar(title: Text('Login')),
    );
  }

  Widget _buildLinks() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, RegisterScreen.route),
            child: Text(
              'Not Registered yet? Register Now!',
              style: TextStyle(
                color: Theme.of(context).primaryColor
              )
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, MeetupHomeScreen.route),
            child: Text(
              'Continue to Home Page',
              style: TextStyle(
                color: Theme.of(context).primaryColor
              )
            ),
          )
        ],
      )
    );
  }
}