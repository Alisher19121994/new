import 'package:flutter/material.dart';
import 'package:newtask/localDB/task1/hive_service.dart';
import 'package:newtask/localDB/task1/user_obj.dart';
import 'package:newtask/localDB/task2/sign_up_page.dart';

import 'data.dart';
import 'obj.dart';

class SignIns extends StatefulWidget {
  const SignIns({Key? key}) : super(key: key);
  static const id = "signIn";

  @override
  State<SignIns> createState() => _SignInsState();
}

class _SignInsState extends State<SignIns> {
  final formKey = GlobalKey<FormState>();
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: 60,
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/logo.png"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Sign In",
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50,),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0))),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      const SizedBox(height: 60,),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.black)
                        ),
                        validator: (value){
                          if(value != null && value.isEmpty){
                            return 'Email must not be empty';
                          }
                          return null;
                        },
                        onChanged: (value) => setState(() => email =value),
                      ),
                      const SizedBox(height: 28,),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.black)
                        ),
                        validator: (value){
                          if(value != null && value.isEmpty){
                            return 'Password must not be empty';
                          }
                          return null;
                        },
                        onChanged: (value)=>setState(() => password = value),
                      ),
                      const SizedBox(height: 24,),
                      const Text("Forget password?",style: TextStyle(color: Colors.grey),),
                      const SizedBox(height: 35,),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: (){
                              final isValid = formKey.currentState!.validate();
                              var user = UserLogins(email, password);
                              if(isValid){
                                HiveServices.saveUser(user);
                                HiveServices.fetchUser();
                              }


                            },
                            child: const Text("Sign in",style: TextStyle(color: Colors.white,fontSize: 17),)
                        ),
                      ),
                      const SizedBox(height: 25,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("----------------------",style: TextStyle(color: Colors.grey),),
                          SizedBox(width: 10,),
                          Text("OR",style: TextStyle(color: Colors.grey),),
                          SizedBox(width: 10,),
                          Text("----------------------",style: TextStyle(color: Colors.grey),),


                        ],
                      ),
                      const SizedBox(height: 35,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: (){}, icon: Image.asset("assets/images/f.png"),),
                          const SizedBox(width: 25,),
                          IconButton(onPressed: (){}, icon: Image.asset("assets/images/tw.png"),),
                          const SizedBox(width: 25,),
                          IconButton(onPressed: (){}, icon: Image.asset("assets/images/in.png"),),
                        ],
                      ),
                      Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:   [
                               const Text("Don't have an account yet?",style: TextStyle(color: Colors.black,fontSize: 17),),
                              TextButton(
                                  onPressed: (){
                                    Navigator.pushNamed(context, SignUpPage.id);
                                  },
                                  child: const Text("SignUp",style: TextStyle(color: Colors.green),))
                        ],
                      ))

                    ],
                  ),
                ),
              ),

            )
          ],
        ),
      ),
    );
  }
}
