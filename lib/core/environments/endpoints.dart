class Endpoints {
  static const baseUrl = 'https://e-menu-ta-backend.up.railway.app';

  static const account = '/account/';
  static const login = '/account/signin/';
  static const signup = '/account/signup/';
  static const signout = '/account/signout/';
  static const restaurant = '/restaurant';
  static const review = '$restaurant/x/review';
  static const reviewAdd =
      '$restaurant/restoId/review/email/order/orderId/post/';
  static const order = '/restaurant/resId/order/tableId/post/';
  static const orderByRestoId = '/restaurant/resId/order';
  static const orderById = '/restaurant/resId/order/orderId';
  static const orderUpdateOrderStatus =
      '/restaurant/resId/order/orderId/update-status';
  static const orderUpdateMenuStatus =
      '/restaurant/resId/order/orderId/menu/menuId/update-status';
  static const history = '/order-history/';
}
