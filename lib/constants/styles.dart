import 'package:recipeshare/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:recipeshare/constants/colors.dart';


final welcomeScreanStyle = ElevatedButton.styleFrom(
    fixedSize: Size(130, 45),
    backgroundColor: backgroundColorWelcomeScreemButtons,
    foregroundColor: foregroundColorWelcomeScreemButtons,
    elevation: 8,
    padding: EdgeInsets.symmetric(horizontal: paddinghorizentalWelcomeScreenButtons, vertical: paddinghorizentalWelcomeScreenVertical),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
    ),
);


final styleTexte = TextStyle(
  fontSize: textSize,
  fontWeight: homeLogoTextSize,
);

const TextStyle addImageHintTextStyle = TextStyle(
  color: addImageTextColor,
  fontSize: 14,
);

const TextStyle ingredientTitleStyle = TextStyle(
  fontSize: ingredientTitleSize,
  fontWeight: FontWeight.bold,
  color: ingredientTitleColor,
);

const TextStyle ingredientEmptyTextStyle = TextStyle(
  color: ingredientHintColor,
);

const TextStyle ingredientChipTextStyle = TextStyle(
  color: ingredientChipTextColor,
);

const TextStyle sectionTitleStyle =
TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

const TextStyle hintGreyStyle =
TextStyle(fontSize: 14, color: Colors.grey);

const InputDecoration textFieldBaseDecoration = InputDecoration(
  border: OutlineInputBorder(),
);

const TextStyle badgeTextStyle = TextStyle(
  fontSize: badgeFontSize,
  fontWeight: FontWeight.normal,
  color: Colors.black,
);

const EdgeInsets badgePadding = EdgeInsets.symmetric(
  horizontal: 4,
  vertical: 2,
);


const List<BoxShadow> menuDownShadow = [
  BoxShadow(
    blurRadius: 5,
    color: menuDownShadowColor,
  ),
];


const TextStyle recipeTitleTextStyle = TextStyle(
  fontSize: recipeTitleFontSize,
  fontWeight: FontWeight.bold,
);

const TextStyle recipeAuthorTextStyle = TextStyle(
  color: recipeSecondaryTextColor,
  fontWeight: FontWeight.w500,
);

const BoxShadow recipeCardShadow = BoxShadow(
  color: recipeCardShadowColor,
  blurRadius: 6,
  offset: Offset(0, 3),
);

const TextStyle loginSeparatorTextStyle = TextStyle();

TextStyle profileInfoTitleStyle(BuildContext context) =>
    Theme.of(context).textTheme.titleMedium!.copyWith(
      fontWeight: FontWeight.bold,
      color: mainContentColor,
    );



const TextStyle profileImageButtonTextStyle = TextStyle(
  color: mainContentColor,
);



TextStyle profileInfoLabelStyle(BuildContext context) =>
    Theme.of(context).textTheme.bodySmall!.copyWith(
      color: mainContentColor,
    );

TextStyle profileInfoValueStyle(BuildContext context) =>
    Theme.of(context).textTheme.bodyLarge!.copyWith(
      fontWeight: FontWeight.w500,
    );


TextStyle profileSectionTitleStyle(BuildContext context) =>
    Theme.of(context).textTheme.titleMedium!.copyWith(
      fontWeight: FontWeight.bold,
    );

TextStyle profileDialogTitleStyle(BuildContext context) =>
    Theme.of(context).textTheme.titleMedium!;






TextStyle notificationTextStyle = const TextStyle(
  fontSize: notificationTextSize,
);



const TextStyle profileSectionTitleStyletest = TextStyle(
  fontSize: profileTitleFontSize,
  fontWeight: FontWeight.bold,
);












const TextStyle commentUserNameStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: commentUserFontSize,
);

const TextStyle commentDateStyle = TextStyle(
  fontSize: commentDateFontSize,
  color: commentDateTextColor,
);

const TextStyle commentContentStyle = TextStyle(
  fontSize: commentContentFontSize,
);




const TextStyle commentsErrorTextStyle = TextStyle(
  color: commentsErrorTextColor,
);



const TextStyle commentsAuthTextStyle = TextStyle(
  color: commentsAuthTextColor,
);



const TextStyle ingredientTitleTextStyle = TextStyle(
  fontSize: ingredientTitleFontSize,
  fontWeight: FontWeight.bold,
);

const TextStyle ingredientChipTextStyle2 = TextStyle(
  fontSize: ingredientTextFontSize,
  color: ingredientChipTextColor,
);

const TextStyle recipeNameTextStyle = TextStyle(
  fontSize: recipeNameFontSize,
  fontWeight: homeLogoTextSize,
  color: mainContentColor,
);






const TextStyle recipeSectionTitleStyle = TextStyle(
  fontSize: recipeSectionTitleFontSize,
  fontWeight: FontWeight.bold,
);

const TextStyle recipeStepTextStyle = TextStyle(
  fontSize: recipeStepFontSize,
  color: recipeChipTextColor,
  fontWeight: FontWeight.w500,
);


const InputDecoration registerDropdownInputDecoration = InputDecoration(
  border: OutlineInputBorder(),
);


const TextStyle searchBarHintStyle = TextStyle();




const FontWeight guideTextFontWeight = FontWeight.bold;