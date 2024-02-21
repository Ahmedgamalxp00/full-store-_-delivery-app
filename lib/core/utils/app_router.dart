import 'package:delivery_app/core/middleware/mymiddleware.dart';
import 'package:delivery_app/views/archived_orders_view/archived_orders_view.dart';
import 'package:delivery_app/views/auth_views/forget_password_view.dart';
import 'package:delivery_app/views/auth_views/login_view.dart';
import 'package:delivery_app/views/auth_views/otp_view.dart';
import 'package:delivery_app/views/auth_views/reset_pass_otp_view.dart';
import 'package:delivery_app/views/auth_views/reset_password_view.dart';
import 'package:delivery_app/views/auth_views/success_view.dart';
import 'package:delivery_app/views/home_views/home_view.dart';
import 'package:delivery_app/views/language_view/language_view.dart';
import 'package:delivery_app/views/main_view.dart';
import 'package:delivery_app/views/orders_details_view/orders_details_view.dart';
import 'package:delivery_app/views/orders_view/orders_view.dart';
import 'package:get/get.dart';

class AppRoute {
  static const String splashView = "/splashView";
  static const String loginView = "/loginView";
  static const String signUp = "/signUp";
  static const String languageView = "/languageView";
  static const String forgetPassView = "/forgetPassView";
  static const String otpView = "/otpView";
  static const String forgetPassotpView = "/forgetPassotpView";
  static const String resetPassword = "/resetPassword";
  static const String successView = "/successView";
  static const String homeView = "/homeView";
  static const String mainView = "/mainView";
  static const String itemsView = "/itemsView";
  static const String specialOffersView = "/specialOffersView";
  static const String topSellingView = "/topSellingView";
  static const String productDetailesView = "/ProductDetailesView";
  static const String favoriteView = "/FavoriteView";
  static const String profileView = "/ProfileView";
  static const String cartView = "/cartView";
  static const String addressView = "/addressView";
  static const String addAddressView = "/addAddressView";
  static const String chechOutView = "/ChechOutView";
  static const String ordersView = "/ordersView";
  static const String ordersDetailsView = "/ordersDetailsView";
  static const String archivedOrdersView = "/archivedOrdersView";
  static const String notificationView = "/NotificationView";
  static const String myTest = "/mytest";
}

List<GetPage<dynamic>> myRoutes = [
  // GetPage(name: '/', page: () => const MyTest()),
  GetPage(
    name: '/',
    page: () => const LanguageView(),
    middlewares: [MyMiddlewalre()],
  ),
  GetPage(name: AppRoute.loginView, page: () => const LoginView()),
  GetPage(name: AppRoute.forgetPassView, page: () => const ForgetPassView()),
  GetPage(name: AppRoute.otpView, page: () => const OtpView()),
  GetPage(
      name: AppRoute.forgetPassotpView, page: () => const ResetPassOtpView()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successView, page: () => const SuccessView()),
  GetPage(name: AppRoute.homeView, page: () => const HomeView()),
  GetPage(name: AppRoute.mainView, page: () => const MainView()),
  GetPage(
      name: AppRoute.ordersDetailsView, page: () => const OrdersDetailsView()),
  GetPage(name: AppRoute.ordersView, page: () => const OrdersView()),
  // GetPage(name: AppRoute.itemsView, page: () => const ItemsView()),
  // GetPage(name: AppRoute.topSellingView, page: () => const TopSellingView()),
  // GetPage(
  //     name: AppRoute.specialOffersView, page: () => const SpecialOffersView()),
  // GetPage(
  //     name: AppRoute.productDetailesView,
  //     page: () => const ProductDetailesView()),
  // GetPage(name: AppRoute.favoriteView, page: () => const FavoriteView()),
  // GetPage(name: AppRoute.cartView, page: () => const CartView()),
  // GetPage(name: AppRoute.profileView, page: () => const ProfileView()),
  // GetPage(name: AppRoute.addressView, page: () => const AddressView()),
  // GetPage(name: AppRoute.addAddressView, page: () => const AddAddressView()),
  // GetPage(name: AppRoute.chechOutView, page: () => const ChechOutView()),

  GetPage(
      name: AppRoute.archivedOrdersView,
      page: () => const ArchivedOrdersView()),

  // GetPage(
  //     name: AppRoute.notificationView, page: () => const NotificationView()),
];
