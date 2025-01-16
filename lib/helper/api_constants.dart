class EndPoint {
  static String userToken =
      '39|gIHV0rPD4C8Iqm9Bxa2gDULOGlrhaliqpd304080eb7dce59';

  static String url = 'http://192.168.154.233:8000';
  static String loginUrl = '$url/api/login/';
  static String registerUrl = '$url/api/register';
  static String logoutUrl = '$url/api/logout/';
  static String profileUrl = '$url/api/getprofile';
  static String storeUrl = '$url/api/getstore';
  static String productUrl = '$url/api/getproducts';
  static String searchStoreUrl = '$url/api/search';
  static String searchProductUrl = '$url/api/searchproduct';
  static String storeOrderUrl = '$url/api/storeorder';
  static String updateOrderUrl = '$url/api/updateOrder';

  static String confirmOrderUrl = '$url/api/confirmOrder';
  static String cancelOrderUrl = '$url/api/cancelOrder';
  static String getOrderUrl = '$url/api/getorders';
}
