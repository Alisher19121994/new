import 'package:flutter/material.dart';
import 'package:newtask/localDB/task1/sign_up_page.dart';
import 'package:newtask/localDB/task1/user_obj.dart';

import '../hive_service.dart';
import 'database.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  static final String id = "signin_id";
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  late String userName;
  late String password;
  @override
  void initState() {
    super.initState();
    // var user = UserLogin("alisher123","qwerts");
    // HiveService.saveUser(user);
    // HiveService.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Form(
        key: formKey,
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20 ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 100,
                  width: 100,
                  decoration:  BoxDecoration(
                      image: const DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(19)
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children:  [
                      const SizedBox(height: 20,),
                      const Text("WELCOME BACK!",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 8,),
                      const Text("Sign in to Continue",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 40,),
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration:   const InputDecoration(
                          prefixIcon: Icon(Icons.perm_identity,color: Colors.white,),
                          labelText: 'Username',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        validator: (value){
                          if(value!=null && value.isEmpty){
                            return 'Username must not be empty';
                          }
                          return null;
                        },
                        onChanged: (value) => setState(() =>userName=value ),
                      ),
                      const SizedBox(height: 10,),
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock,color: Colors.white,),
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        validator: (value){
                          if(value != null && value.isEmpty){
                            return 'Password must not be empty';
                          }
                          return null;
                        },
                        onChanged: (value) => setState(() =>password=value),
                      ),
                      const SizedBox(height: 13,),
                      const Text("Forgot password?",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.normal),),
                      const SizedBox(height: 20,),
                      ElevatedButton(
                          onPressed: (){
                            final isValid = formKey.currentState!.validate();
                            if(isValid){
                              var user = UserLogin(userName,password);
                              HiveService.saveUser(user);
                              HiveService.fetchUser();
                              Navigator.pushNamed(context, SignUp.id);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(20),
                          backgroundColor: Colors.blueAccent
                        ),
                          child:const Icon(Icons.arrow_right_alt,color: Colors.white,size: 30,),

                      ),
                      const SizedBox(height: 120,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account yet?",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.normal),),
                          TextButton(
                            onPressed: (){
                              Navigator.pushNamed(context, SignUp.id);
                            },
                            child: const Text("SIGN UP",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 17),),
                          )
                        ],
                      )
                    ],
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
