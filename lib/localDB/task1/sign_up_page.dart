import 'package:flutter/material.dart';
import 'package:newtask/localDB/task1/sign_in_page.dart';
import 'package:newtask/localDB/task1/sign_up_obj.dart';

import 'database.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static final String id = "signup_id";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  late String userName;
  late String eMail;
  late String phoneNumber;
  late String passWord;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Form(
        key: formKey,
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: const [
                        Text("Create", style: TextStyle(color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),),
                        SizedBox(height: 8,),
                        Text("Account", style: TextStyle(color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),),
                      ],
                    )
                ),
                const SizedBox(height: 70,),
                Column(
                  children: [
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.perm_identity, color: Colors.white,),
                          labelText: 'UserName',
                          labelStyle: TextStyle(color: Colors.white)
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'UserName must not be empty';
                        }
                        return null;
                      },
                      onChanged: (value) => setState(() => userName = value),
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined,color: Colors.white,),
                        labelText: 'E-mail',
                        labelStyle: TextStyle(color: Colors.white)
                      ),
                      validator: (value){
                        if(value != null && value.isEmpty){
                          return 'E-mail must not be empty';
                        }
                        return null;
                      },
                      onChanged: (value)=> setState(() => eMail= value),
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone,color: Colors.white,),
                        labelStyle: TextStyle(color: Colors.white),
                        labelText: 'Phone Number'
                      ),
                      validator: (value){
                        if(value != null && value.isEmpty){
                          return 'Phone Number must not be empty';
                        }
                        return null;
                      },
                      onChanged: (value) => setState(() =>phoneNumber = value),
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.admin_panel_settings_sharp,color: Colors.white,),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white)
                      ),
                      validator: (value){
                        if(value != null && value.isEmpty){
                          return 'Password must not be empty';
                        }
                        return null;
                      },
                      onChanged: (value) => setState(() =>passWord = value),
                    ),
                    const SizedBox(height: 28,),
                    ElevatedButton(
                        onPressed: (){
                          final isValid = formKey.currentState!.validate();
                          var users = UserSignUp(userName, eMail, phoneNumber, passWord);
                          if(isValid){
                            HiveDatabase.saveData(users);
                            HiveDatabase.fetchData();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(20)
                      ),
                      child:const Icon(Icons.arrow_right_alt,color: Colors.white,size: 30,),
                    ),
                  ],
                ),
                const SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    const Text("Already have an account yet?",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.normal),),
                    TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, SignIn.id);
                        },
                        child: Text("SIGN IN",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 17),)
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}
