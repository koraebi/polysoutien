import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile/logic/blocs/session/session_bloc.dart';
import 'package:mobile/logic/models/session.dart';
import 'package:mobile/presentation/lists/sessions/sessions_list.dart';
import 'package:mobile/logic/globals.dart' as globals;

class SessionsScreen extends StatefulWidget {
  @override
  _SessionsScreenState createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  @override
  Widget build(BuildContext context) {
    Session currentSession = globals.user.sessions.first;

    switch (globals.scenario) {
      case 1:
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 5,
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(43.616121, 7.0714597),
                    zoom: 13.0,
                  ),
                  layers: [
                    TileLayerOptions(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c'],
                    ),
                    MarkerLayerOptions(
                      markers: [
                        Marker(
                          width: 50.0,
                          height: 50.0,
                          point: LatLng(43.616121, 7.0714597),
                          builder: (ctx) => Container(
                            child: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/pictures/polysoutien.png"),
                                        fit: BoxFit.fill))),
                          ),
                        ),
                        Marker(
                          width: 80.0,
                          height: 80.0,
                          point: globals.currentPosition,
                          builder: (ctx) => Container(
                            child: Icon(Icons.account_circle_sharp,
                                color: HexColor('#00AEEF'), size: 50),
                          ),
                        ),
                        Marker(
                          width: 50.0,
                          height: 50.0,
                          point: LatLng(43.639482, 7.052839),
                          builder: (ctx) => Container(
                            child: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image:
                                            AssetImage(currentSession.picture),
                                        fit: BoxFit.cover))),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            Expanded(
                child: GestureDetector(
                    onTap: () => {
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    title: const Text(
                                        'Voulez-vous annuler ce rendez-vous ?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Non'),
                                        child: const Text('Non'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context, 'Oui');

                                          globals.user.sessions.removeWhere(
                                              (element) =>
                                                  element.name ==
                                                  currentSession.name);
                                          globals.scenario = 0;

                                          setState(() {});
                                        },
                                        child: const Text('Oui'),
                                      ),
                                    ],
                                  ))
                        },
                    child: ListTile(
                      contentPadding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                      visualDensity: VisualDensity.comfortable,
                      title: Text(
                          '${currentSession.author} - ${currentSession.name}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      leading: Container(
                          width: 90.0,
                          height: 90.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(currentSession.picture),
                                  fit: BoxFit.cover))),
                      trailing:
                          const Icon(Icons.chevron_right, color: Colors.black),
                      isThreeLine: true,
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          Text(
                            'Le ${DateFormat("dd/MM/yyyy").format(currentSession.dateTime)} à ${DateFormat("HH:mm").format(currentSession.dateTime)}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: HexColor('#00AEEF')),
                          ),
                          const SizedBox(height: 5),
                          Text('Salle ${currentSession.room}'),
                          const SizedBox(height: 5)
                        ],
                      ),
                      dense: true,
                    )))
          ],
        );

      case 2:
        return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 2,
                child: Image(
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(
                      'https://www.afgc.asso.fr/app/uploads/2020/02/Plan-du-Campus-SophiaTech.png'),
                ),
              ),
              Expanded(
                  child: Container(
                      color: Colors.white,
                      child: GestureDetector(
                          onTap: () => {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: const Text(
                                              'Voulez-vous annuler ce rendez-vous ?'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, 'Non'),
                                              child: const Text('Non'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context, 'Oui');

                                                globals.user.sessions
                                                    .removeWhere((element) =>
                                                        element.name ==
                                                        currentSession.name);
                                                globals.scenario = 0;

                                                setState(() {});
                                              },
                                              child: const Text('Oui'),
                                            ),
                                          ],
                                        ))
                              },
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                    width: (MediaQuery.of(context).size.width),
                                    height: 200,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Salle ${currentSession.room}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: HexColor('#00AEEF')),
                                          ),
                                          const SizedBox(height: 10),
                                          const Text(
                                            'Le batiment est en haut des escaliers à droite. Deuxième étage.',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ])),
                                Container(
                                    width: (MediaQuery.of(context).size.width),
                                    height: 200,
                                    child: Image(
                                        fit: BoxFit.fitHeight,
                                        image: NetworkImage(
                                            'https://www.departement06.fr/documents/_processed_/1/3/csm_cg06-avotreservice-education_sophiatech4_b9f7a63767.jpg'))),
                                Container(
                                    width: (MediaQuery.of(context).size.width),
                                    height: 200,
                                    child: Image(
                                        fit: BoxFit.fitHeight,
                                        image: NetworkImage(
                                            'https://www.departement06.fr/documents/A-votre-service/Education/enseignement-superieur-et-recherche/cg06-avotreservice-education_sophiatech9.jpg'))),
                                Container(
                                    width: (MediaQuery.of(context).size.width),
                                    height: 200,
                                    child: Image(
                                        fit: BoxFit.fitHeight,
                                        image: NetworkImage(
                                            'https://www.departement06.fr/documents/A-votre-service/Education/enseignement-superieur-et-recherche/cg06-avotreservice-education_sophiatech12.jpg')))
                              ])))),
            ]);

      default:
        return Container(
            color: Colors.white,
            child: BlocProvider(
              create: (_) => SessionBloc()..add(GetSessions()),
              child: SessionsList(),
            ));
    }
  }
}
