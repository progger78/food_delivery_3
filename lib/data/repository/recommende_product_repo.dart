import 'package:get/get.dart';

import '../../utils/utils.dart';
import '../api/api_clien.dart';

class RecommendedProductRepo extends GetxService{
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async{
   return await apiClient.get(AppConstants.recommendedProductUrl);
  }
}

