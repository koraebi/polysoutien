import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mobile/logic/blocs/session/session_bloc.dart';
import 'package:mobile/logic/models/session.dart';
import 'package:intl/intl.dart';
import 'package:mobile/logic/globals.dart' as globals;
import 'package:mobile/presentation/lists/sessions/sessions_list.dart';

class SessionListItem extends StatelessWidget {
  SessionListItem({Key? key, required this.session}) : super(key: key);

  final Session session;

  @override
  Widget build(BuildContext context) {
    double opacity = 1.0;

    if (session.dateTime.isBefore(DateTime.now())) {
      opacity = 0.5;
    }

    return Opacity(
        opacity: opacity,
        child: ListTile(
          contentPadding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
          visualDensity: VisualDensity.comfortable,
          title: Text('${session.author} - ${session.name}',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          leading: Container(
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(session.picture), fit: BoxFit.cover))),
          trailing: const Icon(Icons.chevron_right, color: Colors.black),
          isThreeLine: true,
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Text(
                'Le ${DateFormat("dd/MM/yyyy").format(session.dateTime)} à ${DateFormat("HH:mm").format(session.dateTime)}',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: HexColor('#00AEEF')),
              ),
              const SizedBox(height: 5),
              Text('Salle ${session.room}'),
              const SizedBox(height: 5),
              Container(child: const Divider(color: Colors.grey))
            ],
          ),
          dense: true,
        ));
  }
}
