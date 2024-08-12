import 'package:single_resturant_app/core/utils/api_services.dart';
import 'package:single_resturant_app/features/auth/data/models/register_data_model.dart';

class AuthRepo {
  final ApiService apiService;

  AuthRepo(this.apiService);

  Future<bool> register(
      {
      required RegisterDataModel registerData}) async {
    final data = await apiService.postFormData(
      endpoint: 'client/auth/register',
      data: registerData.toJson(),
    );
    return data['status'];
  }
}
