import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_state_handling/models/dog.dart';
import 'package:simple_state_handling/pages/home_page/home_page.dart';
import 'package:simple_state_handling/providers/dog_notifier.dart';
import 'package:simple_state_handling/services/api.dart';
import 'package:simple_state_handling/services/dog_services/dog_api.dart';

class _Hidden<T> {
  _Hidden(this.value);

  final T value;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<_Hidden<Api<Dog>>>(
          create: (_) => _Hidden(DogApi()),
        ),
        ChangeNotifierProvider<DogNotifier>(
          create: (context) => DogNotifier(
            Provider.of<_Hidden<Api<Dog>>>(context, listen: false).value,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
