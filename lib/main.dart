import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oyelabs/config/di.dart';
import 'package:oyelabs/config/firebase.dart';
import 'package:oyelabs/core/routes.dart';
import 'package:oyelabs/core/themes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Injections.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411.42857142857144, 843.4285714285714),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Oyelabs',
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}


// RELEASE SHAI
/*
SHA1: CA:E9:C4:14:DE:38:32:DE:1F:3E:34:22:D2:13:CE:A0:22:E5:CC:4C
SHA256: 82:3C:37:09:06:A1:E3:EC:43:03:23:7C:84:A7:BE:93:5B:1E:E0:E9:EA:4F:65:1E:09:39:E6:A0:EC:74:F1:0A
*/

// DEV SHAI
/*
SHA1: 4E:83:3A:A2:82:11:96:0A:D9:BB:EF:0E:8C:CF:B3:BA:AB:B9:BE:75
SHA256: 60:44:A0:AA:87:16:24:FE:79:8D:32:83:DC:E8:80:0F:2C:F1:DE:78:F6:A4:12:C2:03:A6:3D:B5:9D:60:F1:3D
*/