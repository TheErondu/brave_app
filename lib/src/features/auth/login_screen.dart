import 'package:estatio/src/data/repository/user_repo.dart';
import 'package:estatio/src/features/home_page/home_page_view.dart';
import 'package:estatio/src/index/index_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  static const routeName = '/';
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Sign in to Estatio',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  cursorColor: Theme.of(context).colorScheme.onPrimary,
                  controller: emailController,
                  decoration: const InputDecoration(
                    floatingLabelStyle: TextStyle(color: Colors.black),
                    focusColor: Colors.green,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                    border: OutlineInputBorder(),
                    labelText: "Username",
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  cursorColor: Theme.of(context).colorScheme.onPrimary,
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    floatingLabelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    labelText: 'Password',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: const Text(
                  'Forgot Password',
                ),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 158, 127, 24))),
                    child: const Text('Login',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    onPressed: () async {
                      emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty
                          ? await UserRepository().login(
                              emailController.text, passwordController.text).then((value) => {
                                Navigator.pushReplacementNamed(context, IndexView.routeName)
                              })
                          : showDialog(
                              builder: (BuildContext context) {
                                return Container(
                                  child: const AlertDialog(
                                    content: Text("Fill all required fields"),
                                  ),
                                );
                              },
                              context: context);
                    },
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                          color: Color.fromARGB(255, 180, 142, 16),
                          fontSize: 14),
                    ),
                    onPressed: () {
                      //signup screen
                    },
                  )
                ],
              ),
            ],
          )),
    );
  }
}
