import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test_todo/theme/color_theme.dart';
import 'package:test_todo/theme/text_theme.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroundBlack,
      appBar: AppBar(
        backgroundColor: ColorPalette.gray,
        title: Text(AppLocalizations.of(context)!.kanban),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.enterUserName,
                    hintStyle: TextThemes.hintText,
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorPalette.outlinedBorder)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: ColorPalette.focusedBorder,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide:
                            BorderSide(color: ColorPalette.focusedBorder)),
                    // errorBorder:
                    //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: Colors.purple)),
                    // errorStyle: TextStyle(color: Colors.purple),
                  )),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.enterUserPass,
                    hintStyle: TextThemes.hintText,
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorPalette.outlinedBorder)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: ColorPalette.focusedBorder,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide:
                            BorderSide(color: ColorPalette.focusedBorder)),
                    // errorBorder:
                    //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide:
                            BorderSide(color: ColorPalette.focusedBorder)),
                    // errorStyle: TextStyle(color: Colors.purple),
                  )),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: (){},
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizations.of(context)!.logIn,
                      style: TextThemes.hintText,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: ColorPalette.focusedBorder,
                      borderRadius: BorderRadius.circular(25)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
