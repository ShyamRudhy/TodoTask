import 'package:flutter/material.dart';
import 'package:projects/common/colors.dart';
import 'package:projects/common/constants.dart';
import 'package:projects/common/dimensions.dart';
import 'package:projects/models/todo_model.dart';
import 'package:projects/services/DataBaseHelper.dart';
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

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _leadIdTextController = TextEditingController();
  final TextEditingController _lastDateIdTextController = TextEditingController();
  final TextEditingController _nextDateTextController = TextEditingController();
  final TextEditingController _emailIdTextController = TextEditingController();

  bool _isErrorShown = false;

  void validateInputFields() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      _isErrorShown = false;
    } else {
      debugPrint('Form is invalid');
    }
  }


  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

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
              ?.copyWith(color: PRIMARY_TEXT_COLOR_DARK),
      controller: _leadIdTextController,

    );

    Widget lastFollowUpDateTextField() => TextFormField(
          decoration: InputDecoration(
            hintText: "dd-mm-yyyy",
            hintStyle: Theme.of(context).textTheme.caption?.copyWith(color:COLOR_GREY),
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
              ?.copyWith(color: PRIMARY_TEXT_COLOR_DARK),
      controller: _lastDateIdTextController,


    );

    Widget nextFollowUpDateTextField() => TextFormField(
          decoration: InputDecoration(
            hintText: "dd-mm-yyyy",
            hintStyle: Theme.of(context).textTheme.caption?.copyWith(color:COLOR_GREY),
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
              ?.copyWith(color: PRIMARY_TEXT_COLOR_DARK),
      controller: _nextDateTextController,

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
              ?.copyWith(color: PRIMARY_TEXT_COLOR_DARK),
      controller: _emailIdTextController,
      validator: validateEmail,
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
        NegativeMiniButton(buttonText: "Cancel", onPressed: (){
          onBackPressed();
        }, size: size),
        const DefaultSpaceHorizontal(),
        PositiveMiniButton(buttonText: "Save", onPressed: () async{
          DateTime date =  DateTime.now();// to store with time  in db

          await DatabaseHelper.instance.add(TodoModel(
                  leadId: int.parse(_leadIdTextController.text),
                  lastDate: _lastDateIdTextController.text,
                  nextDate: _nextDateTextController.text,
                  email: _emailIdTextController.text,
            timeStamp: date.toString()
          ));

          setState(() {
            _leadIdTextController.clear();
            _lastDateIdTextController.clear();
            _nextDateTextController.clear();
            _emailIdTextController.clear();
          });

          onBackPressed();
            },
            size: size),
      ],
    );

  }

}
