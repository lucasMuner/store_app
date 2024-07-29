import 'dart:async';

import 'package:flutter_advanced_app/domain/model.dart';
import 'package:flutter_advanced_app/presentation/base/base_view_model.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // stream controllers
  final StreamController _streamController =
      StreamController<SlideViewObject>();
  //inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void goPrevios() {
    // TODO: implement goPrevios
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SlideViewObject> get outputSliderViewObject =>
      _streamController.stream.map((slideViewObject) => slideViewObject);
}

//orders the our view model will recieve from our view
mixin OnBoardingViewModelInputs {
  void goNext(); // when user click on right arrow or swipe left
  void goPrevios(); // when user click on left arrow or swipe right
  void onPageChanged(int index);

  Sink get inputSliderViewObject;
}

//data that will be send from our view model to our view
mixin OnBoardingViewModelOutputs {
  Stream<SlideViewObject> get outputSliderViewObject;
}

class SlideViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SlideViewObject(this.sliderObject, this.currentIndex, this.numOfSlides);
}
