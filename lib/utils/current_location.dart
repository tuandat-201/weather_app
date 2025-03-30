import 'package:geolocator/geolocator.dart';

Future<Position> getCurrentLocation() async {
  LocationPermission permission;

  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Quyền truy cập vị trí bị từ chối');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Quyền truy cập vị trí bị từ chối vĩnh viễn, ứng dụng không thể yêu cầu cấp quyền');
  }

  return await Geolocator.getCurrentPosition();
}
