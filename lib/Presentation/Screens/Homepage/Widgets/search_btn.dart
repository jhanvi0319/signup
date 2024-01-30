import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../BusinessLogic/bloc/homepage_bloc.dart';
import '../../../Declarations/Global/constants.dart';

class SearchButtonBuilder extends StatelessWidget {
  const SearchButtonBuilder(
      {Key? key,
      required this.focusNode,
      required this.firstName,
      required this.email,
      required this.password,
      required this.mobile,
      required this.lastName})
      : super(key: key);

  final FocusNode focusNode;
  final TextEditingController firstName;
  final TextEditingController email;
  final TextEditingController mobile;
  final TextEditingController password;
  final TextEditingController lastName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.blue,
          primary: Colors.blue,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: kBorderRadius,
          ),
        ),
        onPressed: () => BlocProvider.of<HomepageBloc>(context).add(SendData(
            mobile.text,
            firstName.text,
            lastName.text,
            password.text,
            email.text)),
        child: Text(
          "Search",
          style: TextStyle(color: Colors.white, fontSize: kfontSize),
        ),
      ),
    );
  }
}
