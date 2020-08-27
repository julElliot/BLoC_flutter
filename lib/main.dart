import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/weatherBloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: BlocProvider(
          create: (BuildContext context) => WeatherBloc(null),
          child:MyHomePage()
        )
      )
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          BlocBuilder<WeatherBloc, int>(
              builder: (BuildContext context, int state){
                return Text((state == 1) ? 'Now I really want to sort out in BLoC pattern':
                'And I really want to have an internship:)');
              },
          ),


          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget> [
              RaisedButton(
              child: Text('Tap here'),
              onPressed: () {
                _weatherBloc.add(WeatherEvents.isInternetConnection);
              },
              ),
              RaisedButton(
                child: Text('Tap here'),
                onPressed: () {
                  _weatherBloc.add(WeatherEvents.noInternetConnection);
                },
              ),
            ]
          )
        ],
      ),
    );
  }

}


