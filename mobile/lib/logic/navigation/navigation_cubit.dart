import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'constants/nav_bar_items.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavbarItem.courses, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.courses:
        emit(NavigationState(NavbarItem.courses, 0));
        break;
      case NavbarItem.categories:
        emit(NavigationState(NavbarItem.categories, 1));
        break;
      case NavbarItem.sessions:
        emit(NavigationState(NavbarItem.sessions, 2));
        break;
      case NavbarItem.account:
        emit(NavigationState(NavbarItem.account, 3));
        break;
    }
  }
}
