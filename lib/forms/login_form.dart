import 'package:flutter/material.dart';
import 'package:form_example/forms/student_form.dart';
import 'package:form_example/models/app.dart';
import 'package:form_example/models/user.dart';
import 'package:form_example/services/login_service.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var app = context.watch<AppModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(app.titol),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Usuari',
                  hintText: 'Escriu un text',
                ),
                autofocus: true,
                controller: _userController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El text és obligatori';
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  icon: Icon(Icons.password),
                  labelText: 'Password',
                  hintText: 'Escriu un text',
                ),
                autofocus: true,
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El text és obligatori';
                  }
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  child: Text('Accedeix'),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Validant login')));

                      await Future.delayed(Duration(seconds: 1));

                      if (login(_userController.text, _passwordController.text)) {
                        app.user = User(_userController.text);
                      }

                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => StudentForm()));
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
