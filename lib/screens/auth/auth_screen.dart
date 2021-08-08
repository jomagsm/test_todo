import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test_todo/data/server_api/models/user_model.dart';
import 'package:test_todo/theme/color_theme.dart';
import 'package:test_todo/theme/text_theme.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userApp = context.read<UserApp>();
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
                  onChanged: (userName) =>
                      _userApp.changeData(userName: userName),
                  // controller: model?.loginTextController,
                  textAlign: TextAlign.center,
                  style: TextThemes.inputText,
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
              const _ErrorMessageWidget(
                userName: true,
                userPassword: false,
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              TextFormField(
                obscureText: true,
                  onChanged: (password) =>
                      _userApp.changeData(password: password),
                  // controller: model?.passwordTextController,
                  textAlign: TextAlign.center,
                  style: TextThemes.inputText,
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
              const _ErrorMessageWidget(
                userName: false,
                userPassword: true,
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              InkWell(
                onTap: () {_userApp.auth();},
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

class _ErrorMessageWidget extends StatelessWidget {
  final bool userName;
  final bool userPassword;
  const _ErrorMessageWidget(
      {Key? key, required this.userName, required this.userPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userApp = context.watch<UserApp>();
    if (userName) {
      if (userApp.errorUser != null)
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            userApp.errorUser!,
            style: TextThemes.errorText,
          ),
        );
    }
    if (userPassword) {
      if (userApp.errorPassword != null)
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            userApp.errorPassword!,
            style: TextThemes.errorText,
          ),
        );
    }
    return const SizedBox(height: 20,);
  }
}
