import 'package:chef_buddy/constants/assets.dart';
import 'package:chef_buddy/constants/colors.dart';
import 'package:chef_buddy/constants/constants.dart';
import 'package:chef_buddy/widgets/chat_input_box.dart';
import 'package:chef_buddy/widgets/suggestions_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:lottie/lottie.dart';

class ChatScreen extends StatefulWidget {
  final String message;
  final List<String> preQuestions;
  const ChatScreen({
    super.key,
    required this.message,
    required this.preQuestions,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final controller = TextEditingController();
  final gemini = Gemini.instance;
  bool _loading = false;
  ScrollController markDownController = ScrollController();
  bool isFirstSent = false;

  bool get loading => _loading;

  set loading(bool set) => setState(() => _loading = set);
  final List<Content> chats = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      chats.add(Content(role: 'user', parts: [
        Parts(
          text: kChatbotPromt,
        )
      ]));
      chats.add(Content(role: 'model', parts: [Parts(text: 'Got it!')]));

      controller.text = widget.message;
      // if (widget.message.isNotEmpty) {
      //   chats.add(Content(role: 'user', parts: [Parts(text: widget.message)]));
      //   loading = true;

      //   gemini.streamChat(chats).listen((value) {
      //     loading = false;
      //     setState(() {
      //       if (chats.isNotEmpty && chats.last.role == value.content?.role) {
      //         chats.last.parts!.last.text =
      //             '${chats.last.parts!.last.text}${value.output}';
      //       } else {
      //         chats.add(
      //             Content(role: 'model', parts: [Parts(text: value.output)]));
      //       }
      //     });
      //   });
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          leading: const BackButton(color: Colors.white),
          title: Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(kChatbot),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Chef Buddy",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: const Text(
                      "Helping you with recipes!",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
          child: Column(
            children: [
              !isFirstSent
                  ? Expanded(
                      child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'No idea what to ask? Try these!',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          SuggestionWidget(
                            text: widget.preQuestions[0],
                            onTap: () {
                              setState(() {
                                controller.text = widget.preQuestions[0];
                              });
                            },
                            isWeb: false,
                          ),
                          const SizedBox(height: 8),
                          SuggestionWidget(
                            text: widget.preQuestions[1],
                            onTap: () {
                              setState(() {
                                controller.text = widget.preQuestions[1];
                              });
                            },
                            isWeb: false,
                          ),
                          const SizedBox(height: 8),
                          SuggestionWidget(
                            text: widget.preQuestions[2],
                            onTap: () {
                              setState(() {
                                controller.text = widget.preQuestions[2];
                              });
                            },
                            isWeb: false,
                          ),
                          const SizedBox(height: 8),
                          SuggestionWidget(
                            text: widget.preQuestions[3],
                            onTap: () {
                              setState(() {
                                controller.text = widget.preQuestions[3];
                              });
                            },
                            isWeb: false,
                          ),
                        ],
                      ),
                    ))
                  : Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SingleChildScrollView(
                          reverse: true,
                          child: ListView.builder(
                            itemBuilder: chatItem,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: chats.length,
                          ),
                        ),
                      ),
                    ),
              if (loading)
                LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Lottie.asset(
                        'assets/lotties/response_anim.json',
                        height: 70,
                        width: 70,
                      ),
                    );
                  } else {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: kPrimaryColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Typing...',
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                }),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: ChatInputBox(
                  controller: controller,
                  onSend: () {
                    if (controller.text.isNotEmpty) {
                      if (!isFirstSent) {
                        setState(() {
                          isFirstSent = true;
                        });
                      }
                      final searchedText = controller.text;
                      chats.add(
                        Content(
                            role: 'user', parts: [Parts(text: searchedText)]),
                      );
                      controller.clear();
                      loading = true;

                      gemini.streamChat(chats).listen(
                        (value) {
                          // print("-------------------------------");
                          // print(value.output);
                          loading = false;
                          setState(
                            () {
                              if (chats.isNotEmpty &&
                                  chats.last.role == value.content?.role) {
                                chats.last.parts!.last.text =
                                    '${chats.last.parts!.last.text}${value.output}';
                              } else {
                                chats.add(
                                  Content(
                                      role: 'model',
                                      parts: [Parts(text: value.output)]),
                                );
                              }
                            },
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget chatItem(BuildContext context, int index) {
    final Content content = chats[index];
    final bool isMe = content.role != 'model';
    return Visibility(
      // visible if not first 2 messages
      visible: index > 1,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Align(
          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              color: isMe ? kPrimaryColor : kPrimaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Markdown(
                shrinkWrap: true,
                controller: markDownController,
                styleSheet: MarkdownStyleSheet(
                  // listIndent:
                  a: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.normal,
                  ),
                  p: TextStyle(
                    color: isMe ? Colors.white : kPrimaryColor,
                    fontWeight: FontWeight.normal,
                  ),
                  code: const TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.transparent,
                    fontSize: 12,
                  ),
                  codeblockDecoration: BoxDecoration(
                    // glassy effect for gradient
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(41, 41, 41, 0.4),
                        Color.fromRGBO(59, 59, 59, 0.2),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    // backgroundBlendMode: BlendMode.lighten,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                        blurRadius: 2,
                        spreadRadius: 0,
                        offset: Offset(0, 2),
                      ),
                    ],
                    // color: Colors.transparent,
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  h1: TextStyle(
                    color: isMe ? Colors.white : kPrimaryColor,
                  ),
                  h2: TextStyle(
                    color: isMe ? Colors.white : kPrimaryColor,
                  ),
                  h3: TextStyle(
                    color: isMe ? Colors.white : kPrimaryColor,
                  ),
                  h4: TextStyle(
                    color: isMe ? Colors.white : kPrimaryColor,
                  ),
                  h5: TextStyle(
                    color: isMe ? Colors.white : kPrimaryColor,
                  ),
                  h6: TextStyle(
                    color: isMe ? Colors.white : kPrimaryColor,
                  ),
                  em: TextStyle(
                    color: isMe ? Colors.white : kPrimaryColor,
                  ),
                  strong: TextStyle(
                    color: isMe ? Colors.white : kPrimaryColor,
                  ),
                  del: TextStyle(
                    color: isMe ? Colors.white : kPrimaryColor,
                  ),
                  blockquote: TextStyle(
                    color: isMe ? Colors.white : kPrimaryColor,
                  ),
                  img: TextStyle(
                    color: isMe ? Colors.white : kPrimaryColor,
                  ),
                  checkbox: TextStyle(
                    color: isMe ? Colors.white : kPrimaryColor,
                  ),
                  listBullet: TextStyle(
                    color: isMe ? Colors.white : kPrimaryColor,
                  ),
                  tableHead: TextStyle(
                    color: isMe ? Colors.white : kPrimaryColor,
                  ),
                  tableBody: TextStyle(
                    color: isMe ? Colors.white : kPrimaryColor,
                  ),
                ),
                physics: const NeverScrollableScrollPhysics(),
                data: content.parts?.lastOrNull?.text ??
                    'Something went wrong :(',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
