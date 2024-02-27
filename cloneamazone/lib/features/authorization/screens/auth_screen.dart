import 'package:cloneamazone/commonwidgits/widgits/appButton.dart';
import 'package:cloneamazone/constants/globalVaribles.dart';
import 'package:cloneamazone/features/authorization/services/auth_service.dart';
import 'package:flutter/material.dart';

import '../../../commonwidgits/widgits/appTextFild.dart';



//Enum for ListTile value as Sign-in and Sign-up

enum ActiveScreen{
  signin,
  signup
}

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  ActiveScreen _activeScreen = ActiveScreen.signup;
  AuthService authService = AuthService();
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  //Text Editing Controller
  final TextEditingController _emailControler = TextEditingController();
  final TextEditingController _passwordControler = TextEditingController();
  final TextEditingController _nameControler = TextEditingController();

  //disposing memory lick

  @override
  void dispose(){
    super.dispose();
    _emailControler.dispose();
    _passwordControler.dispose();
    _nameControler.dispose();
  }


  void signupUser(){
    authService.signupUser(
        context: context,
        name: _nameControler.text,
        email: _emailControler.text,
        password: _passwordControler.text,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome',
                     style: TextStyle(
                       fontSize: 22,
                       fontWeight: FontWeight.w500,
                     ),
                  ),
                  ListTile(
                    tileColor: _activeScreen == ActiveScreen.signup
                        ? GlobalVariables.backgroundColor
                        : GlobalVariables.greyBackgroundCOlor ,
                    title: const Text(
                      'Sign-up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
        
                    leading: Radio(
                        activeColor: GlobalVariables.secondaryColor,
                        value: ActiveScreen.signup,
                        groupValue: _activeScreen,
                        onChanged: (ActiveScreen? value){
                          setState(() {
                            _activeScreen = value!;
                          });
                        },
                    ),
        
                  ),
        
                  if(_activeScreen == ActiveScreen.signup)
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: GlobalVariables.backgroundColor,
                      child: Form(
                          key: _signUpFormKey,
                          child: Column(
                            children: [
                              AppTextField(
                                controller: _nameControler ,
                                hintText: 'Name',
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AppTextField(
                                controller: _emailControler,
                                hintText: 'Email',
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AppTextField(
                                controller: _passwordControler,
                                hintText: 'Password',
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AppButton(
                                  text: 'Signup',
                                  onTap: (){
                                     if(_signUpFormKey.currentState!.validate()){
                                       signupUser();
                                     }
                                  }
                              ),
                            ],
                          ),
                      ),
                    ),
        
                  ListTile(
                    title: const Text(
                      'Sign-in',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
        
                    leading: Radio(
                      activeColor: GlobalVariables.secondaryColor,
                      value: ActiveScreen.signin,
                      groupValue: _activeScreen,
                      onChanged: (ActiveScreen? value){
                        setState(() {
                          _activeScreen = value!;
                        });
                      },
                    ),
        
                  ),
                  if(_activeScreen == ActiveScreen.signin)
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: GlobalVariables.backgroundColor,
                      child: Form(
                        key: _signInFormKey,
                        child: Column(
                          children: [
                            AppTextField(
                              controller: _emailControler,
                              hintText: 'Email',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppTextField(
                              controller: _passwordControler,
                              hintText: 'Password',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppButton(
                                text: 'Sign-in',
                                onTap: (){}
                            ),
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

