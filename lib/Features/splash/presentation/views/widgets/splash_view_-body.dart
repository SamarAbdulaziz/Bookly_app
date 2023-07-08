import 'package:bookly_app_tharwat/Features/home/presentation/views/home_view.dart';
import 'package:bookly_app_tharwat/Features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:bookly_app_tharwat/constants.dart';
import 'package:bookly_app_tharwat/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin //4
{
  late AnimationController animationController; //animationController 1
  late Animation<Offset> slidingAnimation; //Animation2

  @override
  void initState() {
    super.initState();
    //todo i need to understand it deeply
    initSlidAnimation();
    navigateToHome();
  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetsData.logo),
          SlidingText(slidingAnimation: slidingAnimation),
        ],
      ),
    );
  }

  void initSlidAnimation() {
    animationController = AnimationController(
      vsync: this, //3
      duration: const Duration(seconds: 1),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
            .animate(animationController); //5
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(
            () => const HomeView(),
        transition: Transition.fadeIn,
        duration: kDuration,
      );
    });
  }
}
