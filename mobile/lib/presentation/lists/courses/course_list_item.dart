import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:mobile/logic/models/course.dart';
import 'package:mobile/logic/models/session.dart';
import 'package:mobile/presentation/screens/course_screen.dart';
import '../../widgets/rating.dart';
import 'package:mobile/logic/globals.dart' as globals;

class CourseListItem extends StatelessWidget {
  const CourseListItem({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    String date = DateFormat("dd/MM/yyyy").format(DateTime.now());
    String time = "";

    if (course.author == "Matthias Dupont") {
      time = DateFormat("HH:mm")
          .format(DateTime.now().add(const Duration(hours: 2)));
    } else if (course.author == "Thomas Deblieux") {
      time = DateFormat("HH:mm")
          .format(DateTime.now().add(const Duration(hours: 1)));
    } else if (course.author == "Jean Cotaud") {
      time = DateFormat("HH:mm")
          .format(DateTime.now().add(const Duration(minutes: 10)));
    } else if (course.author == "Pauline Macouin") {
      time = DateFormat("HH:mm")
          .format(DateTime.now().add(const Duration(minutes: 1)));
    }

    return GestureDetector(
        onTap: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: const Text('Voulez-vous réserver ?'),
                  content: Text('Le $date à $time en salle E312'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Non'),
                      child: const Text('Non'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'Oui');
                        globals.user.sessions.insert(
                            0,
                            (Session(
                                name: course.name,
                                author: course.author,
                                dateTime: DateFormat("dd/MM/yyyy HH:mm")
                                    .parse("$date $time"),
                                room: 'E312',
                                picture: course.picture)));
                      },
                      child: const Text('Oui'),
                    ),
                  ],
                )),
        child: Column(children: [
          const SizedBox(height: 20),
          Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Image.asset(course.picture,
                  width: double.infinity, height: 150, fit: BoxFit.fitWidth)),
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            visualDensity: VisualDensity.comfortable,
            title: Text(course.author,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            trailing: Rating(rate: course.rate, rates: course.rates),
            isThreeLine: true,
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text(
                  '${course.name} (${course.level})',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: HexColor('#00AEEF')),
                ),
                const SizedBox(height: 5),
                generateTags(course.tags)
              ],
            ),
            dense: false,
          ),
        ]));
  }
}

Text generateTags(List<String> tags) {
  String text = tags.first;

  tags.forEach((tag) => tag == tags.first ? text += "" : text += " • " + tag);

  return Text(text);
}
