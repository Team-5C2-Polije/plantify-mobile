class ApiConstant {
  static const String baseUrl = 'http://192.168.34.152:5000/';
  // auth
  static const String authEndpoint = 'auth';
  static const String addUserDeviceEndpoint = 'add_device';
  static const String deleteUserDeviceEndpoint = 'delete_device';
  // device
  static const String createDeviceEndpoint = 'device/create_device';
  static const String updateDeviceEndpoint = 'device/update_device';
  static const String updateSensorsEndpoint = 'device/update_sensors';
  static const String deleteDeviceEndpoint = 'device/delete_device/';
  static const String myDeviceEndpoint = 'device/my';
  static const String detailDeviceEndpoint = 'device/';
  static const String getPhotosEndpoint = 'device/';
  static const String addPhotoEndpoint = 'device/add_photo';
  static const String addPhotoByTokenEndpoint = 'device/add_photo_by_token';
  static const String getDetailPhotoEndpoint = 'device/';
  static const String getHistoriesEndpoint = 'device/';
  static const String addHistoryEndpoint = 'device/add_history';
  static const String addScheduleEndpoint = 'device/add_schedule';
  static const String updateScheduleEndpoint = 'device/update_schedule';
  static const String deleteScheduleEndpoint = 'device/delete_schedule';
  // notif
  static const String sendNotificationEndpoint = 'notif/send';
}
