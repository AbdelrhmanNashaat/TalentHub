import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hire_me/features/home/presentation/views/search_view.dart';
import '../../../../../core/common/functions.dart';
import '../../../../../core/database/cache_helper.dart';
import '../../../../../core/database/shared_preferences_keys.dart';
import '../../../../../core/services/services_locator.dart';
import '../../../../../core/utils/text_styles.dart';
import '../on_boarding_view.dart';

class SplashTextWidget extends StatelessWidget {
  const SplashTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Animate(
      autoPlay: true,
      effects: [
        FadeEffect(duration: 1000.ms),
      ],
      onComplete: (controller) {
        bool hasLogin = getIt<CacheHelper>()
                .getData(key: getIt.get<SharedPreferencesKeys>().isLogin) ??
            false;
        CommonFunctions().navWithReplacement(
          context: context,
          pageName: hasLogin ? const SearchView() : const OnBoardingView(),
        );
      },
      child: Text(
        'TalentHub',
        style: CustomTextStyles.style30Bold.copyWith(fontSize: 45),
      ),
    );
  }
}
