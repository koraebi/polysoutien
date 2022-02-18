library globals;

import 'package:latlong2/latlong.dart';

import 'models/user.dart';

User user = new User(
    name: 'Sabri Habib',
    sessions: [],
    level: 'M2',
    categories: ['Informatique']);

int scenario = 0;

bool canNotif = true;

LatLng currentPosition = LatLng(0, 0);
