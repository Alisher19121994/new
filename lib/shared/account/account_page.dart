import 'package:flutter/material.dart';
import 'package:newtask/shared/account/registration.dart';
import 'package:newtask/shared/manager.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final formKey = GlobalKey<FormState>();
  late String fullName;
  late String email;
  late String phone;
  late String password;
  late  String conformPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.arrow_back_outlined,size: 33,color: Colors.black,),
            )
          ],
        ),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  child: const Text("Let's Get Started!",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),

                ),
                const SizedBox(height: 10,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text("Create an account to Q Allure to get all features",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 17),),

                ),
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 14,),
                  TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.perm_identity_rounded),
                        labelText: 'FullName',
                        border: OutlineInputBorder()
                    ),
                    validator: (value){
                      if(value !=null&& value.isEmpty){
                        return 'FullName must not be empty';
                      }
                      return null;
                    },
                    onChanged: (value)=>setState(() => fullName = value),
                  ),
                  const SizedBox(height: 14,),
                  TextFormField(
                    decoration: const InputDecoration(
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
                    onChanged: (value)=>setState(() =>email = value),
                  ),
                  const SizedBox(height: 14,),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone_android_outlined),
                      labelText: 'Phone',
                      border: OutlineInputBorder()
                    ),
                    validator: (value){
                      if(value != null && value.isEmpty){
                        return 'Phone must not be empty';
                      }
                      return null;
                    },
                    onChanged: (value)=>setState(() =>phone = value),
                  ),
                  const SizedBox(height: 14,),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Password',
                      border: OutlineInputBorder()
                    ),
                    validator: (value){
                      if(value != null && value.isEmpty){
                        return 'Password must not be empty';
                      }
                      return null;
                    },
                    onChanged: (value)=>setState(() =>password=value),
                  ),
                  const SizedBox(height: 14,),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Conform Password',
                      border: OutlineInputBorder()
                    ),
                    validator: (value){
                      if(value != null && value.isEmpty){
                        return 'Conform Password must not be empty';
                      }
                      return null;
                    },
                    onChanged: (value)=>setState(() => conformPassword = value),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 50,vertical: 30),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent,),
                      onPressed: (){
                        final isValid = formKey.currentState!.validate();
                        Registration register = Registration(fullName, email, phone, password, conformPassword);
                        if(isValid){
                          PrefsManager.saveReg(register);
                          PrefsManager.fetchReg();
                        }
                      },
                      child: const Text("CREATE",style: TextStyle(color: Colors.white,fontSize: 20),),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                    const Text("Already have an account?",style: TextStyle(color: Colors.black54,fontSize: 17),),
                     TextButton(
                       onPressed: (){},
                       child: const Text("Login here",style: TextStyle(color: Colors.blueAccent,fontSize: 17),),
                     )
                    ],
                  )
                ],
              ),
            ),

          ],
        ),
      ),

    );
  }
}
