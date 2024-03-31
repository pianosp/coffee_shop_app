import '../models/drinks_model.dart';
import 'api_provider.dart';

class ApiRepository {
  final _apiProvider = ApiProvider();

  //Fetch Drinks List
  Future<List<DrinksModel>> getAllDrinks() {
    return _apiProvider.getAllDrinks();
  }
}

class NetworkError extends Error {}
