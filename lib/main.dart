import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:money/config/app_color.dart';
import 'package:money/config/session.dart';
import 'package:money/data/model/user.dart';
import 'package:money/presentation/page/auth/login_page.dart';
import 'package:money/presentation/page/home_page.dart';
import 'package:intl/intl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
 //initializeDateFormatting('id_ID').then((value) => 
 runApp(const MyApp());
 //);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData.light().copyWith(
        primaryColor: AppColor.primary,
        colorScheme: const ColorScheme.light(
          primary: AppColor.primary,
          secondary: AppColor.secondary
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.primary,
          foregroundColor: Colors.white
        )
      ),
      home:FutureBuilder(
        future:Session.getUser(),
        builder: (context,AsyncSnapshot<User> snapshot){
            if (snapshot.data != null && snapshot.data!.idUser != null ) {
              return const HomePage();
            }
            return const LoginPage();
        }
        )
    );
  }
}