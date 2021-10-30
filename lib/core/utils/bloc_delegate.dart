import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocDelegate extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('${transition.currentState} -> ${transition.nextState} : ${transition.event}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.toString()} : ${change.toString()}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print("Error ${error.toString()} at ${bloc.toString()}");
    print(stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}
