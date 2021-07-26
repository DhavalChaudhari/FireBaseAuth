import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void Login() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      // signin(email, password, context).then((value) {
      //   if (value != null) {
      //     Navigator.pushReplacement(
      //         context, MaterialPageRoute(builder: (context) => TasksPage()));
      //   }
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FlutterLogo(
                size: 50.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Login Here",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                child: Form(
                  //key: formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Email",
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "This Field is Required")
                        ]),
                        onChanged: (val) {
                          email = val;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Password"),
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: 'Password is Required'),
                            MinLengthValidator(6,
                                errorText: 'Atleast 6 Characters Required')
                          ]),
                          onChanged: (val) {
                            password = val;
                          },
                        ),
                      ),
                      ElevatedButton(
                        // onPressed: () {
                        //   Navigator.of(context).push(MaterialPageRoute(
                        //       builder: (context) => LoginScreen()));
                        // },
                        onPressed: Login,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                          textStyle: MaterialStateProperty.all(
                              TextStyle(color: Colors.white)),
                        ),
                        child: Text('Login'),
                      ),
                      MaterialButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: Image(
                          image: AssetImage('assets/signin.png'),
                          width: 205,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      // --- Material Button ---
                      Container(
                        width: 200,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.maxFinite, 40),
                          ),
                          onPressed: () {},
                          icon: Image(
                            image: AssetImage('assets/mail.png'),
                            height: 38,
                            width: 38,
                          ),
                          label: Text(
                            'Sign in with Email',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textScaleFactor: 1.1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'Sign up Here',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                  textScaleFactor: 1.1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


// MaterialButton(
                      //   height: 45,
                      //   color: Colors.blue[800],
                      //   onPressed: () {},
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       Container(
                      //         padding: EdgeInsets.all(10),
                      //         height: 44,
                      //         width: 44,
                      //         decoration: BoxDecoration(
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(3)),
                      //           color: Colors.white,
                      //           image: DecorationImage(
                      //               image: AssetImage('assets/google.png'),
                      //               fit: BoxFit.cover),
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         width: 20,
                      //       ),
                      //       Text(
                      //         'Sign in with Google',
                      //         style: TextStyle(
                      //             fontWeight: FontWeight.bold,
                      //             color: Colors.white),
                      //         textScaleFactor: 1.2,
                      //       ),
                      //     ],
                      //   ),
                      // ),