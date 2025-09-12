class NoteDiscount {
  num discountTotalItem = 0;
  num discountTotalAllItem = 0;

  void changeDiscountTotalItem({required num value}) {
    discountTotalItem = value;
  }

  void changeDiscountTotalAllItem({required num value}) {
    discountTotalAllItem = value;
  }
}