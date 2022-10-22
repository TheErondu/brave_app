import 'package:estatio/src/data/repository/user_repo.dart';
import 'package:estatio/src/index/index_view.dart';
import 'package:estatio/src/utils/constants.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  static const routeName = '/login';
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                SizedBox(height: size(context, type: Size.height) * 0.15),
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
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          }
                          return null;
                        },
                        cursorColor: Theme.of(context).colorScheme.onPrimary,
                        controller: emailController,
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          floatingLabelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
                          focusColor: Colors.green,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: const OutlineInputBorder(),
                          labelText: "Email",
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        cursorColor: Theme.of(context).colorScheme.onPrimary,
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          floatingLabelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  child: Text(
                    'Forgot Password',
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 60),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 158, 127, 24))),
                      onPressed: () async {
                        if (!_formKey.currentState!.validate()) return;
                        setState(() {
                          isLoading = true;
                        });
                        final res = await UserRepository().login(
                            emailController.text, passwordController.text);

                        if (res.success) {
                          setState(() {
                            isLoading = false;
                          });
                          if (!mounted) return;
                          Navigator.pushReplacementNamed(
                              context, IndexView.routeName);
                        } else {
                          setState(() {
                            isLoading = false;
                          });
                          if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor:
                                  Color.fromARGB(255, 180, 142, 16),
                              content: Text(
                                res.message,
                                style: Theme.of(context).textTheme.displaySmall,
                              )));
                        }
                      },
                      child: isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 1.4,
                              ),
                            )
                          : const Text('Login',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Don't have an account?"),
                    TextButton(
                      child: const Text(
                        'Sign up',
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
      ),
    );
  }
}
