import 'package:cv/core/utils/utils_export.dart';
import 'package:cv/core/widgets/custom_text_widget.dart';
import 'package:cv/features/frontend/screens/function/frontend_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../main.dart';
import '../bloc/frontend_bloc.dart';
import 'base_page.dart';

class GetInTouchPage extends StatefulWidget {
  const GetInTouchPage(GlobalKey key) : super(key: key);

  @override
  State<GetInTouchPage> createState() => _GetInTouchPageState();
}

class _GetInTouchPageState extends State<GetInTouchPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  Widget buildTextFormField(
    String hint,
    TextEditingController controller, {
    int maxLines = 1,
    bool isEmail = false,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.secondaryColor, width: 1.0),
          borderRadius: BorderRadius.circular(18),
        ),
        labelText: hint,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: maxLines == 1 ? 0 : 12,
        ),
      ),
      style: const TextStyle(fontSize: 14),
      cursorColor: ColorManager.secondaryColor,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return 'The field is required';
        } else if (isEmail &&
            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value)) {
          return "Invalid email";
        }
        return null;
      },
    );
  }

  Widget buildContactItem(IconData icon, String title, String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(
          icon,
          color: ColorManager.secondaryColor,
          size: 28,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomTextWidget(
              text: title,
              style: getBoldStyle(
                fontSize: FontSize.s16,
              ),
            ),
            const SizedBox(height: 4),
            CustomTextWidget(
              text: content,
              style: getBoldStyle(
                fontSize: FontSize.s14,
                color: ColorManager.black,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildSubmitButton() {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
      onPressed: () {
        Map<String, String> body = {
          'name': sl<FrontendFunctions>().nameController.text,
          'email': sl<FrontendFunctions>().emailController.text,
          'subject': sl<FrontendFunctions>().subjectController.text,
          'message': sl<FrontendFunctions>().messageController.text,
        };

        BlocProvider.of<FrontendBloc>(context)
            .add(PostStoreContactEvent(body: body));
      },
      color: ColorManager.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Text(
        "Send Message",
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget buildTabletLayout() {
    const lineHeight = 84.0;
    return Column(
      children: <Widget>[
        SizedBox(
          height: lineHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 256,
                child: buildContactItem(
                  Icons.call,
                  "Phone",
                  sl<FrontendFunctions>()
                          .frontendDataModel
                          ?.data
                          ?.info
                          ?.phone ??
                      "",
                ),
              ),
              Expanded(
                flex: 2,
                child: buildTextFormField(
                  "Your name",
                  sl<FrontendFunctions>().nameController,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: buildTextFormField(
                  "Email address",
                  sl<FrontendFunctions>().emailController,
                  isEmail: true,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: lineHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 256,
                child: buildContactItem(
                  Icons.email,
                  "Email",
                  sl<FrontendFunctions>()
                          .frontendDataModel
                          ?.data
                          ?.info
                          ?.email ??
                      "",
                ),
              ),
              Expanded(
                flex: 2,
                child: buildTextFormField(
                  "Subject",
                  sl<FrontendFunctions>().subjectController,
                ),
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 256,
              child: buildContactItem(
                Icons.my_location,
                "Location",
                sl<FrontendFunctions>()
                        .frontendDataModel
                        ?.data
                        ?.info
                        ?.location ??
                    "",
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 124,
                    child: buildTextFormField(
                      "Message...",
                      sl<FrontendFunctions>().messageController,
                      maxLines: 4,
                    ),
                  ),
                  buildSubmitButton(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildPhoneLayout() {
    const space = SizedBox(height: 36);
    const smallSpace = SizedBox(height: 18);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        buildContactItem(
          Icons.call,
          "Phone",
          sl<FrontendFunctions>().frontendDataModel?.data?.info?.phone ?? "",
        ),
        space,
        buildContactItem(
          Icons.email,
          "Email",
          sl<FrontendFunctions>().frontendDataModel?.data?.info?.email ?? "",
        ),
        space,
        buildContactItem(
          Icons.my_location,
          "Location",
          sl<FrontendFunctions>().frontendDataModel?.data?.info?.location ?? "",
        ),
        space,
        buildTextFormField(
          "Your name",
          sl<FrontendFunctions>().nameController,
        ),
        smallSpace,
        buildTextFormField(
          "Email address",
          sl<FrontendFunctions>().emailController,
          isEmail: true,
        ),
        smallSpace,
        buildTextFormField(
          "Subject",
          sl<FrontendFunctions>().subjectController,
        ),
        smallSpace,
        buildTextFormField(
          "Message...",
          sl<FrontendFunctions>().messageController,
          maxLines: 4,
        ),
        space,
        buildSubmitButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BasePage(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppPadding.p54,
            horizontal: AppPadding.p48,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomTextWidget(
                text: "Get in touch",
                style: getBoldStyle(
                  fontSize: FontSize.s24,
                ),
              ),

              const SizedBox(height: 64),
              LayoutBuilder(
                builder: (_, constrain) {
                  final maxWidth = constrain.maxWidth;
                  const widthForTablet = 500;
                  return maxWidth >= widthForTablet
                      ? buildTabletLayout()
                      : buildPhoneLayout();
                },
              ),
              // const SizedBox(height: 32),
              // Text(
              //   'Note: Submit function is not work anymore, but I keep it here because it\'s beautiful ^^',
              //   style: Theme.of(context).textTheme.caption?.copyWith(
              //         fontStyle: FontStyle.italic,
              //         color: Colors.deepOrange,
              //       ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
