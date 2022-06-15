
import 'package:food_delivery_3/data/api/api_clien.dart';
import 'package:food_delivery_3/utils/app_constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async{
   return await apiClient.get(AppConstants.popularProductUrl);
  }
}










// class PopularProductRepo extends GetxService{
//   final ApiClient apiClient;

//   PopularProductRepo({required this.apiClient});

//   Future<Response> getPopularProductList() async {
//     return await apiClient.get('');

//   }
// }