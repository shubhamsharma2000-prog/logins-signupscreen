import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



import 'login.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController otp = TextEditingController();
  EmailAuth emailAuth =  new EmailAuth(sessionName: "Sample session");

  void sendOtp() async {
    bool result = await emailAuth.sendOtp(
        recipientMail: email.value.text, otpLength: 5
    );
  }

  void validateOpt() async {
    var res = emailAuth.validateOtp(
        recipientMail: email.value.text,
        userOtp: otp.value.text);
    if (res) {
      print("Otp verified");
    }
    else {
      print("invalid otp");
    }
  }
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            decoration: BoxDecoration(
              color: Colors.brown.withOpacity(0.7),
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
                      Text("My Signup",style: TextStyle(
                        fontWeight:FontWeight.w700,
                        fontSize: 46.0,
                        color: Colors.black.withOpacity(0.6),
                      ),),
                      Text("Never Loose Hope",
                        style: TextStyle(color: Colors.black.withOpacity(0.6),
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
                          controller: username,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.3),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            hintText: "User Name",
                            prefixIcon: Icon(Icons.man_2_outlined,color: Colors.black,),
                          ),
                        ),
                        SizedBox(height: 15,),
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
                            FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text,).then((value) => {
                              Text("sign up successfull",style: TextStyle(color: Colors.red),),
                              Navigator.push(context, MaterialPageRoute(builder: (context) => login()))
                            });


                          },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.brown.withOpacity(0.6),
                              ),
                              child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 20),)),
                        ),
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

