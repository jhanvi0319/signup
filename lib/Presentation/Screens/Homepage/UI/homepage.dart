import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_api_bloc_app/Data/Models/homepage_model.dart';
import '../../../Components/error_screen.dart';
import '../../../Components/spacer.dart';
import '../../../Declarations/Global/constants.dart';
import '../Widgets/listtile.dart';
import '../Widgets/textformfields.dart';

import '../../../../BusinessLogic/bloc/homepage_bloc.dart';
import '../Widgets/search_btn.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FocusNode nameFocus;
  late FocusNode jobFocus;
  late FocusNode searchBtnFocus;
  late TextEditingController firstNameController;
  late TextEditingController mobileController;
  late TextEditingController emailController;
  late TextEditingController lastNameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    nameFocus = FocusNode();
    jobFocus = FocusNode();
    searchBtnFocus = FocusNode();
    firstNameController = TextEditingController();
    mobileController = TextEditingController();
    emailController = TextEditingController();
    lastNameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    nameFocus.dispose();
    jobFocus.dispose();
    searchBtnFocus.dispose();
    firstNameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("POST request"),
      ),
      body: BlocConsumer<HomepageBloc, HomepageState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is HomepageLoaded) {
            return buildLoadedlayout(state.data);
          } else if (state is HomepageLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomepageError) {
            return const ErrorScreenBuilder();
          } else {
            return buildInitialLayout();
          }
        },
      ),
    );
  }

  Widget buildInitialLayout() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputField(
              focusNode: nameFocus,
              textController: firstNameController,
              label: "Name",
              icons: const Icon(
                Icons.person,
                color: Colors.blue,
              ),
            ),
            HeightSpacer(myHeight: kSpacing),
            InputField(
              focusNode: jobFocus,
              textController: lastNameController,
              label: "lastName",
              icons: const Icon(Icons.work, color: Colors.blue),
            ),
            HeightSpacer(myHeight: kSpacing),
            InputField(
              focusNode: jobFocus,
              textController: emailController,
              label: "Designation",
              icons: const Icon(Icons.work, color: Colors.blue),
            ),
            HeightSpacer(myHeight: kSpacing),
            InputField(
              focusNode: jobFocus,
              textController: mobileController,
              label: "Designation",
              icons: const Icon(Icons.work, color: Colors.blue),
            ),
            HeightSpacer(myHeight: kSpacing),
            InputField(
              focusNode: jobFocus,
              textController: passwordController,
              label: "Designation",
              icons: const Icon(Icons.work, color: Colors.blue),
            ),
            HeightSpacer(myHeight: kSpacing),
            SearchButtonBuilder(
              focusNode: searchBtnFocus,
              firstName: firstNameController,
              email: emailController,
              password: passwordController,
              mobile: mobileController,
              lastName: lastNameController,
            ),
          ],
        ),
      );

  Widget buildLoadedlayout(HomePageModel data) => Center(
          child: Padding(
        padding: kHPadding * 2,
        child: ListTileBuilder(data),
      ));
}
