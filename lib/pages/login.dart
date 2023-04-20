import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/Validations.dart';

import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void fgPassValidation() {
    if (forgotemail_controller.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.green[300],
            title: Text(
              "Please fill in all fields",
              style: TextStyle(color: Colors.white),
            ), // Title of the dialog
            content: const SizedBox(
              height: 1,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("ok"), // Button text
              ),
            ],
          );
        },
      );
      return;
    }

    if (!forgotemail_controller.text.trim().isEmail()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.green[300],
            title: Text(
              "Please check email format",
              style: TextStyle(color: Colors.white),
            ), // Title of the dialog
            content: const SizedBox(
              height: 1,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("ok"), // Button text
              ),
            ],
          );
        },
      );
      return;
    }

    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.green[300],
          title: Text(
            "Done",
            style: TextStyle(color: Colors.white),
          ), // Title of the dialog
          content: const SizedBox(
            height: 1,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                ); // Close the dialog
              },
              child: Text("ok"), // Button text
            ),
          ],
        );
      },
    );
  }

  void forgotMypassword() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.green[300],
          title: Text(
            "Forgot password",
            style: TextStyle(color: Colors.white),
          ), // Title of the dialog
          content: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Enter your email below and we will contact you',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 30),
                TextField(
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  controller: forgotemail_controller,
                  autofocus: false,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.black26,
                  ),
                ),
              ],
            ),
          ), // Content of the dialog
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back "), // Button text
            ),
            TextButton(
              onPressed: fgPassValidation,
              child: Text("Done"), // Button text
            ),
          ],
        );
      },
    );
  }

  void logIn() {
    if (email_controller.text.trim().isEmpty ||
        password_controller.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.green[300],
            title: Text(
              "Please fill in all fields",
              style: TextStyle(color: Colors.white),
            ), // Title of the dialog
            content: const SizedBox(
              height: 1,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("ok"), // Button text
              ),
            ],
          );
        },
      );
      return;
    }
    if (!email_controller.text.trim().isEmail()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.green[300],
            title: Text(
              "Please check email format",
              style: TextStyle(color: Colors.white),
            ), // Title of the dialog
            content: const SizedBox(
              height: 1,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("ok"), // Button text
              ),
            ],
          );
        },
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const MyHomePage(
                title: "Home",
              )),
    );
  }

  void register() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }

  var email_controller = TextEditingController();
  var password_controller = TextEditingController();
  var forgotemail_controller = TextEditingController();
  bool hide = true;

  Icon passwordIcon = Icon(Icons.remove_red_eye);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.jpg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 100,
            title: const Text(
              "Login",
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/running-man.png',
                      height: 250,
                      width: 250,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "Email :",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white, fontSize: 16),
                            controller: email_controller,
                            autofocus: false,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.email,
                                color: Color.fromRGBO(223, 62, 0, 1),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor: Colors.white24,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "Password :",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white, fontSize: 16),
                            controller: password_controller,
                            autofocus: false,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: passwordIcon,
                                color: Color.fromRGBO(223, 62, 0, 1),
                                onPressed: () {
                                  setState(() {
                                    if (hide == false) {
                                      hide = true;
                                      passwordIcon = Icon(Icons.password);
                                    } else if (hide == true) {
                                      hide = false;
                                      passwordIcon = Icon(Icons.remove_red_eye);
                                    }
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor: Colors.white24,
                            ),
                            obscureText: hide,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.black12)),
                                onPressed: forgotMypassword,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "Forgot My Password",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: logIn,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Log In",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: register,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Register",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
