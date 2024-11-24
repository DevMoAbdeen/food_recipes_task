import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constant/app_images.dart';
import '../../../../core/extensions/screen_size_extensions.dart';
import '../controller/cubit/splash_cubit.dart';
import '../controller/states/splash_states.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _ballController;
  late AnimationController _logoController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _logoController = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _logoController, curve: Curves.fastOutSlowIn));

    _ballController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _ballController.addListener(() {
      context.read<SplashCubit>().changeValueListener(
        context,
        () {
          _logoController.forward();
          _ballController.stop();
        },
      );
    });
    _ballController.repeat();
  }

  @override
  void dispose() {
    _ballController.dispose();
    _logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColor,
      body: SizedBox(
        height: context.screenHeight(),
        width: context.screenWidth(),
        child: BlocBuilder<SplashCubit, SplashStates>(
          builder: (context, state) {
            final splashCubit = context.read<SplashCubit>();
            return Stack(
              alignment: Alignment.center,
              children: [
                AnimatedPositioned(
                  bottom: splashCubit.bottomVal,
                  duration: const Duration(milliseconds: 800),
                  child: Column(
                    children: [
                      Transform.translate(
                        offset: Offset(0, splashCubit.ballY),
                        child: AnimatedScale(
                          duration: const Duration(milliseconds: 500),
                          scale: splashCubit.times == 3 ? 5 : 1,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 900),
                            width: splashCubit.widthVal,
                            height: splashCubit.heightVal,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).primaryColor.withOpacity(0.8)
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: splashCubit.showShadow,
                        child: Container(
                          width: 50,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: splashCubit.showLogo,
                  child: Center(
                    child: ScaleTransition(
                      scale: _animation,
                      child: Image.asset(
                        AppImages.appLogo,
                        height: context.screenHeight(),
                        width: context.screenWidth(),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
          buildWhen: (previous, current) => current is SplashChangeValues,
        ),
      ),
    );
  }
}
