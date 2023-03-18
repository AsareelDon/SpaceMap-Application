import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:spacemap_app/Screens/register_sreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _SignInState();
}

class _SignInState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String email = '', password = '';
  late bool _password;
  final FocusNode _emailIsFocus = FocusNode();
  final FocusNode _passwordIsFocus = FocusNode();
  bool isLogIn = false, isPressed = false;

  @override
  void initState() {
    super.initState();
    _password = false;
    _emailIsFocus.addListener(_eventFocus);
    _passwordIsFocus.addListener(_eventFocus);
    email = _emailController.text;
    password = _passwordController.text;
  }

  @override
  void dispose() {
    super.dispose();
    _emailIsFocus.dispose();
    _passwordIsFocus.dispose();
  }

  void _eventFocus() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 26, 47, 1.0),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                const Center(
                  child: Text('Login',
                      style: TextStyle(
                          color: CupertinoColors.systemGrey2,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 35,
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.text,
                  focusNode: _emailIsFocus,
                  style: const TextStyle(color: CupertinoColors.systemGrey2),
                  decoration: InputDecoration(
                      suffixIcon: _emailIsFocus.hasFocus
                          ? IconButton(
                              icon: const Icon(Icons.clear_outlined),
                              onPressed: () {
                                setState(() {
                                  _emailController.clear();
                                });
                              },
                            )
                          : null,
                      prefixIcon:
                          const Icon(Icons.email_outlined, color: Colors.grey),
                      labelText: 'Email',
                      labelStyle:
                          const TextStyle(color: CupertinoColors.systemGrey2),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: CupertinoColors.activeBlue,
                          )),
                      errorStyle:
                          const TextStyle(color: CupertinoColors.activeOrange)),
                  onChanged: (val) => setState(() {
                    email = val;
                  }),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  focusNode: _passwordIsFocus,
                  obscureText: !_password,
                  enableSuggestions: false,
                  autocorrect: false,
                  style: const TextStyle(color: CupertinoColors.systemGrey2),
                  decoration: InputDecoration(
                    prefixIcon:
                        const Icon(Icons.lock_outline, color: Colors.grey),
                    labelText: 'Password',
                    labelStyle:
                        const TextStyle(color: CupertinoColors.systemGrey2),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: CupertinoColors.activeBlue,
                        )),
                    suffixIcon: _passwordIsFocus.hasFocus
                        ? IconButton(
                            icon: Icon(
                              _password
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: CupertinoColors.systemGrey,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                _password = !_password;
                              });
                            },
                          )
                        : null,
                  ),
                  onChanged: (val) => setState(() {
                    password = val;
                  }),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10, bottom: 10, left: 200),
                  child: RichText(
                    textAlign: TextAlign.right,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Forgot password?',
                            style: const TextStyle(
                                color: CupertinoColors.activeBlue,
                                fontSize: 14,
                                fontStyle: FontStyle.italic),
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                  onPressed: () async => {},
                  child: isLogIn
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: CircularProgressIndicator(
                                color: CupertinoColors.white,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text('Signing in...')
                          ],
                        )
                      : const Text(
                          "Login",
                          style: TextStyle(
                              color: CupertinoColors.white,
                              fontWeight: FontWeight.bold),
                        ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Expanded(
                      child: Divider(
                        endIndent: 10,
                        indent: 10,
                        thickness: 1,
                        color: CupertinoColors.systemGrey2,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'or',
                      style: TextStyle(color: CupertinoColors.systemGrey2),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Divider(
                        endIndent: 10,
                        indent: 10,
                        thickness: 1,
                        color: CupertinoColors.systemGrey2,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(40),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      )),
                  onPressed: () async => {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage('assets/images/google_icon.png'),
                        width: 30,
                      ),
                      SizedBox(width: 10),
                      Text("Continue with Google",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: CupertinoColors.black,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: RichText(
                    text: TextSpan(
                      text: 'Don' 't have an account?',
                      style: const TextStyle(
                          color: CupertinoColors.systemGrey2, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                            text: '    Signup',
                            style: const TextStyle(
                                color: CupertinoColors.activeBlue,
                                fontSize: 14),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterScreen()));
                              }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
