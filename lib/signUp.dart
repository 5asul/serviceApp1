import 'package:flutter/material.dart';
import 'package:project_for_all/info.dart';
import 'package:project_for_all/link.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  Info _info = Info();

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  SignUp()async {
    var resp =await _info.postReq(linkSignUp, {
      "username":username.text,
      "password":password.text,
      "email":email.text,
    });

    if(resp['status']=="success"){
      Navigator.of(context).pushNamed("login");
    }
    else{
      print("Error.......");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

      ),
      body: Container(

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
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox (
                    height: 40.0,
                  ),
                TextFormField(
                  controller: username,
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (String value)
                  {
                    print(value);
                  },
                  onChanged: (String value)
                  {
                    print(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(
                        Icons.person
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (String value)
                    {
                      print(value);
                    },
                    onChanged: (String value)
                    {
                      print(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      prefixIcon: Icon(
                          Icons.email
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: password,
                    keyboardType: TextInputType.visiblePassword,
                    onFieldSubmitted: (String value)
                    {
                      print(value);
                    },
                    onChanged: (String value)
                    {
                      print(value);
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      prefixIcon: Icon(
                          Icons.lock
                      ),
                      suffixIcon: Icon(
                        Icons.remove_red_eye,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.deepPurple,
                    child: MaterialButton(
                      onPressed: ()
                      {
                        print(email.text);
                        print(password.text);
                        print(password.text);
                      },
                      child: Text(
                        'LOGIN',
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
                      TextButton(onPressed: ()
                      {
                        Navigator.of(context).pop();
                      },
                          child: Text(
                            'Login',
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
