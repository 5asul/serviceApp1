  import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../config/theme/colors_theme.dart';

Container SignUpBotton(BuildContext context , String username,String email,String password) {
  bool signUp_state = true;
    return Container(
                            width: double.infinity,
                            color: ColorsTheme().primary,
                            child: MaterialButton(
                                onPressed: () async {
                                  try {
                                    
                                      final credential = await FirebaseAuth
                                          .instance
                                          .createUserWithEmailAndPassword(
                                        email: email,
                                        password: password,
                                      );
                                      Navigator.of(context)
                                          .pushReplacementNamed('login');
                                     
                                      await FirebaseAuth.instance.currentUser!
                                          .sendEmailVerification();
                      
                                    
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      AwesomeDialog(
                                              context: context,
                                              dialogType: DialogType.error,
                                              title: "Error",
                                              desc:
                                                  "The password provided is too weak.")
                                          .show();
                                      print(
                                          'The password provided is too weak.');
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      AwesomeDialog(
                                              context: context,
                                              dialogType: DialogType.error,
                                              title: "Error",
                                              desc:
                                                  "The account already exists for that email.")
                                          .show();
                                      print(
                                          'The account already exists for that email.');
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
                                  
                                },
                                child:Text(
                                        'Sign Up',
                                        style: TextStyle(color: Colors.white),
                                      )),
                          );
  }