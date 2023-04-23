import 'package:flutter/material.dart';
import 'package:newtask/shared/serviceClass.dart';

import 'manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();
  late String email;
  late String pasword;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
       autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
            children: [
              //#Top image
              Container(
                height: 200,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 60),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.cover
                    )
                ),
              ),
              const SizedBox(height: 14,),
              //#title welcome
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text("WELCOME back!",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
              const SizedBox(height: 7,),
              //#content log in
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: const Text("Log in to your existent account of Q Allure",style: TextStyle(color: Colors.black45,fontSize: 16,fontWeight: FontWeight.normal),),
              ),
              const SizedBox(height: 60,),
              //#email
               TextFormField(
              decoration:  const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: 'Email',
                border: OutlineInputBorder()
              ),
              validator: (value){
                if(value != null && value.isEmpty){
                  return 'Email must not be empty';
                }
                return null;
              },
              onChanged: (value)=>setState(() => email = value),
            ),
              const SizedBox(height: 12,),
              //# password
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock_clock_sharp),
                  labelText: 'Password',
                  border: OutlineInputBorder()
                ),
                validator: (value){
                  if(value !=null && value.isEmpty){
                    return 'Password must not be empty';
                  }
                  return null;
                },
                onChanged: (value) =>setState(()=>pasword = value),
              ),
              const SizedBox(height:18,),
              //#Forgot password
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text("Forgot password?",style: TextStyle(color: Colors.black54,fontSize: 14),)
                ],
              ),
              const SizedBox(height: 12,),
              //# Login button
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: ElevatedButton(
                  onPressed: (){
                    final isValid = formKey.currentState!.validate();
                    User user  = User(email,pasword);
                    if(isValid){
                      PrefsManager.saveData(user);
                      PrefsManager.fetchData();
                    }
                  },
                  child: const Text("LOG IN"),
                ),
              ),
              const SizedBox(height: 90,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  Column(
                    children: [
                      const Text("Or connect using",style: TextStyle(color: Colors.black45,fontSize: 17),),
                      const SizedBox(height: 8,),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 60),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child:SizedBox(
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                                    onPressed: (){},
                                    child: const Text("Facebook",style: TextStyle(color: Colors.white),),
                                  ),
                                )
                            ),
                            const SizedBox(width: 12,),
                            Expanded(
                                child:SizedBox(
                                    height: 40,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                      onPressed: (){},
                                      child:  const Text("Google",style: TextStyle(color: Colors.white),),
                                    )
                                )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 90,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                   // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text("Don't have an account?",style: TextStyle(color: Colors.black54,fontSize: 17),),
                      const SizedBox(width: 1,),
                      TextButton(
                        onPressed: (){},
                        child: const Text("Sign Up",style: TextStyle(color: Colors.blue,fontSize: 17,fontWeight: FontWeight.bold),),)

                    ],
                  )
                ],
              )
            ],

        ),
      ),


    );
  }
}
