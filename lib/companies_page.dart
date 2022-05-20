import 'package:cv/app.dart';
import 'package:cv/network/models/all_data_model.dart';
import 'package:cv/network/models/job_model.dart';
import 'package:cv/page_title.dart';
import 'package:cv/widget/animated_text.dart';
import 'package:cv/widget/custom_image_widget.dart';
import 'package:cv/widget/react_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'base_page.dart';

class CompanyPage extends StatefulWidget {
  final AllDataModel? networkData;

  const CompanyPage(GlobalKey key, {required this.networkData})
      : super(key: key);

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
                          child: Text(
                            status,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
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
                          // child: Image.asset(
                          //   company.imagePath,
                          //   fit: BoxFit.fitHeight,
                          //   height: 64,
                          // ),
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
            Text(
              "${DateFormat.yMMMd().format(DateTime.parse(company.startDate!))} - ${company.endDate == null ? "Till Now" : DateFormat.yMMMd().format(DateTime.parse(company.endDate!))}",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(width: 12)
      ],
    );
  }

  Widget _buildCompanies() {
    List<JobModel> companies = widget.networkData?.data?.job ?? [];

    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: HORIZONTAL_PAGE_PADDING),
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
          const Padding(
            padding: EdgeInsets.only(
              left: VERTICAL_PAGE_PADDING,
              right: VERTICAL_PAGE_PADDING,
              top: VERTICAL_PAGE_PADDING,
            ),
            child: PageTitle("Companies"),
          ),
          const SizedBox(height: 64),
          _buildCompanies(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

// class Company {
//   String imagePath;
//   String name;
//   String time;

//   Company({
//     required this.imagePath,
//     required this.name,
//     required this.time,
//   });
// }
