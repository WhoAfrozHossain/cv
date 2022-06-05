import 'package:cv/core/data/models/job_model.dart';
import 'package:cv/core/widgets/custom_image_widget.dart';
import 'package:cv/core/widgets/custom_space_widget.dart';
import 'package:cv/core/widgets/custom_text_widget.dart';
import 'package:cv/features/frontend/screens/function/frontend_functions.dart';
import 'package:cv/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/utils_export.dart';
import 'animated_text.dart';
import 'base_page.dart';
import 'react_button.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage(GlobalKey key) : super(key: key);

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  Widget _buildCompany(JobModel company) {
    String status = "";

    if (company.endDate == null) {
      status = "Current Company";
    } else {
      DateTime start = DateTime.parse(company.startDate!);
      DateTime end = DateTime.parse(company.endDate!);

      status = "${(end.difference(start).inDays / 30).floor()} Months";
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(
              height: 164,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 5 / 4,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: CustomTextWidget(
                            text: status,
                            style: getRegularStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s12,
                            ),
                          ),
                        ),
                      ),
                      ReactButton(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.grey.withAlpha(24),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomImageWidget(
                            context: context,
                            imageUrl: company.logo,
                            fit: BoxFit.fitHeight,
                            height: 64,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            AnimatedText(
              text: company.companyName ?? "",
              onTap: () {},
            ),
            CustomTextWidget(
              text:
                  "${DateFormat.yMMMd().format(DateTime.parse(company.startDate!))} - ${company.endDate == null ? "Till Now" : DateFormat.yMMMd().format(DateTime.parse(company.endDate!))}",
              style: getRegularStyle(
                color: ColorManager.black,
                fontSize: FontSize.s12,
              ),
            ),
          ],
        ),
        CustomSpaceWidget.fromWidth(12)
      ],
    );
  }

  Widget _buildCompanies() {
    List<JobModel> companies =
        sl<FrontendFunctions>().frontendDataModel?.data?.job ?? [];

    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: AppPadding.p48),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: companies.reversed.map((e) => _buildCompany(e)).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(
                left: AppPadding.p54,
                right: AppPadding.p54,
                top: AppPadding.p54,
              ),
              child: CustomTextWidget(
                text: "Companies",
                style: getBoldStyle(
                  color: ColorManager.black,
                  fontSize: FontSize.s24,
                ),
              )),
          const SizedBox(height: 40),
          _buildCompanies(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
