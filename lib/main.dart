import 'package:bookly_app_tharwat/constants.dart';
import 'package:bookly_app_tharwat/core/utils/app_router.dart';
import 'package:bookly_app_tharwat/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // Dio dio=Dio();
  // ApiService apiService=ApiService(dio);
  // HomeRepoImplementation mm=HomeRepoImplementation(apiService);
  // mm.fetchNewestBooks() ;
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      //themeMode: ThemeMode.dark,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
      routerConfig: AppRouter.router,
      // home: const SplashView(),
    );
  }
}
