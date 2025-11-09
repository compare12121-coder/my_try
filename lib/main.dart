import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_try/cuibt/get_weather/cubic.dart';
import 'package:my_try/cuibt/get_weather/states.dart';
import 'package:my_try/firebase_options.dart';
import 'package:my_try/pages/home_page.dart';

void main()async { WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetWeatherCubit(),
      child: Builder(builder: (context)=>BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
    
 

        return MaterialApp(
        
          // theme: ThemeData(
          //   primarySwatch: Colors.blue,
          //   useMaterial3: false
          //   ),
            theme: ThemeData(
            primarySwatch: TheColor(BlocProvider.of<GetWeatherCubit>(context).weather?.description ?? 'clear',
            ),
            useMaterial3: false
          ),
          home:  HomePage()
        
        );
      },
    )
      
      )
    );
  }
}


MaterialColor TheColor(String condition) {
  condition = condition.toLowerCase();

  if (condition.contains('sunny')) return Colors.amber;
  if (condition.contains('clear')) return Colors.blueGrey;
  if (condition.contains('cloudy')) return Colors.grey;
  if (condition.contains('rain')) return Colors.blue;
  if (condition.contains('snow')) return Colors.cyan;
  if (condition.contains('thunder')) return Colors.deepPurple;

  // لون افتراضي (default)
  return Colors.lightBlue;
}
