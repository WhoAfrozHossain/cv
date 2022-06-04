import 'package:cv/core/utils/values_manager.dart';
import 'package:cv/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../main.dart';
import '../data/repositories/frontend_repository_impl.dart';
import '../domain/usecase/frontend_use_case.dart';
import 'bloc/frontend_bloc.dart';
import 'widgets/about_page.dart';
import 'widgets/companies_page.dart';
import 'widgets/get_in_touch_page.dart';
import 'widgets/home_page.dart';
import 'widgets/my_skill_page.dart';
import 'widgets/navigation.dart';
import 'widgets/tab_bar.dart';

// ignore: must_be_immutable
class FrontendPage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late BuildContext context;

  // @override
  // void initState() {
  //   Future.delayed(const Duration(microseconds: 1)).then((value) {
  //     showAlertDialog(context);
  //     getNetworkAllData();
  //   });

  //   super.initState();
  // }

  // getNetworkAllData() async {
  //   await NetworkController(context: context).getAllData().then((value) {
  //     setState(() {
  //       allData = value;
  //     });
  //   });
  // }

  showAlertDialog() {
    Widget okButton = TextButton(
      child: const CustomTextWidget(text: "Continue"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: const CustomTextWidget(text: "Under Construction"),
      content:
          const CustomTextWidget(text: "This site is in under construction."),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _downloadCV() {
    launchUrlString("https://www.afrozhossain.com/cv_of_afroz_hossain.pdf");
  }

  void _hireMe() {
    scrollToIndex(keys.length - 1);
  }

  Widget pagePadding([Key? key]) => SizedBox(
        key: key,
        height: AppPadding.p18,
      );

  Widget _homePage() {
    return IntrinsicHeight(
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0,
            child: Navigation(
              (_) {},
            ),
          ),
          Positioned.fill(
            child: HomePage(
              key: keys[0],
              downloadCV: _downloadCV,
              hireMe: _hireMe,
            ),
          )
        ],
      ),
    );
  }

  final keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  final scrollBar = ScrollController();

  Widget _buildListDetail(bool forTablet) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        controller: scrollBar,
        padding: const EdgeInsets.only(bottom: AppPadding.p32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: AppSize.s32),
            Visibility(visible: !forTablet, child: AppTabBar()),
            _homePage(),
            pagePadding(),
            // BasePage(
            //   child: InkWell(
            //     onTap: () => launch(Data.CERTIFICATE_URL),
            //     child: Image.asset('image/cer.png'),
            //   ),
            // ),
            // pagePadding(),
            AboutPage(
              keys[1],
              _downloadCV,
              _hireMe,
            ),
            pagePadding(),
            MySkillPage(
              keys[2],
            ),
            pagePadding(),
            CompanyPage(
              keys[3],
            ),
            pagePadding(),
            GetInTouchPage(
              keys[4],
            ),
          ],
        ),
      ),
    );
  }

  void scrollToIndex(int index) {
    Scrollable.ensureVisible(
      keys[index].currentContext!,
      duration: const Duration(milliseconds: 500),
    );
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      Navigator.of(context).pop();
    }
  }

  Widget _buildNavigation(bool forTablet) {
    return Padding(
      padding: EdgeInsets.only(top: forTablet ? AppPadding.p32 : 0),
      child: Navigation(
        (index) {
          scrollToIndex(index);
        },
      ),
    );
  }

  Widget _buildTabletBody(double width) {
    return Scaffold(
      key: _scaffoldKey,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildNavigation(true),
          const SizedBox(width: 24),
          LimitedBox(
            maxWidth: 720,
            child: _buildListDetail(true),
          )
        ],
      ),
    );
  }

  Widget _buildPhoneBody() {
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: _buildListDetail(false),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.transparent,
        ),
        child: Drawer(
          child: _buildNavigation(false),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return BlocProvider(
      create: (_) => FrontendBloc(
        frontendUseCase: FrontendUseCase(
          frontendRepository: FrontendRepositoryImpl(
            appNetworkInfo: sl(),
            frontendRemoteDataSource: sl(),
          ),
        ),
      )..add(GetFrontendDataEvent()),
      child: BlocListener<FrontendBloc, FrontendState>(
        listener: (context, state) {},
        child: BlocBuilder<FrontendBloc, FrontendState>(
          builder: (_, state) {
            return _view();
            // if (state is FrontendDataSuccessState) {
            //   item = state.item;
            //   return productDetails(context, state.item);
            // } else {
            //   if (item != null) {
            //     return productDetails(context, item);
            //   } else {
            //     return Center(
            //       child: Container(
            //         padding: EdgeInsets.all(AppPadding.p20),
            //         child: CircularProgressIndicator(),
            //       ),
            //     );
            //   }
            // }
          },
        ),
      ),
    );
  }

  Widget _view() {
    return LayoutBuilder(
      builder: (_, constrain) {
        return Scrollbar(
          // isAlwaysShown: true,
          scrollbarOrientation: ScrollbarOrientation.right,
          controller: scrollBar,
          child: constrain.maxWidth >= AppSize.minTabletSize
              ? _buildTabletBody(constrain.maxWidth)
              : _buildPhoneBody(),
        );
      },
    );
  }
}
