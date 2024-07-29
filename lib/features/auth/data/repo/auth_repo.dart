import 'package:single_resturant_app/core/utils/api_services.dart';
import 'package:single_resturant_app/features/auth/data/models/person_model.dart';
import 'package:single_resturant_app/features/auth/data/models/user_model.dart';

class AuthRepo {
  final ApiService apiService;

  AuthRepo(this.apiService);

  Future<bool> register(
      {
      required RegisterDataModel registerData}) async {
    final data = await apiService.postFormData(
      endpoint: 'client/auth/login',
      data: registerData.toJson(),
    );
    return data['status'];
  }
}
