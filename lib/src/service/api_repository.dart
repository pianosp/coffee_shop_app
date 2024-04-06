import '../models/cart_added_response.dart';
import '../models/cart_items_response';
import '../models/drinks_model.dart';
import '../models/login_response.dart';
import '../models/sign_up_response.dart';
import 'api_provider.dart';

class ApiRepository {
  final _apiProvider = ApiProvider();

  Future<List<DrinksModel>> getAllDrinks() {
    return _apiProvider.getAllDrinks();
  }

  Future<CartAddedResponse> cartAdded(int drinkId, String size, int qty) {
    return _apiProvider.cartAdded(drinkId, size, qty);
  }

  Future<CartItemsResponse> getCartItems() {
    return _apiProvider.getCartItems();
  }

  Future<SignUpResponse> signUp(String name, String email, String password) {
    final result = _apiProvider.signUp(name, email, password);
    return result;
  }

  Future<LoginResponse> login(String email, String password) {
    final result = _apiProvider.login(email, password);
    return result;
  }
}
