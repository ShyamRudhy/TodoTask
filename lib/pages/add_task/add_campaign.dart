import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

import 'package:projects/common/colors.dart';
import 'package:projects/common/dimensions.dart';
import 'package:projects/common/constants.dart';
import 'package:projects/widgets/default_space_horizontal.dart';
import 'package:projects/widgets/default_space_vertical.dart';
import 'package:projects/widgets/negative_mini_button.dart';
import 'package:projects/widgets/posivite_mini_button.dart';

class AddCampaign extends StatefulWidget {
  const AddCampaign({Key? key}) : super(key: key);

  @override
  State<AddCampaign> createState() => _AddCampaignState();
}

class _AddCampaignState extends State<AddCampaign> {
  var size;

  void onBackPressed(){
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;


    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: (){
onBackPressed();
          },
          child: const Icon(
            Icons.arrow_back_ios_sharp,color: PRIMARY_WHITE_COLOR,),),
        backgroundColor: ACCENT_COLOR,
        centerTitle: true,
        title: const Text(
          Constants.CAMPAIGN_PAGE_TITLE,
          style: TextStyle(fontSize: TEXT_EXTRA_LARGE_FONT_SIZE,color: PRIMARY_TEXT_COLOR,decoration: TextDecoration.none,
              fontWeight: FontWeight.w500),
        ) ,
        actions:  [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: (){},
                child: const Icon(Icons.more_vert,color: PRIMARY_WHITE_COLOR,)),
          ) ,
        ],
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  <Widget> [
              headingText(),
                const DefaultSpaceHorizontal(),
               inputFieldsContainer(),
              const Expanded(child: SizedBox()),
              const DefaultSpaceVertical(),
              saveButton(),
              const DefaultSpaceVertical(),

            ],
          ),
        )
        ,
      )
    );
  }

  Widget headingText() => Text(
    Constants.CAMPAIGN_PAGE_SUBHEAD_TITLE,
    style: Theme.of(context)
        .textTheme
        .bodyText1
        ?.copyWith(color: COLOR_GREY,fontSize: TEXT_EXTRA_LARGE_FONT_SIZE, fontWeight: FontWeight.w400),
  );

  Widget inputFieldsContainer() {
    Widget leadIdTextField() => TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(TEXT_FIELD_CONTENT_PADDING),
            labelText: Constants.LEAD_ID_TEXT_INPUT_HINT,
            labelStyle: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: TEXT_COLOR_ASH),
            counterText: "",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DEFAULT_TEXT_FIELD_BORDER_RADIUS),
              borderSide: const BorderSide(
                color: PRIMARY_TEXT_FILED_BORDER_COLOR,
              ),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DEFAULT_TEXT_FIELD_BORDER_RADIUS),
              borderSide:
                  const BorderSide(color: PRIMARY_TEXT_FILED_BORDER_COLOR),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DEFAULT_TEXT_FIELD_BORDER_RADIUS),
              borderSide:
                  const BorderSide(color: SECONDARY_TEXT_FILED_BORDER_COLOR),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DEFAULT_TEXT_FIELD_BORDER_RADIUS),
              borderSide: const BorderSide(color: ERROR_COLOR),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DEFAULT_TEXT_FIELD_BORDER_RADIUS),
              borderSide: const BorderSide(color: ERROR_COLOR),
            ),
            //fillColor: Colors.green
          ),
          keyboardType: TextInputType.number,
          maxLines: 1,
          maxLength: 30,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(color: COLOR_GREY),
        );

    Widget lastFollowUpDateTextField() => TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(TEXT_FIELD_CONTENT_PADDING),
            labelText: Constants.LAST_DATE_TEXT_INPUT_HINT,
            labelStyle: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: TEXT_COLOR_ASH),
            counterText: "",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DEFAULT_TEXT_FIELD_BORDER_RADIUS),
              borderSide: const BorderSide(
                color: PRIMARY_TEXT_FILED_BORDER_COLOR,
              ),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DEFAULT_TEXT_FIELD_BORDER_RADIUS),
              borderSide:
                  const BorderSide(color: PRIMARY_TEXT_FILED_BORDER_COLOR),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DEFAULT_TEXT_FIELD_BORDER_RADIUS),
              borderSide:
                  const BorderSide(color: SECONDARY_TEXT_FILED_BORDER_COLOR),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DEFAULT_TEXT_FIELD_BORDER_RADIUS),
              borderSide: const BorderSide(color: ERROR_COLOR),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DEFAULT_TEXT_FIELD_BORDER_RADIUS),
              borderSide: const BorderSide(color: ERROR_COLOR),
            ),
            //fillColor: Colors.green
          ),
          keyboardType: TextInputType.datetime,
          maxLines: 1,
          maxLength: 30,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(color: COLOR_GREY),
        );

    Widget nextFollowUpDateTextField() => TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(TEXT_FIELD_CONTENT_PADDING),
            labelText: Constants.NEXT_DATE_TEXT_INPUT_HINT,
            labelStyle: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: TEXT_COLOR_ASH),
            counterText: "",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DEFAULT_TEXT_FIELD_BORDER_RADIUS),
              borderSide: const BorderSide(
                color: PRIMARY_TEXT_FILED_BORDER_COLOR,
              ),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DEFAULT_TEXT_FIELD_BORDER_RADIUS),
              borderSide:
                  const BorderSide(color: PRIMARY_TEXT_FILED_BORDER_COLOR),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DEFAULT_TEXT_FIELD_BORDER_RADIUS),
              borderSide:
                  const BorderSide(color: SECONDARY_TEXT_FILED_BORDER_COLOR),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DEFAULT_TEXT_FIELD_BORDER_RADIUS),
              borderSide: const BorderSide(color: ERROR_COLOR),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DEFAULT_TEXT_FIELD_BORDER_RADIUS),
              borderSide: const BorderSide(color: ERROR_COLOR),
            ),
            //fillColor: Colors.green
          ),
          keyboardType: TextInputType.datetime,
          maxLines: 1,
          maxLength: 30,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(color: COLOR_GREY),
        );

    Widget emailIdTextField() => TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(TEXT_FIELD_CONTENT_PADDING),
            labelText: Constants.EMAIL_ID_TEXT_INPUT_HINT,
            labelStyle: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: TEXT_COLOR_ASH),
            counterText: "",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DEFAULT_TEXT_FIELD_BORDER_RADIUS),
              borderSide: const BorderSide(
                color: PRIMARY_TEXT_FILED_BORDER_COLOR,
              ),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DEFAULT_TEXT_FIELD_BORDER_RADIUS),
              borderSide:
                  const BorderSide(color: PRIMARY_TEXT_FILED_BORDER_COLOR),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DEFAULT_TEXT_FIELD_BORDER_RADIUS),
              borderSide:
                  const BorderSide(color: SECONDARY_TEXT_FILED_BORDER_COLOR),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DEFAULT_TEXT_FIELD_BORDER_RADIUS),
              borderSide: const BorderSide(color: ERROR_COLOR),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DEFAULT_TEXT_FIELD_BORDER_RADIUS),
              borderSide: const BorderSide(color: ERROR_COLOR),
            ),
            //fillColor: Colors.green
          ),
          keyboardType: TextInputType.text,
          maxLines: 1,
          maxLength: 30,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(color: COLOR_GREY),
        );

    return Column(
      children: [
        const DefaultSpaceVertical(),
        leadIdTextField(),
        const DefaultSpaceVertical(),
        lastFollowUpDateTextField(),
        const DefaultSpaceVertical(),
        nextFollowUpDateTextField(),
        const DefaultSpaceVertical(),
        emailIdTextField()
      ],
    );
  }

  Widget saveButton(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        NegativeMiniButton(buttonText: "Cancel", onPressed: (){}, size: size),
        const DefaultSpaceHorizontal(),
        PositiveMiniButton(buttonText: "Save", onPressed: (){}, size: size),
    ],
    );

  }

}
