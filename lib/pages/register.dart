import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/Validations.dart';

import 'package:flutter_application_1/pages/login.dart';
import 'package:password_field_validator/password_field_validator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var email_controller = TextEditingController();
  var password_controller = TextEditingController();
  var passwordagain_controller = TextEditingController();
  var name_controller = TextEditingController();
  var surname_controller = TextEditingController();

  bool hide = true;
  bool hide1 = true;

  void register() {
    if (email_controller.text.trim().isEmpty ||
        name_controller.text.trim().isEmpty ||
        password_controller.text.trim().isEmpty ||
        passwordagain_controller.text.trim().isEmpty ||
        surname_controller.text.trim().isEmpty) {
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

    if (!name_controller.text.trim().isName() ||
        !surname_controller.text.trim().isName()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.green[300],
            title: Text(
              "Please enter valid names or surnames ",
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

    if (!password_controller.text.trim().hasNumber() ||
        !password_controller.text.trim().hasLowercase() ||
        !password_controller.text.trim().hasUppercase() ||
        !password_controller.text.trim().hasSpecialChar() ||
        !password_controller.text.trim().longEnough()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.green[300],
            title: Text(
              "Please meet password requirements \nfound at the bottom of the page",
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

    if (password_controller.text.trim() !=
        passwordagain_controller.text.trim()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.green[300],
            title: Text(
              "Please make sure that the password fields match",
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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'), // Title of the dialog
          content: Text('Registration successful.'), // Content of the dialog
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                ); // Close the dialog
              },
              child: Text('OK'), // Button text
            ),
          ],
        );
      },
    );
  }

  Icon passwordIcon = Icon(Icons.remove_red_eye);
  Icon passwordagainIcon = Icon(Icons.remove_red_eye);
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
              "Register",
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
                      height: 200,
                      width: 200,
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
                                "Name :",
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
                            controller: name_controller,
                            autofocus: false,
                            decoration: InputDecoration(
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
                                "Surname :",
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
                            controller: surname_controller,
                            autofocus: false,
                            decoration: InputDecoration(
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "Repeat Password :",
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
                            controller: passwordagain_controller,
                            autofocus: false,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: passwordagainIcon,
                                color: Color.fromRGBO(223, 62, 0, 1),
                                onPressed: () {
                                  setState(() {
                                    if (hide1 == false) {
                                      hide1 = true;
                                      passwordagainIcon = Icon(Icons.password);
                                    } else if (hide1 == true) {
                                      hide1 = false;
                                      passwordagainIcon =
                                          Icon(Icons.remove_red_eye);
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "Password requirements ",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: PasswordFieldValidator(
                                minLength: 6,
                                uppercaseCharCount: 1,
                                lowercaseCharCount: 1,
                                numericCharCount: 1,
                                specialCharCount: 1,
                                defaultColor: Colors.black,
                                successColor: Colors.green,
                                failureColor: Colors.red,
                                controller: password_controller,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage("assets/back.png"),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: register,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage("assets/save.png"),
                              ),
                            ),
                          ),
                        ),
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
