// Flutter imports:
import 'package:flutter/material.dart';
import 'package:wegift/src/app/screens/onboarding.dart';
import 'package:wegift/src/app/screens/splash.dart';
import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';
import 'package:wegift/src/auth/screens/login/otp_verification.dart';
import 'package:wegift/src/auth/screens/signup/registration.dart';
import 'package:wegift/src/auth/web_view.dart/screens/web_view_screen.dart';
import 'package:wegift/src/bottom_nav_bar/screen/main_page_view.dart';
import 'package:wegift/src/friends/invite.dart';
import 'package:wegift/src/friends/screens/followers.dart';
import 'package:wegift/src/friends/screens/following.dart';
import 'package:wegift/src/friends/screens/friend_profile.dart';
import 'package:wegift/src/home/screens/home.dart';
import 'package:wegift/src/profile/screens/contact_us.dart';
import 'package:wegift/src/profile/screens/profile_setting.dart';
import 'package:wegift/src/settings/about_privacy/about.dart';
import 'package:wegift/src/settings/about_privacy/privacy_policy.dart';
import 'package:wegift/src/settings/about_privacy/terms_of_services.dart';
import 'package:wegift/src/settings/events/event_details_screen.dart';
import 'package:wegift/src/settings/events/events.dart';
import 'package:wegift/src/settings/events/personal_events.dart';
import 'package:wegift/src/settings/notifications/notification_frequency.dart';
import 'package:wegift/src/settings/notifications/notifications.dart';
import 'package:wegift/src/settings/notifications/notifications_toggler.dart';
import 'package:wegift/src/settings/settings.dart';
import 'package:wegift/src/shop/screens/gift_cards.dart';
import 'package:wegift/src/shop/screens/popular_gifts.dart';
import 'package:wegift/src/shop/screens/products_catalogue.dart';
import 'package:wegift/src/shop/screens/stores.dart';
// Project imports:

class AppRouter {
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String otpVerification = '/otp_verification';
  static const String registration = '/registration';
  static const String mainPageView = '/mainPageView';
  static const String friendProfile = '/friendProfile';
  static const String events = '/events';
  static const String followers = '/followers';
  static const String following = '/following';
  static const String invite = '/invite';
  static const String settings = '/settings';
  static const String personalEvent = '/personalEvent';
  static const String notifications = '/notifications';
  static const String about = '/about';
  static const String contactUs = '/contactUs';
  static const String profileSetting = '/profileSetting';
  static const String eventDetailsScreen = '/eventDetailsScreen';
  static const String notificationsToggler = '/notificationsToggler';
  static const String notificationFrequency = '/notificationFrequency';
  static const String privacyPolicy = '/privacyPolicy';
  static const String termsOfServices = '/termsOfServices';
  static const String popularGift = '/popularGift';
  static const String productsCatalogue = '/productsCatalogue';
  static const String stores = '/stores';
  static const String giftCards = '/giftCards';
  static const String giftCardsScreen = '/giftCardsScreen';
  static const String webViewScreen = '/webViewScreen';
  static const String splash = '/';

  static Route onGenerateRoute(RouteSettings setting, BuildContext context) {
    switch (setting.name) {
      case onboarding:
        return MaterialPageRoute(builder: (context) => const Onboarding());

      case otpVerification:
        final OtpVerificationArgs args =
            setting.arguments as OtpVerificationArgs;
        return MaterialPageRoute(
            settings: setting,
            builder: ((context) => OtpVerification(args: args)));
      case home:
        return MaterialPageRoute(
          builder: (context) => const Home(),
          settings: setting,
        );
      case registration:
        return MaterialPageRoute(
          builder: (context) => Registration(),
          settings: setting,
        );
      case mainPageView:
        return MaterialPageRoute(
          builder: (context) => MainPageView(),
          settings: setting,
        );

      case friendProfile:
        final user = setting.arguments as WeGiftUser;
        return MaterialPageRoute(
          builder: (context) => FriendProfile(user: user),
          settings: setting,
        );
      case events:
        final EventsArgs args = setting.arguments as EventsArgs;
        return MaterialPageRoute(
          builder: (context) => Events(args: args),
          settings: setting,
        );
      case followers:
        final FollowersArgs args = setting.arguments as FollowersArgs;
        return MaterialPageRoute(
          builder: (context) => Followers(args: args),
          settings: setting,
        );
      case following:
        final FollowingArgs args = setting.arguments as FollowingArgs;
        return MaterialPageRoute(
          builder: (context) => Following(args: args),
          settings: setting,
        );
      case invite:
        return MaterialPageRoute(
          builder: (context) => const Invite(),
          settings: setting,
        );
      case settings:
        return MaterialPageRoute(
          builder: (context) => const Settings(),
          settings: setting,
        );
      case personalEvent:
        return MaterialPageRoute(
          builder: (context) => const PersonalEvent(),
          settings: setting,
        );
      case notifications:
        return MaterialPageRoute(
          builder: (context) => const Notifications(),
          settings: setting,
        );
      case about:
        return MaterialPageRoute(
          builder: (context) => const About(),
          settings: setting,
        );
      case contactUs:
        return MaterialPageRoute(
          builder: (context) => const ContactUs(),
          settings: setting,
        );
      case profileSetting:
        return MaterialPageRoute(
          builder: (context) => ProfileSetting(),
          settings: setting,
        );
      case eventDetailsScreen:
        final EventDetailsArgs args = setting.arguments as EventDetailsArgs;
        return MaterialPageRoute(
          builder: (context) => EventDetailScreen(
            args: args,
          ),
          settings: setting,
        );
      case notificationsToggler:
        final args = setting.arguments as NotificationsTogglerArgs;
        return MaterialPageRoute(
          builder: (context) => NotificationsToggler(args: args),
          settings: setting,
        );
      case notificationFrequency:
        return MaterialPageRoute(
          builder: (context) => const NotificationFrequency(),
          settings: setting,
        );
      case privacyPolicy:
        return MaterialPageRoute(
          builder: (context) => const PrivacyPolicy(),
          settings: setting,
        );
      case termsOfServices:
        return MaterialPageRoute(
          builder: (context) => const TermsOfServices(),
          settings: setting,
        );
      case popularGift:
        return MaterialPageRoute(
          builder: (context) => const PopularGift(),
          settings: setting,
        );
      case productsCatalogue:
        final ProductsCatalogueArgs args =
            setting.arguments as ProductsCatalogueArgs;
        return MaterialPageRoute(
          builder: (context) => ProductsCatalogue(
            args: args,
          ),
          settings: setting,
        );
      case stores:
        final args = setting.arguments as StoreScreenArgs;
        return MaterialPageRoute(
          builder: (context) => Stores(
            storeScreenArgs: args,
          ),
          settings: setting,
        );
      case giftCards:
        return MaterialPageRoute(
          builder: (context) => const GiftCards(),
          settings: setting,
        );
      case giftCardsScreen:
        return MaterialPageRoute(
          builder: (context) => const GiftCards(),
          settings: setting,
        );
      case webViewScreen:
        final args = setting.arguments as WebViewScreenArgs;
        return MaterialPageRoute(
          builder: (context) => WebViewScreen(args: args),
          settings: setting,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Splash(),
          settings: setting,
        );
    }
  }
}
