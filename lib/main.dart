import 'package:flutter/material.dart';
import 'package:form_example/forms/login_form.dart';
import 'package:form_example/forms/student_form.dart';

import 'models/app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<AppModel>(
      create: (_) => AppModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: LoginForm(),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginForm(),
          '/estudiant': (context) => StudentForm(),
        },
      ),
    );
  }
}
