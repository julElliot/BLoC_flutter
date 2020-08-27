import 'package:flutter_bloc/flutter_bloc.dart';

enum WeatherEvents {isInternetConnection, noInternetConnection}

class WeatherBloc extends Bloc<WeatherEvents, int> {
  WeatherBloc(int initialState) : super(initialState);

  @override
  Stream<int> mapEventToState(WeatherEvents event) async*{
    switch(event){
      case WeatherEvents.isInternetConnection:
        yield 1;
        break;
      case WeatherEvents.noInternetConnection:
        yield 0;
        break;
    }
  }

}