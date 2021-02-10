class FeedStrings {
  //profile progress String
  static final String completeProfileTitle = 'Complete profile';
  static final String profileComplete = 'You have completed your profile';
  static String displayProgress(String progress) {
    return 'Your profile is $progress% complete, complete it now';
  }

  // global action strings
  static final String swipeForMore = 'Swipe for more';
  static final String swipeForMoreIconUrl = 'assets/images/swipe.svg';

  // the default one, in case there is no url
  static final String defaultImgUrl = 'assets/images/doctor-bag.svg';

  static final String fallBackBewellLogoUrl =
      'https://assets.healthcloud.co.ke/bewell_logo.png';
}

class FeedItemStrings {
  static final String likeIconUrl = 'assets/images/like.svg';
  static final String dislikeIconUrl = 'assets/images/dislike.svg';
  static final String viewIconUrl = 'assets/images/view.svg';

  // title bar strings
  static final String fallbackLogoIconUrl = 'assets/images/white_logo.png';
}
