import 'package:d_info/d_info.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money/data/source/source_user.dart';
import 'package:money/presentation/page/home_page.dart';

import '../../../config/app_asset.dart';
import '../../../config/app_color.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  register()async{
    if (formKey.currentState!.validate()) {
      await SourceUser.register(
        nameController.text,
        emailController.text,
        passwordController.text);
     
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
                           DView.spaceHeight(),
                          TextFormField(
                            style:const TextStyle(
                                color:AppColor.third
                            ),
                            validator: (value)=>value==''?'Please Fiil This Field':null,
                             autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: nameController,
                            decoration:InputDecoration(
                              fillColor: AppColor.secondary,
                              filled:true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none
                              ),
                              hintText: "Name",
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(horizontal:20,vertical:16)
                            )
                          ),
                          DView.spaceHeight(),
                          TextFormField(
                            style:const TextStyle(
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
                              onTap: (){register();},
                              borderRadius: BorderRadius.circular(30),
                              child: const Padding(
                                padding: const EdgeInsets.symmetric(horizontal:40,vertical:16),
                                child: Text("Register",
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
                        const Text("Already have an account ?",
                         style:TextStyle(
                            fontSize:16,
                            fontWeight: FontWeight.bold,
                           )
                        ),
                        GestureDetector(
                          onTap:(){
                            Get.back();
                          },
                          child:const Text(" Sign In",
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