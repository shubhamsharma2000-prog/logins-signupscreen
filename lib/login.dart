import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/home.dart';
import 'package:login/signup.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(flex: 2,child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("My login",style: TextStyle(
                         fontWeight:FontWeight.w700,
                        fontSize: 46.0,
                        color: Colors.white,
                      ),),
                      Text("try something new",
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold,
                          fontSize: 20),
                          )
                    ],
                  ),
                ),),
                Expanded(flex: 5, child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          TextField(
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.withOpacity(0.3),
                              border: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              hintText: "Enter email",
                              prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),
                            ),
                          ),
                        SizedBox(height: 15,),
                        TextField(
                          controller: password,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.withOpacity(0.3),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Enter Password",
                                prefixIcon: Icon(Icons.lock_outline_rounded,color: Colors.black,)
                    
                    
                            )
                        ),
                        SizedBox(height: 10,),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 70,

                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: ElevatedButton(onPressed: (){
                            FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text).then((value) => {
                              if(email==null)
                                {
                                  Text("write email")
                                }
                              else
                                {
                                  Text("write password")
                                },
                              Navigator.push(context, MaterialPageRoute(builder: (context) => home()))
                            });
                          },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                              ),
                              child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 20),)),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account"),
                              TextButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => signup()));
                              }, child: Text("sign up")),

                            ],
                          ),
                        )
                                          ],
                    ),
                  ),
                ), ),

              ],
            ),


          ),
        ),
      );
  }
}
