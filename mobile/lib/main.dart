import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/logic/models/session.dart';
import 'package:mobile/presentation/screens/root_screen.dart';
import 'logic/navigation/navigation_cubit.dart';
import 'package:mobile/logic/globals.dart' as globals;
import 'logic/services/location_service.dart';
import 'logic/services/notification_service.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() async {
  globals.user.sessions.add(Session(
      name: "Adaptation des IHMs",
      author: 'Sabri Habib',
      dateTime: DateFormat("dd/MM/yyyy HH:mm").parse("11/02/2022 12:30"),
      room: 'E312',
      picture: 'assets/pictures/informatique.jpg'));

  globals.user.sessions.add(Session(
      name: "Adaptation des IHMs",
      author: 'Sabri Habib',
      dateTime: DateFormat("dd/MM/yyyy HH:mm").parse("04/02/2022 12:30"),
      room: 'E312',
      picture: 'assets/pictures/informatique.jpg'));

  WidgetsFlutterBinding.ensureInitialized();

  await NotificationService().init();

  await LocationService().init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationCubit>(
      create: (context) => NavigationCubit(),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: RootScreen(),
      ),
    );
  }
}
