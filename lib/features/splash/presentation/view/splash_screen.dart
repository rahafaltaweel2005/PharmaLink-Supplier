import 'dart:async';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/constant/app_const.dart';
import '../../../../core/constant/color_const.dart';
import '../../../../core/constant/svg_const.dart';
import '../../../../core/storage/secure_storage_helper.dart';
import '../../../auth/presentation/login/view/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

  Future<void> checkLogin() async{
    await Future.delayed(Duration(seconds: 4) );
    final token = await SecureStorageHelper.read(key: AppConst.accessTokenKey);
    if(!mounted) return;
    if(token == null || token.isEmpty){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
      return;
    }
    final role = await SecureStorageHelper.read(key: AppConst.roleKey);
    if (role == 'admin') {
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (_) => AdminScreen(),
      //   ),
      // );
    } else if (role == 'pharmacist') {
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (_) => PharmacistScreen(),
      //   ),
      // );
    } else if (role == 'supplier') {
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (_) => SupplierScreen(),
      //   ),
      // );
    }else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => LoginScreen(),
        ),
      );
    }
  }


  @override
  void initState() {
    super.initState();
      checkLogin();
  }



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            const Spacer(flex: 2),

            Container(
              width: 140,
              height: 140,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 3,
                  color: isDarkMode ? ColorConst.primary : Colors.white,
                ),
                color: isDarkMode ? Colors.transparent : Colors.white,
              ),
              child: SvgPicture.asset(
                SvgConst.pharmaLinkLogo,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 24),

            Text(
              "PharmaLink",
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontFamily: 'Newsreader',
                fontWeight: FontWeight.w700,
                fontSize: 38,
                color: isDarkMode
                    ? ColorConst.tertiary
                    : theme.colorScheme.primary,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "ELEVATED CARE SYSTEMS",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontFamily: 'HankenGrotesk',
                fontWeight: FontWeight.w500,
                fontSize: 13,
                letterSpacing: 2,
                color: isDarkMode
                    ? ColorConst.tertiary.withValues(alpha: 0.5)
                    : ColorConst.textDark.withValues(alpha: 0.6),
              ),
            ),
            const Spacer(flex: 2),
            LoadingAnimationWidget.waveDots(
              color: isDarkMode
                  ? ColorConst.tertiary
                  : theme.colorScheme.primary,
              size: 26,
            ),
            Text(
              "INITIALIZING SECURE VAULT",
              textAlign: TextAlign.center,
              style: theme.textTheme.labelLarge?.copyWith(
                fontFamily: 'HankenGrotesk',
                fontWeight: FontWeight.w600,
                fontSize: 11,
                letterSpacing: 1.5,
                color: isDarkMode
                    ? ColorConst.tertiary.withValues(alpha: 0.5)
                    : ColorConst.textDark.withValues(alpha: 0.6),
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
