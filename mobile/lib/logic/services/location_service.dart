// ignore_for_file: unnecessary_new
import 'package:mobile/logic/globals.dart' as globals;
import 'package:location/location.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile/logic/models/session.dart';
import 'package:intl/intl.dart';
import 'package:mobile/logic/services/notification_service.dart';

class LocationService {
  static final LocationService _locationService = LocationService._internal();

  factory LocationService() {
    return _locationService;
  }

  LocationService._internal();

  Future<void> init() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    location.enableBackgroundMode(enable: true);

    location.onLocationChanged.listen((LocationData currentLocation) {
      Distance distance = const Distance();

      num distanceFromPolytech = distance(
          new LatLng(43.616121, 7.0714597),
          new LatLng(
              currentLocation.latitude ?? 0, currentLocation.longitude ?? 0));

      globals.currentPosition = new LatLng(
          currentLocation.latitude ?? 0, currentLocation.longitude ?? 0);

      Session currentSession = globals.user.sessions.first;

      if (DateFormat("dd/MM/yyyy").format(DateTime.now()) !=
          DateFormat("dd/MM/yyyy").format(currentSession.dateTime)) return;

      int minutesLeft =
          currentSession.dateTime.difference(DateTime.now()).inMinutes;

      print('Distance from Polytech: $distanceFromPolytech');
      print('Minutes left: $minutesLeft');

      if (minutesLeft > 60 && distanceFromPolytech > 200) {
        globals.scenario = 0;
      } else if (distanceFromPolytech > 200 && minutesLeft <= 60) {
        globals.scenario = 1;
      } else if (distanceFromPolytech <= 200 && minutesLeft <= 30) {
        globals.scenario = 2;
      }

      if (globals.canNotif && distanceFromPolytech >= 50 && minutesLeft == 0) {
        NotificationService().showNotification(
            "Vous êtes en retard !",
            "Retrouvez vite " +
                currentSession.author +
                " en salle " +
                currentSession.room);
      }
    });
  }
}
