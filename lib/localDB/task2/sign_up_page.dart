import 'package:flutter/material.dart';
import 'package:newtask/localDB/task2/sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static const id = "signUpPage";
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  late String email;
  late String number;
  late String address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 120,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: const [
                  Text("Welcome", style: TextStyle(color: Colors.white, fontSize: 20),),
                  SizedBox(height: 4,),
                  Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 35),),
                ],
              ),
            ),
            const SizedBox(height: 40,),
            Expanded(
                child:Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50.0),
                      topLeft: Radius.circular(50.0)
                    )
                  ),
                 child: Container(
                   margin: const EdgeInsets.symmetric(horizontal: 30),
                   child: Column(
                     children: [
                       const SizedBox(height: 60,),
                       TextFormField(
                         decoration: const InputDecoration(
                           labelStyle:  TextStyle(color: Colors.black),
                           labelText: 'Email'
                         ),
                         validator: (value){
                           if(value != null && value.isEmpty){
                             return 'Email must not be empty';
                           }
                           return null;
                         },
                         onChanged: (value)=>setState(() =>email =value),
                       ),
                       const SizedBox(height: 20,),
                       TextFormField(
                         decoration: const InputDecoration(
                             labelStyle:  TextStyle(color: Colors.black),
                             labelText: 'Number'
                         ),
                         validator: (value){
                           if(value != null && value.isEmpty){
                             return 'Number must not be empty';
                           }
                           return null;
                         },
                         onChanged: (value)=>setState(() =>number =value),
                       ),
                       const SizedBox(height: 20,),
                       TextFormField(
                         decoration: const InputDecoration(
                             labelStyle:  TextStyle(color: Colors.black),
                             labelText: 'Address'
                         ),
                         validator: (value){
                           if(value != null && value.isEmpty){
                             return 'Address must not be empty';
                           }
                           return null;
                         },
                         onChanged: (value)=>setState(() =>address =value),
                       ),
                       const SizedBox(height: 60,),
                       Container(
                         height: 50,
                         width: double.infinity,
                         margin: const EdgeInsets.symmetric(horizontal: 20),
                         child: ElevatedButton(
                           onPressed: (){
                             final isValid = formKey.currentState!.validate();
                             if(isValid){

                             }
                           },
                           style: ElevatedButton.styleFrom(
                             backgroundColor: Colors.green
                           ),
                           child: const Text("Sign up",style: TextStyle(color: Colors.white,fontSize: 17),),
                         ),

                       ),
                       //const SizedBox(height: 30,),
                       Expanded(
                           child: Column(
                             children: [
                               Column(
                                 children: [
                                   const SizedBox(height: 20,),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: const [
                                       Text("---------------------"),
                                       SizedBox(width: 8,),
                                       Text("OR"),
                                       SizedBox(width: 8,),
                                       Text("---------------------"),
                                     ],
                                   ),
                                   const SizedBox(height: 40,),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children:  [
                                       IconButton(onPressed: (){}, icon: Image.asset("assets/images/f.png")),
                                       const SizedBox(width: 20,),
                                       IconButton(onPressed: (){}, icon: Image.asset("assets/images/tw.png")),
                                       const SizedBox(width: 20,),
                                       IconButton(onPressed: (){}, icon: Image.asset("assets/images/in.png")),

                                     ],
                                   ),
                                 ],
                               ),
                               const SizedBox(height: 60,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children:  [
                                   const Text("Already have an account?",style: TextStyle(color: Colors.black),),
                                   TextButton(
                                       onPressed: (){
                                         Navigator.pushNamed(context, SignIns.id);
                                       },

                                       child: const Text("SignIp",style: TextStyle(color: Colors.green,fontSize: 18),)
                                   )

                                 ],
                               ),
                             ],
                           )
                       )
                     ],
                   ),
                 ),
                )
            )
          ],
        ),
      ),

    );
  }
}
