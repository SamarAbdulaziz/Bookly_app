import 'package:bookly_app_tharwat/Features/home/data/repos/home_repo_impll.dart';
import 'package:bookly_app_tharwat/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_tharwat/Features/home/presentation/views_model(manager)/fetured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app_tharwat/Features/home/presentation/views_model(manager)/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app_tharwat/constants.dart';
import 'package:bookly_app_tharwat/core/utils/app_router.dart';
import 'package:bookly_app_tharwat/core/utils/service_locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async {
  // Dio dio=Dio();
  // ApiService apiService=ApiService(dio);
  // HomeRepoImplementation mm=HomeRepoImplementation(apiService);
  // mm.fetchNewestBooks() ;
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);

  setupServiceLocator();
  runApp(const BooklyApp());
  }

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeatutredBooksCubit(getIt.get<HomeRepoImplementation>())
                ..fetchFeatureBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt.get<HomeRepoImplementation>())
                ..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
        // theme: ThemeData(
        //   scaffoldBackgroundColor: kPrimaryColor,
        //   textTheme:
        //       GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        // ),
        routerConfig: AppRouter.router,
        // home: const SplashView(),
      ),
    );
  }
}
