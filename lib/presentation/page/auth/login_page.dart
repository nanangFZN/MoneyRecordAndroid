import 'package:d_info/d_info.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money/config/app_asset.dart';
import 'package:money/config/app_color.dart';
import 'package:money/data/source/source_user.dart';
import 'package:money/presentation/page/auth/register_page.dart';
import 'package:money/presentation/page/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  login()async{
    if (formKey.currentState!.validate()) {
      bool success = await SourceUser.login(emailController.text, passwordController.text);
      if (success) {
        DInfo.dialogSuccess("Login Success");
        DInfo.closeDialog(
          actionAfterClose: (){
            Get.off(()=>HomePage());
          }
        );
        
      }else{
        DInfo.dialogError("Login Falied");
        DInfo.closeDialog();
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.primary,
      body:LayoutBuilder(
        builder:(context,constraints){
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  DView.nothing(),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:30),
                      child: Column(
                        children: [
                          Image.asset(AppAsset.logo),
                          DView.spaceHeight(40),
                          TextFormField(
                            style:TextStyle(
                                color:AppColor.third
                            ),
                            validator: (value)=>value==''?'Please Fiil This Field':null,
                             autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: emailController,
                            decoration:InputDecoration(
                              fillColor: AppColor.secondary,
                              filled:true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none
                              ),
                              hintText: "Email",
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(horizontal:20,vertical:16)
                            )
                          ),
                          DView.spaceHeight(),
                           TextFormField(
                            style: TextStyle(
                              color:AppColor.third
                            ),
                             validator: (value)=>value==''?'Please Fiil This Field':null,
                             autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: passwordController,
                            obscureText: true,
                            decoration:InputDecoration(
                              fillColor: AppColor.secondary,
                              filled:true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none
                              ),
                              hintText: "Password",
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(horizontal:20,vertical:16)
                            )
                          ),
                          DView.spaceHeight(30),
                          Material(
                            color:AppColor.secondary,
                            borderRadius: BorderRadius.circular(30),
                            child:InkWell(
                              onTap: (){login();},
                              borderRadius: BorderRadius.circular(30),
                              child: const Padding(
                                padding: const EdgeInsets.symmetric(horizontal:40,vertical:16),
                                child: Text("Login",
                                style:TextStyle(
                                fontSize:18,
                                fontWeight: FontWeight.bold,
                                color:AppColor.third
                               )
                                ),
                              ),
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16,16,16,20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        const Text("Don't Have Account ?",
                         style:TextStyle(
                            fontSize:16,
                            fontWeight: FontWeight.bold,
                           )
                        ),
                        GestureDetector(
                          onTap:(){
                            Get.to(()=>RegisterPage());
                          },
                          child:const Text(" Register",
                          style:TextStyle(
                            fontSize:16,
                            fontWeight: FontWeight.bold,
                            color:AppColor.fourth
                          )
                          ),
                        )
                      ]
                    ),
                  )
                ]
              ),
            ),
          );
        }
      )
    );
  }
}