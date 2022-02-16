

import 'controllers/group_chat_controller.dart';

class GroupChatScreen extends StatefulWidget {
  const GroupChatScreen({Key? key}) : super(key: key);

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  final _controller = Get.put(GroupChatController());
  final _mystreamControllerChatScreen =
      StreamController<List<ChatScreenModal>>();

  TextEditingController myController = TextEditingController();

  ScrollController myScrollingController = ScrollController();

  List<ChatScreenModal> myChatScreenList = <ChatScreenModal>[
    ChatScreenModal(
        id: 0,
        message: "Welcome People,  where you going today? send me you location",
        time: DateFormat("h:mm a").format(DateTime.now())
        ,type: 0
    ),
    ChatScreenModal(
        id: 1,
        message: 'Hey!!',
        time: DateFormat("h:mm a").format(DateTime.now()) ,type: 0),
    ChatScreenModal(
        id: 0,
        message: "hello there! , where you going today? send me you location",
        time: DateFormat("h:mm a").format(DateTime.now()) ,type: 0),
    ChatScreenModal(
        id: 1,
        message: "nope",
        time: DateFormat("h:mm a").format(DateTime.now()) ,type: 0)
  ];

  @override
  void dispose() {
    _mystreamControllerChatScreen.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColour.blackTheme,
      appBar: CustomAppBar(
        title: 'Group Chat',
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: StreamBuilder<List<ChatScreenModal>>(
            stream: _mystreamControllerChatScreen.stream,
            initialData: myChatScreenList,
            builder: (context, snapShot) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ListView.separated(
                      physics: const ClampingScrollPhysics(),
                      reverse: true,
                      controller: myScrollingController,
                      itemCount: snapShot.data!.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        height: Dimensions.ten,
                      ),
                      itemBuilder: (context, index) {
                        return (snapShot.data![index].id == 0)
                            ? Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 100),
                                child: Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(8),
                                            bottomRight: Radius.circular(8),
                                            topLeft: Radius.circular(8))),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ClipOval(
                                                  child: Image.asset(
                                                Assets.imagesMenPic,
                                                height: 40,
                                                width: 40,
                                              )),
                                            ),
                                           snapShot.data![index].type==1?
                                           Image.file(
                                             File(snapShot.data![index].message)
                                               ,width: 50,height: 50,)
                                               :
                                           Expanded(
                                              child:
                                              Container(
                                                  margin:
                                                      const EdgeInsets.symmetric(
                                                          vertical: 0,
                                                          horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: AppColour.textFieldColor,
                                                      borderRadius:
                                                          BorderRadius.circular(Dimensions.twentyFive) ,
                                                      
                                                      ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20,
                                                            top: 10,
                                                            right: 20,
                                                            bottom: 15),
                                                    child: Text(
                                                      snapShot
                                                          .data![index].message,
                                                      style: TextStyle(color: AppColour.whiteColor.withOpacity(0.7)),
                                                    ),
                                                  )),
                                            )
                                          ],
                                        ),
                                        Align(
                                            child: Padding(
                                          padding: EdgeInsets.only(
                                              right: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3.5),
                                          child: Text(
                                            snapShot.data![index].time,
                                            style: TextStyle(
                                              
                                                fontSize: Dimensions.ten),
                                          ),
                                        )),
                                      ],
                                    )),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.only(left: 100, right: 10),
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            snapShot.data![index].type==1?
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Container(
                                                color:AppColour.themeColor,
                                                padding: EdgeInsets.all(2),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(5),
                                                  child: Image.file(
                                                    File(snapShot.data![index].message)
                                                    ,width: 100,height: 100,),
                                                ),
                                              ),
                                            ):Expanded(
                                              child: Container(
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 0,
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                    color: AppColour
                                                        .textFieldColor,
                                                    borderRadius:
                                                         BorderRadius.circular(Dimensions.twentyFive)

                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20,
                                                            top: 10,
                                                            right: 20,
                                                            bottom: 15),
                                                    child: Text(
                                                      snapShot
                                                          .data![index].message,
                                                      style: TextStyle(
                                                          color: AppColour
                                                              .whiteColor
                                                              .withOpacity(
                                                                  0.7)),
                                                    ),
                                                  )),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ClipOval(
                                                  child: Image.asset(
                                                Assets.imagesMenPic,
                                                height: 40,
                                                width: 40,
                                              )),
                                            ),
                                          ],
                                        ),
                                        Align(
                                            child: Padding(
                                          padding: EdgeInsets.only(
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3.5),
                                          child: Text(
                                            snapShot.data![index].time,
                                            style: TextStyle(
                                              fontSize: Dimensions.ten,
                                            ),
                                          ),
                                        )),
                                      ],
                                    )),
                              );
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF060604),
                       // border: Border.all(color: AppColour.themeColor),
                        borderRadius: BorderRadius.circular(Dimensions.twentyFive)),
                    margin: const EdgeInsets.only(
                        bottom: 20, left: 30, right: 30, top: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(color: AppColour.whiteColor.withOpacity(0.7)),
                            textInputAction: TextInputAction.newline,
                            maxLines: 4,
                            minLines: 1,
                            controller: myController,
                            decoration:  InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 15),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: 'Type your message...',
                              hintStyle: TextStyle(color: AppColour.whiteColor.withOpacity(0.7))
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: ()async{
                              await _controller.updatePic(context);
                              if(_controller.profilepic.value.isNotEmpty)
                                {
                                  sendPhotoValue(_controller.profilepic.value);
                                }
                                },
                                child: Image.asset(Assets.imagesPicphoto,
                                  height: Dimensions.thirty,
                                width: Dimensions.thirty,),
                              ),
                              SizedBox(width: Dimensions.five,),
                              GestureDetector(
                                onTap: sendMessageTextValue,
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset(Assets.imagesSent),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }

  sendMessageTextValue() async {
    if (myController.text.trim().isEmpty) {
      return;
    }
    myChatScreenList.add(ChatScreenModal(
        id: 1,
        message: myController.text,
        time: DateFormat("h:mm a").format(DateTime.now()).toString(),type: 0),
    );
    _mystreamControllerChatScreen.sink.add(myChatScreenList.reversed.toList());
    myScrollingController.animateTo(
        myScrollingController.position.minScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.ease);
    myController.clear();
  }


  sendPhotoValue(String image) async {
    myChatScreenList.add(ChatScreenModal(
        id: 1,
        message: image,
        time: DateFormat("h:mm a").format(DateTime.now()).toString(),
        type: 1),
    );
    _mystreamControllerChatScreen.sink.add(myChatScreenList.reversed.toList());
    myScrollingController.animateTo(
        myScrollingController.position.minScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.ease);
    myController.clear();
  }
}
