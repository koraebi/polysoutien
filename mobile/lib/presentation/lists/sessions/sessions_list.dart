import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/logic/blocs/session/session_bloc.dart';
import 'session_list_item.dart';

class SessionsList extends StatefulWidget {
  @override
  _SessionsListState createState() => _SessionsListState();
}

class _SessionsListState extends State<SessionsList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionBloc, SessionState>(builder: (context, state) {
      if (state.sessions.isEmpty) {
        return const Center(child: Text('no sessions'));
      }
      return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                child: SessionListItem(session: state.sessions[index]),
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

                                      state.sessions.removeWhere((element) =>
                                          element.name ==
                                          state.sessions[index].name);

                                      setState(() {});
                                    },
                                    child: const Text('Oui'),
                                  ),
                                ],
                              ))
                    });
          },
          itemCount: state.sessions.length,
          controller: _scrollController);
    });
  }
}
