class EndPoint {
  static String url = 'http://192.168.127.233:8000';
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
  static String cancelOrderUrl = '$url/api/cancelOrde';

  static String confirmOrderUrl = '$url/api/confirmOrder';
  static String getOrderUrl = '$url/api/getorders';
}
