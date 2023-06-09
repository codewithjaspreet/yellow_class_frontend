import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ivy_contact/views/splash_screen.dart';

void main() async {
  //
  // WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // String token = prefs.getString('token')!;
  runApp( MyApp() );
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key , required this.token } );



  // final String token;

  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, a) {
        return   GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),

         // home: JwtDecoder.isExpired(token) == false ? ContactListing(token: token) : Login(),
         //  home: JwtDecoder.isExpired(token) == false ? ContactListing(token: token) : SplashScreen()
          //
          // (),
          // home: SplashScreen(),

        );
      },
    );
  }
}
