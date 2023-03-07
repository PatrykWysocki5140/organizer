import 'package:flutter/material.dart';
import 'package:organizer/providers/themeNotifier.dart';
import 'package:organizer/screens/splash_screen/splash_screen_page.dart';
import 'package:organizer/styles/styles.dart';
import 'package:organizer/widgets/calendar/bloc/calendar_bloc.dart';
import 'package:organizer/widgets/calendar_s/bloc/events_bloc.dart';
import 'package:organizer/widgets/main_bottom_bar/main_bottom_bar_page.dart';
import 'package:provider/provider.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<NightMode>.value(value: NightMode()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => CalendarBloc(),
          ),
          BlocProvider<EventsBloc>(
            create: (BuildContext context) => EventsBloc(),
          ),
        ],
        child: Consumer<NightMode>(
          builder: (context, nightMode, child) => FutureBuilder<ThemeData>(
              future: nightMode.getTheme(),
              initialData: Styles.themeData(false),
              builder:
                  (BuildContext context, AsyncSnapshot<ThemeData> themeData) {
                return MaterialApp(
                  title: 'Organizer',
                  theme: themeData.data,
                  initialRoute: '/loading',
                  routes: {
                    '/main': (context) => MainBottomBar(),
                    '/loading': (context) => const SplashScreenPage("/main"),
                  },
                  debugShowCheckedModeBanner: false,
                );
              }),
        ),
      );
}
