import 'package:brave/src/utils/constants.dart';
import 'package:brave/src/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                SizedBox(height: size(context, type: ScreenSize.height) * 0.15),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Sign in to brave',
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
                        obscureText: !passwordVisible,
                        controller: passwordController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () => setState(() {
                                    passwordVisible = !passwordVisible;
                                  }),
                              icon: Icon(
                                passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Theme.of(context).colorScheme.onPrimary,
                              )),
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
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    return Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 60),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 158, 127, 24))),
                          onPressed: () async {
                            if (!_formKey.currentState!.validate()) return;
                            ref.read(isLoadingProvider.notifier).state = true;
                            NavigationService.handleLogin(
                                context: context,
                                ref: ref,
                                email: emailController.text,
                                password: passwordController.text);
                          },
                          child: ref.watch(isLoadingProvider)
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 1.4,
                                  ),
                                )
                              : const Text('Login',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white)),
                        ));
                  },
                ),
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
