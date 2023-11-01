abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomSheetState extends NewsStates {}

//get business
class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {
  final String error;
  NewsGetBusinessErrorState({
    required this.error,
  });
}

//get sports
class NewsGetSportsLoadingState extends NewsStates {}

class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates {
  final String error;
  NewsGetSportsErrorState({
    required this.error,
  });
}

//get science

class NewsGetScienceLoadingState extends NewsStates {}

class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates {
  final String error;
  NewsGetScienceErrorState({
    required this.error,
  });
}

class NewsChangeThemeModeState extends NewsStates {}
