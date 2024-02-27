abstract class AppLinks {
  // server link
  static const String serverLink = "http://192.168.1.5/fullstoreapp";

  // authentication links
  static const String signUpLink = "$serverLink/delivery/auth/sginup.php";
  static const String loginLink = "$serverLink/delivery/auth/login.php";
  static const String verifyCodeLink =
      "$serverLink/delivery/auth/verifycode.php";
  static const String resendVerifyCodeLink =
      "$serverLink/delivery/auth/resendverifycode.php";
  static const String testLink = "$serverLink/test.php";

  // forget password links
  static const String forgrtPassVerifyCodeLink =
      "$serverLink/delivery/forgetpassword/verifycode.php";
  static const String resetPassLink =
      "$serverLink/delivery/forgetpassword/resetpassword.php";
  static const String checkEmailLink =
      "$serverLink/delivery/forgetpassword/checkemail.php";

//home links
  static const String homeLink = "$serverLink/home.php";
  static const String imageCategoriesLink = "$serverLink/upload/categories";
  static const String imageItemsLink = "$serverLink/upload/items";

// items links
  static const String itemsLink = "$serverLink/items/items.php";

// favorites links
  static const String addToFavoritesLink = "$serverLink/favorite/add.php";
  static const String removeFromFavoritesLink =
      "$serverLink/favorite/remove.php";
  static const String viewFavoritesLink = "$serverLink/favorite/view.php";

// cart links
  static const String addToCartLink = "$serverLink/cart/add.php";
  static const String viewCartLink = "$serverLink/cart/view.php";
  static const String removeFromCartLink = "$serverLink/cart/remove.php";
  static const String deleteFromCartLink = "$serverLink/cart/delete.php";
  static const String getItemCountLink = "$serverLink/cart/getitemcount.php";

// address links
  static const String viewAddressLink = "$serverLink/adress/view.php";
  static const String addAddressLink = "$serverLink/adress/add.php";
  static const String removeAddressLink = "$serverLink/adress/remove.php";
  static const String editAddressLink = "$serverLink/adress/edit.php";
// coupon links
  static const String checkcouponLink = "$serverLink/coupon/checkcoupon.php";

// orders

  static const String ordersViewLink = "$serverLink/delivery/orders/view.php";
  static const String approveOrderLink =
      "$serverLink/delivery/orders/approve.php";
  static const String deliveryDoneLink = "$serverLink/delivery/orders/done.php";
  static const String archivedLink = "$serverLink/delivery/orders/archived.php";
  static const String ordersDetailsViewLink =
      "$serverLink/orders/viewdetails.php";

//notification

  static const String notificationRemoveLink =
      "$serverLink/notification/remove.php";
  static const String notificationviewLink =
      "$serverLink/notification/view.php";
}
