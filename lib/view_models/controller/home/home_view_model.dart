import 'package:flutter_mvvm/model/home/user_list.dart';
import 'package:get/get.dart';

import '../../../repository/home_repository/home_repository.dart';
import '../../../response/status.dart';

class HomeController extends GetxController {
  //
  final _api = HomeRepository();
  //
  final rxRequestStatus = Status.LOADING.obs;
  final UserList = UserListModel().obs;
  RxString error = ''.obs;
//
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(UserListModel _value) => UserList.value = _value;
  void setError(String _value) => error.value = _value;
  //

//
  void userListApi() {
    //
    _api.userListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  //
  void refreshApi() {
    setRxRequestStatus(Status.LOADING);

    //
    _api.userListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
