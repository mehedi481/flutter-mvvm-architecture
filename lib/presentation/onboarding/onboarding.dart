import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mvvm_architecture/presentation/resources/assets_manager.dart';
import 'package:flutter_mvvm_architecture/presentation/resources/color_manager.dart';
import 'package:flutter_mvvm_architecture/presentation/resources/strings_manager.dart';
import 'package:flutter_mvvm_architecture/presentation/resources/value_manager.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final List<SliderObject> _list = [
    SliderObject(
        title: AppStrings.onBoardingTitle1,
        subTitle: AppStrings.onBoardingSubTitle1,
        image: AssetsManager.onboardingLogo1),
    SliderObject(
        title: AppStrings.onBoardingTitle2,
        subTitle: AppStrings.onBoardingSubTitle2,
        image: AssetsManager.onboardingLogo2),
    SliderObject(
        title: AppStrings.onBoardingTitle3,
        subTitle: AppStrings.onBoardingSubTitle3,
        image: AssetsManager.onboardingLogo3),
    SliderObject(
        title: AppStrings.onBoardingTitle4,
        subTitle: AppStrings.onBoardingSubTitle4,
        image: AssetsManager.onboardingLogo4),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
          controller: _pageController,
          itemCount: _list.length,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          itemBuilder: ((context, index) {
            return OnBoardingPage(_list[index]);
          })),
      bottomSheet: Container(
          color: ColorManager.white,
          height: AppSize.s100,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    
                  },
                  child: Text(
                    AppStrings.skip,
                    style: Theme.of(context).textTheme.subtitle2,
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              _getBottomSheetWidget(),
            ],
          )),
    );
  }

  Widget _getBottomSheetWidget() {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    _getPreviousIndex(),
                    duration: const Duration(milliseconds: DurationConstant.d300),
                    curve: Curves.bounceIn,
                  );
                },
                child: SizedBox(
                  height: AppSize.s20,
                  width: AppSize.s20,
                  child: SvgPicture.asset(
                    AssetsManager.leftArrowIc,
                  ),
                )),
          ),
          // Circle indicator
          Row(
            children: [
              for (int i = 0; i < _list.length; i++)
                Padding(
                  padding: const EdgeInsets.all(AppSize.s8),
                  child: _getProperCircle(i),
                )
            ],
          ),
          // Right Arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
                onTap: () {
                   _pageController.animateToPage(
                    _getNextIndex(),
                    duration: const Duration(milliseconds: DurationConstant.d300),
                    curve: Curves.bounceIn,
                  );
                },
                child: SizedBox(
                  height: AppSize.s20,
                  width: AppSize.s20,
                  child: SvgPicture.asset(
                    AssetsManager.rightArrowIc,
                  ),
                )),
          ),
          
        ],
      ),
    );
  }

  int _getPreviousIndex() {
    int previousIndex = _currentPage--; // -1
    if (previousIndex == -1) {
      _currentPage =
          _list.length - 1; // infinite loop to go to the length of slider list
    }
    return _currentPage;
  }

  int _getNextIndex() {
    int nextIndex = _currentPage++; // +1
    if (nextIndex >= _list.length) {
      _currentPage = 0; // infinite loop to go to the first item of the slider
    }
    return _currentPage;
  }

  Widget _getProperCircle(int index) {
    if (index == _currentPage) {
      return SvgPicture.asset(AssetsManager.hollowCircleIc);
    } else {
      return SvgPicture.asset(AssetsManager.solidCircleIc);
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  SliderObject _sliderObject;
  OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s50,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        const SizedBox(
          height: AppSize.s50,
        ),
        SvgPicture.asset(_sliderObject.image!),
      ],
    );
  }
}

class SliderObject {
  String? title;
  String? subTitle;
  String? image;
  SliderObject(
      {required this.title, required this.subTitle, required this.image});
}
