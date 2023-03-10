import 'package:flutter/material.dart';
import 'package:projects/common/colors.dart';
import 'package:projects/common/common_utils.dart';
import 'package:projects/common/constants.dart';
import 'package:projects/common/dimensions.dart';
import 'package:projects/models/todo_model.dart';
import 'package:projects/pages/add_task/add_campaign.dart';
import 'package:projects/services/DataBaseHelper.dart';
import 'package:projects/widgets/default_circular_loading_indicator.dart';
import 'package:projects/widgets/default_space_vertical.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var size;
  late List<TodoModel> todoModel;
  bool isLoading= false;

  bool isExpanded =false;

//add task
  void gotoAddTaskPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddCampaign()),
    ).then((value) => setState((){
      refreshTodoList();
    }));
  }

  @override
  void initState() {
    super.initState();
    refreshTodoList();
  }

  @override
  void dispose() {
    DatabaseHelper.instance.closeDB();
    super.dispose();
  }

  Future refreshTodoList() async {
    setState(() => isLoading = true);
    todoModel = await DatabaseHelper.instance.getTodoList();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    Widget todoListBuilder() {
      return FutureBuilder<List<TodoModel>>(
          future: DatabaseHelper.instance.getTodoList(),
          builder:
              (BuildContext context, AsyncSnapshot<List<TodoModel>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: DefaultCircularLoadingIndicator(),
              );
            }
            return snapshot.data!.isEmpty
                ? const Center(
                    child: Text(
                    Constants.EMPTY_TASK_MESSAGE,
                    style: TextStyle(
                        fontSize: TEXT_LARGE_FONT_SIZE,
                        color: COLOR_GREY,
                        fontWeight: FontWeight.w400),
                  ))
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => taskExpandCard(snapshot!.data![index])
            );
          });
    }

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            CommonUtils.showSuccessSnackbar(context, 'back pressed');
          },
          child: const Icon(
            Icons.arrow_back_ios_sharp,
            color: PRIMARY_WHITE_COLOR,
          ),
        ),
        backgroundColor: ACCENT_COLOR,
        centerTitle: true,
        title: const Text(
          Constants.HOME_PAGE_TITLE,
          style: TextStyle(
              fontSize: 20.0,
              color: PRIMARY_TEXT_COLOR,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  gotoAddTaskPage();
                },
                child: const Icon(
                  Icons.add_box_outlined,
                  color: PRIMARY_WHITE_COLOR,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.more_vert,
                  color: PRIMARY_WHITE_COLOR,
                )),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: DEFAULT_MIN_PADDING, vertical: DEFAULT_MIN_PADDING),
        child: Column(
          children: <Widget>[
            searchBar(),
            const DefaultSpaceVertical(),
            Expanded(child: todoListBuilder()),
          ],
        ),
      ),
    );
  }

  Widget searchBar() {
    return Card(
      elevation: DEFAULT_MIN_ELEVATION,
      child: TextField(
        style: const TextStyle(color: PRIMARY_TEXT_COLOR_BLACK),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DEFAULT_ELEVATION),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
          filled: true,
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: ACCENT_COLOR,
          ),
          hintText: 'Search',
        ),
      ),
    );
  }

  Widget taskExpandCard(TodoModel todoModel) {
    Widget cardTitle() => Row(
          children: [
            Expanded(
              child: Text(
                'Lead ID',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: PRIMARY_TEXT_COLOR_BLACK,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: Text(
                todoModel.leadId.toString(),
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: PRIMARY_TEXT_COLOR_BLACK,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        );

    Widget lastHeadingText() => Text(
          Constants.LAST_DATE_TEXT_INPUT_HINT,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
              color: PRIMARY_TEXT_COLOR_BLACK, fontWeight: FontWeight.w500),
        );
    Widget lastHeadingTextData() => Text(
          todoModel.lastDate,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
              color: PRIMARY_TEXT_COLOR_BLACK, fontWeight: FontWeight.w400),
        );

    Widget nextHeadingText() => Text(
          Constants.NEXT_DATE_TEXT_INPUT_HINT,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
              color: PRIMARY_TEXT_COLOR_BLACK, fontWeight: FontWeight.w500),
        );
    Widget nextHeadingTextData() => Text(
          todoModel.nextDate,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
              color: PRIMARY_TEXT_COLOR_BLACK, fontWeight: FontWeight.w400),
        );

    Widget emailHeadingText() => Text(
          Constants.EMAIL_ID_TEXT_INPUT_HINT,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
              color: PRIMARY_TEXT_COLOR_BLACK, fontWeight: FontWeight.w500),
        );
    Widget emailHeadingTextData() => Text(
          todoModel.email,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
              color: PRIMARY_TEXT_COLOR_BLACK, fontWeight: FontWeight.w400),
        );

    Widget dateHeadingTextData() => Text(
          todoModel.timeStamp,
          textAlign: TextAlign.end,
          style: Theme.of(context).textTheme.caption?.copyWith(
              color: PRIMARY_TEXT_COLOR_BLACK, fontWeight: FontWeight.w300),
        );

    return Card(
      color: CARD_BG_COLOR_LIT_GREEN,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DEFAULT_ELEVATION),
      ),
      elevation: 1.0,
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: isExpanded ? const Icon(Icons.keyboard_arrow_up) : const Icon(Icons.keyboard_arrow_down),
          onExpansionChanged: (id) => setState(() => isExpanded = id),
          trailing:const Icon(Icons.more_vert),
          title: cardTitle(),
          collapsedBackgroundColor: Colors.transparent,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: DEFAULT_MIN_PADDING,
                        right: DEFAULT_MIN_PADDING,
                        bottom: DEFAULT_MIN_PADDING),
                    child: Row(
                      children: [
                        Expanded(
                          child: lastHeadingText(),
                        ),
                        Expanded(
                          child: lastHeadingTextData(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(DEFAULT_MIN_PADDING),
                    child: Row(
                      children: [
                        Expanded(
                          child: nextHeadingText(),
                        ),
                        Expanded(
                          child: nextHeadingTextData(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(DEFAULT_MIN_PADDING),
                    child: Row(
                      children: [
                        Expanded(
                          child: emailHeadingText(),
                        ),
                        Expanded(
                          child: emailHeadingTextData(),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Expanded(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: DEFAULT_MIN_PADDING, vertical: 4),
                        child: dateHeadingTextData(),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
