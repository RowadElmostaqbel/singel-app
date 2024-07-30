import 'package:single_resturant_app/core/utils/api_services.dart';
import 'package:single_resturant_app/features/auth/data/models/login_data_model.dart';

class LoginRepo {
  final ApiService apiService;

  LoginRepo(this.apiService);

  Future<bool> login(LoginDataModel loginDataModel) async {
    final data = await apiService.post(
      endpoint: 'client/auth/login',
      data: loginDataModel.toJson(),
    );
    return data['status'];
  }
}
