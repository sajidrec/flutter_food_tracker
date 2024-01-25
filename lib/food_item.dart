class FoodItem {
  final String _foodName;
  final int _quantity;
  final DateTime _time;

  FoodItem(this._foodName, this._quantity, this._time);

  get getFoodName => _foodName;

  get getQuantity => _quantity;

  get getTime => _time;
}
