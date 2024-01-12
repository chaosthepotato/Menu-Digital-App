String formatPrice(int price) {
  final priceString = price.toString();
  final priceLength = priceString.length;

  if (priceLength <= 3) {
    return 'Rp $priceString';
  } else if (priceLength <= 6) {
    return 'Rp ${priceString.substring(0, priceLength - 3)}.${priceString.substring(priceLength - 3)}';
  } else {
    return 'Rp ${priceString.substring(0, priceLength - 6)}.${priceString.substring(priceLength - 6, priceLength - 3)}.${priceString.substring(priceLength - 3)}';
  }
}
