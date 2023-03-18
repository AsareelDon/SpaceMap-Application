import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:spacemap_app/AuthService/authentication.dart';
import 'package:spacemap_app/Screens/login_sreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _SignUpState();
}

class _SignUpState extends State<RegisterScreen> {
  Authentication _authentication = Authentication();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _address = TextEditingController();
  String email = '', password = '', passwordConfirm = '', name = '';
  late bool _password, _passwordConfirm;
  final FocusNode _emailIsFocus = FocusNode();
  final FocusNode _passwordIsFocus = FocusNode();
  final FocusNode _nameIsFocus = FocusNode();
  final FocusNode _ageIsFocus = FocusNode();
  final FocusNode _addressIsFocus = FocusNode();
  bool isLogIn = false, isPressed = false;
  int charCount = 0;
  List<String> role = ['Student', 'Teacher'];
  String? selectedRole;
  int age = 0;

  @override
  void initState() {
    super.initState();
    _password = false;
    _emailIsFocus.addListener(_eventFocus);
    _passwordIsFocus.addListener(_eventFocus);
    _nameIsFocus.addListener(_eventFocus);
    _ageIsFocus.addListener(_eventFocus);
    _addressIsFocus.addListener(_eventFocus);
    name = _name.text;
    age = _age as int;
  }

  @override
  void dispose() {
    super.dispose();
    _emailIsFocus.dispose();
    _passwordIsFocus.dispose();
    _nameIsFocus.addListener(_eventFocus);
    _ageIsFocus.addListener(_eventFocus);
    _address.addListener(_eventFocus);
  }

  void _eventFocus() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: CupertinoColors.white,
          icon: const Icon(CupertinoIcons.xmark),
          iconSize: 27,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color.fromRGBO(5, 26, 47, 1.0),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                const Center(
                  child: Text(
                    'Create an account.',
                    style: TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        style:
                            const TextStyle(color: CupertinoColors.systemGrey2),
                        maxLength: 50,
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
                          prefixIcon: const Icon(
                            CupertinoIcons.person,
                            color: Colors.grey,
                          ),
                          labelText: 'Name',
                          labelStyle: const TextStyle(
                              color: CupertinoColors.systemGrey2),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: CupertinoColors.activeBlue,
                              )),
                          counterStyle: const TextStyle(
                            color: CupertinoColors.activeBlue,
                            fontSize: 12,
                          ),
                          counterText: null,
                        ),
                        onChanged: (val) => setState(() {
                          charCount = charCount + 1;
                          email = val;
                        }),
                      ),
                      TextFormField(
                        style:
                            const TextStyle(color: CupertinoColors.systemGrey2),
                        maxLength: 50,
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
                          prefixIcon: const Icon(
                            CupertinoIcons.person,
                            color: Colors.grey,
                          ),
                          labelText: 'Age',
                          labelStyle: const TextStyle(
                              color: CupertinoColors.systemGrey2),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: CupertinoColors.activeBlue,
                              )),
                          counterStyle: const TextStyle(
                            color: CupertinoColors.activeBlue,
                            fontSize: 12,
                          ),
                          counterText: null,
                        ),
                        onChanged: (val) => setState(() {
                          charCount = charCount + 1;
                          age = val as int;
                        }),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  style: const TextStyle(color: CupertinoColors.systemGrey2),
                  maxLength: 50,
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
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Colors.grey,
                    ),
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
                    counterStyle: const TextStyle(
                      color: CupertinoColors.activeBlue,
                      fontSize: 12,
                    ),
                    counterText: null,
                  ),
                  onChanged: (val) => setState(() {
                    charCount = charCount + 1;
                    email = val;
                  }),
                ),
                TextFormField(
                  obscureText: !_password,
                  enableSuggestions: false,
                  autocorrect: false,
                  style: const TextStyle(color: CupertinoColors.systemGrey2),
                  decoration: InputDecoration(
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
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.grey,
                    ),
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
                  ),
                  onChanged: (val) => setState(() {
                    password = val;
                  }),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: !_passwordConfirm,
                  enableSuggestions: false,
                  autocorrect: false,
                  style: const TextStyle(color: CupertinoColors.systemGrey2),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.grey,
                    ),
                    labelText: 'Confirm password',
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
                              _passwordConfirm
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: CupertinoColors.systemGrey,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordConfirm = !_passwordConfirm;
                              });
                            },
                          )
                        : null,
                  ),
                  onChanged: (val) => setState(() {
                    passwordConfirm = val;
                  }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Choose role:  "),
                    DropdownButton(
                      value: role[0],
                      icon: const Icon(CupertinoIcons.arrow_down),
                      items: role.map((String role) {
                        return DropdownMenuItem(
                          value: role,
                          child: Text(role),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedRole = value!;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                  onPressed: () async {
                    await _authentication.createAccount(
                        email, password, selectedRole!, age, "", "", "", "");
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                        color: CupertinoColors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: RichText(
                    text: TextSpan(
                      text: 'Have an account already?',
                      style: const TextStyle(
                          color: CupertinoColors.systemGrey2, fontSize: 13),
                      children: <TextSpan>[
                        TextSpan(
                            text: '    Sign in',
                            style: const TextStyle(
                                color: CupertinoColors.activeBlue,
                                fontSize: 13),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
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
