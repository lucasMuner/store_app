import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_app/presentation/onboarding/onboarding_view_model.dart';
import 'package:flutter_advanced_app/presentation/resources/assets_manager.dart';
import 'package:flutter_advanced_app/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_app/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_app/presentation/resources/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../domain/model.dart';
import '../resources/routes_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController _pageController = PageController(initialPage: 0);
  OnBoardingViewModel _viewModel = OnBoardingViewModel();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SlideViewObject>(
        stream: _viewModel.outputSliderViewObject,
        builder: (context, response) => _getContentWidget(response.data));
  }

  Widget _getContentWidget(SlideViewObject? slideViewObject) {
    if (slideViewObject == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: AppSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
            controller: _pageController,
            itemCount: slideViewObject.numOfSlides,
            onPageChanged: (index) {
              _viewModel.onPageChanged(index);
            },
            itemBuilder: (context, index) {
              return OnBoardingPage(slideViewObject.sliderObject);
            }),
        bottomSheet: Container(
          color: ColorManager.white,
          height: AppSize.s100,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  child: Text(
                    AppString.skip,
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              _getBottomSheetPage(slideViewObject)
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetPage(SlideViewObject? slideViewObject) {
    if (slideViewObject == null) {
      return Container();
    } else {
      return Container(
        color: ColorManager.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              //left arrow
              padding: EdgeInsets.all(AppPadding.p14),
              child: GestureDetector(
                child: SizedBox(
                  height: AppSize.s20,
                  width: AppSize.s20,
                  child: SvgPicture.asset(ImageAssets.leftArrowIc),
                ),
                onTap: () {
                  _pageController.animateToPage(_viewModel.goPrevios(),
                      duration: Duration(milliseconds: DurationConstant.d300),
                      curve: Curves.bounceInOut);
                },
              ),
            ),

            //circles indicator
            Row(
              children: [
                for (int i = 0; i < slideViewObject.numOfSlides; i++)
                  Padding(
                    padding: EdgeInsets.all(AppPadding.p14),
                    child: _getProperCircle(i, slideViewObject.currentIndex),
                  )
              ],
            ),
            //right arrow
            Padding(
              //left arrow
              padding: EdgeInsets.all(AppPadding.p14),
              child: GestureDetector(
                child: SizedBox(
                  height: AppSize.s20,
                  width: AppSize.s20,
                  child: SvgPicture.asset(ImageAssets.rightArrowIc),
                ),
                onTap: () {
                  _pageController.animateToPage(_viewModel.goNext(),
                      duration: Duration(milliseconds: DurationConstant.d300),
                      curve: Curves.bounceInOut);
                },
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _getProperCircle(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCircleIc);
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc);
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
//-------------------------------------------------------------------

class OnBoardingPage extends StatelessWidget {
  SliderObject _sliderObject;
  OnBoardingPage(this._sliderObject);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(
          height: AppSize.s60,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: Image(
            image: AssetImage(ImageAssets.onboardingLogo1),
          ),
        )
      ],
    );
  }
}

//-------------------------------------------------------------------
