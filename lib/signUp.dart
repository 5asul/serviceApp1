import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_for_all/info.dart';
import 'package:project_for_all/costum/custom_feild.dart';


import 'component/crud.dart';
import 'component/valid.dart';
import 'constent/linkapi.dart';
import 'continerPage.dart';
import 'database/sqfLite.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with Crud {

  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  late final String? Function(String?) valid ;

  bool isLoading = false;
  Info _info = Info();

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  SqlDb sqlDb = SqlDb();


  Future<void> signUp() async {
    if (formstate.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      try {
        int response = await sqlDb.insertData("INSERT INTO 'users' ('username', 'email', 'password') VALUES ('${username.text}', '${email.text}', '${password.text}')");
        if (response > 0) {
          Navigator.of(context).pushNamedAndRemoveUntil('container', (route) => false);
        } else {
          // Handle signup failure gracefully (e.g., display an error message)
          print("Signup failed"); // Assuming 'message' is in response
        }
      } catch (error) {
        print("Signup Error: $error");  // Log for debugging
        // Display an error message to the user
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      print("Error: Form validation failed");
    }
  }
  // signUp() async {
  //
  //   if (formstate.currentState!.validate()) {
  //
  //
  //     setState(() {
  //       isLoading = true;
  //     });
  //     var response = await _crud.postRequest(linkSignUp, {
  //       "username": username.text,
  //       "email" : email.text,
  //       "password": password.text
  //     });
  //
  //     setState(() {
  //       isLoading = false;
  //     });
  //     if (response['status'] == 'success') {
  //       Navigator.of(context).pushNamedAndRemoveUntil('home', (route) => false);
  //     }else {
  //       print("SingUp Fail");
  //     }
  //
  //   }
  //   else {
  //     print("Error.......");
  //   }
  // }

  // SignUp()async {
  //   var resp =await _info.postReq(linkSignUp, {
  //     "username":username.text,
  //     "password":password.text,
  //     "email":email.text,
  //   });
  //
  //   if(resp['status']=="success"){
  //     Navigator.of(context).pushNamed("login");
  //   }
  //   else{
  //     print("Error.......");
  //   }
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(leading:Container(
        width: 1,
      ) ,
          backgroundColor: primary,
          title: Center(child: Padding(
            padding: const EdgeInsets.only(right: 55.0),
            child: Text("SignUp",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.white
            ),

            ),
          ),
          ),
          shadowColor: Colors.black
          ,elevation: 10.0
      ),
      body:isLoading== true
          ?Center( child: CircularProgressIndicator())
          : Container(

        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/paper1.jpg"),
              fit: BoxFit.cover
            )
        ),
        child: Center(

          child: SingleChildScrollView(
            child: Padding(

              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Stack(
                    children: [
                      Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 7.0
                              ..color = Colors.white54
                        ),

                      ),
                      Text(
                          'Sign Up',
                      style: TextStyle(
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Colors.black,
                            offset: Offset(1.0, 1.0),
                          ),
                        ],
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: primary
                      ),
                      )
                    ]
                  ),
                  SizedBox (
                    height: 40.0,
                  ),
                Form(
                  key: formstate,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                  child: CustomTextFeild(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obSecure: false,
                    label: "Username",
                      icon: Icon(
                        Icons.person
                      ),
                      valid:  (var val){

                      return validInput(val!,3,20);
                  } ,
                      myController: username,
                  ),
                ),
                  SizedBox(
                    height: 15.0,
                  ),
                  CustomTextFeild(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    label: "Email",
                    obSecure: false,
                    icon: Icon(
                        Icons.email
                    ),
                    valid: (String?val){

                        return validInput(val!,2,40);

                    } ,
                    myController: email,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  CustomTextFeild(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    label: "Password",
                    obSecure: true,
                    icon: Icon(
                        Icons.password
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye
                    ),
                    valid: (val){
                      return validInput(val!,2,40);
                    } ,
                    myController: password,
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Container(
                    width: double.infinity,
                    color: primary,
                    child: MaterialButton(
                      onPressed: () async
                      {
                        await signUp();

                        // print(email.text);
                        // print(password.text);
                        // print(password.text);
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login to your account',
                      ),
                      TextButton(onPressed: () {

                        Navigator.of(context).pushNamedAndRemoveUntil('login', (route) => false);
                      },
                          child: Stack(
                            children:[
                              Text(
                              'Login',
                              style: TextStyle(

                                  fontWeight: FontWeight.bold,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 3.5
                                    ..color = Colors.white54
                              ),
                              ),
                              Text(
                              'Login',
                              style: TextStyle(
                                  color: primary
                              ),
                            ),
                            ]
                          ),

          )
                    ],
                  ),
                ],
              ),
            ),
          ],),
        ),
      ),
    )
    )
    );
  }
}
