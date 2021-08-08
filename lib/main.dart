import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:test_todo/data/server_api/models/user_model.dart';

import 'screens/auth/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserApp>(
      create: (context)=> UserApp(),
      child: MaterialApp(
          title: 'Flutter Demo',
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: Locale('en'),
          supportedLocales: [
            Locale('en', ''),
            Locale('ru', ''),
          ],
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: AuthScreen()),
    );
        // routes: {
        //   '/auth': (context) =>
        //        AuthProvider(model: AuthModel(), child: AuthScreen()),
        // });
  }
}
