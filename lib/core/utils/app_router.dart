import 'package:bookly_app_tharwat/Features/home/presentation/views/book_detail_view.dart';
import 'package:bookly_app_tharwat/Features/home/presentation/views/home_view.dart';
import 'package:bookly_app_tharwat/Features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kHomeView='/HomeView';
  static const String kBookDetailsView='/BookDetailsView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => const BookDetailsView(),
      )
    ],
  );
}
