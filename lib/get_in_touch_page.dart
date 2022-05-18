import 'package:cv/app.dart';
import 'package:cv/base_page.dart';
import 'package:cv/network/models/all_data_model.dart';
import 'package:cv/network/network_controller.dart';
import 'package:cv/page_title.dart';
import 'package:flutter/material.dart';

class GetInTouchPage extends StatefulWidget {
  final AllDataModel? networkData;

  const GetInTouchPage(GlobalKey key, {required this.networkData})
      : super(key: key);

  @override
  State<GetInTouchPage> createState() => _GetInTouchPageState();
}

class _GetInTouchPageState extends State<GetInTouchPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  bool isSubmitting = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    subjectController.dispose();
    messageController.dispose();
    super.dispose();
  }

  void toggleIsSubmitting(bool value) {
    setState(() {
      isSubmitting = value;
    });
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
          borderSide: const BorderSide(color: SUB_COLOR, width: 1.0),
          borderRadius: BorderRadius.circular(18),
        ),
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: maxLines == 1 ? 0 : 12,
        ),
      ),
      style: const TextStyle(fontSize: 14),
      cursorColor: SUB_COLOR,
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
          color: SUB_COLOR,
          size: 28,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              content,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black54,
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
      onPressed: submit,
      color: isSubmitting ? Colors.grey : SUB_COLOR,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Text(
        isSubmitting ? "Submitting..." : "Submit Message",
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  void submit() async {
    setState(() {
      isSubmitting = true;
    });

    await NetworkController(context: context)
        .postContact(nameController.text, emailController.text,
            subjectController.text, messageController.text)
        .then((value) {
      if (value == true) {
        nameController.clear();
        emailController.clear();
        subjectController.clear();
        messageController.clear();
      }

      setState(() {
        isSubmitting = false;
      });
    });
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
                child: buildContactItem(Icons.call, "Phone",
                    widget.networkData?.data?.info?.phone ?? ""),
              ),
              Expanded(
                flex: 2,
                child: buildTextFormField("Your name", nameController),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: buildTextFormField(
                  "Email address",
                  emailController,
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
                child: buildContactItem(Icons.email, "Email",
                    widget.networkData?.data?.info?.email ?? ""),
              ),
              Expanded(
                flex: 2,
                child: buildTextFormField("Subject", subjectController),
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 256,
              child: buildContactItem(Icons.my_location, "Location",
                  widget.networkData?.data?.info?.location ?? ""),
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
                      messageController,
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
            Icons.call, "Phone", widget.networkData?.data?.info?.phone ?? ""),
        space,
        buildContactItem(
            Icons.email, "Email", widget.networkData?.data?.info?.email ?? ""),
        space,
        buildContactItem(Icons.my_location, "Location",
            widget.networkData?.data?.info?.location ?? ""),
        space,
        buildTextFormField("Your name", nameController),
        smallSpace,
        buildTextFormField("Email address", emailController, isEmail: true),
        smallSpace,
        buildTextFormField("Subject", subjectController),
        smallSpace,
        buildTextFormField("Message...", messageController, maxLines: 4),
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
          padding: PAGE_CONTENT_PADDING,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const PageTitle("Get in touch"),
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
