import 'package:flutter_mvvm/model/home/user_list.dart';
import 'package:flutter_mvvm/model/login/user_model.dart';

import '../../network/network_api_services.dart';
import '../../resources/app_url/app_url.dart';

class HomeRepository {
  //
  final _apiServices = NetworkApiServices();

  //
  Future<UserListModel> userListApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.userListApi);
    return UserListModel.fromJson(response);
  }
}
