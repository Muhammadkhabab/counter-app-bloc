import 'dart:async';
import 'dart:io';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whitecodel_reels/whitecodel_reels.dart';

class ReelsApp extends StatefulWidget {
  const ReelsApp({super.key});

  @override
  State<ReelsApp> createState() => _ReelsAppState();
}

class _ReelsAppState extends State<ReelsApp> {
  //todo: in this screen only implmentaiton bloc other requirements can be complete for the bloc
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Reels App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: WhiteCodelReels(
              key: UniqueKey(),
              context: context,
              loader: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
              isCaching: true,
              videoList: List.generate(
                10,
                (index) => 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
              ),
              builder: (context, index, child, videoPlayerController, pageController) {
                bool isReadMore = false;
                StreamController<double> videoProgressController = StreamController<double>();
                videoPlayerController.addListener(
                  () {
                    double videoProgress = videoPlayerController.value.position.inMilliseconds / videoPlayerController.value.duration.inMilliseconds;
                    videoProgressController.add(videoProgress);
                  },
                );

                return Stack(
                  children: [
                    child,
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StatefulBuilder(
                            builder: (context, setState) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isReadMore = !isReadMore;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.black.withValues(alpha: 0.0),
                                        Colors.black.withValues(alpha: 0.2),
                                        Colors.black.withValues(alpha: 0.5),
                                      ],
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        constraints: const BoxConstraints(
                                          maxHeight: 300,
                                        ),
                                        child: SingleChildScrollView(
                                          child: Padding(
                                            padding: const EdgeInsets.only(right: 50, left: 10),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Lorem ipsum dolor sit amet, consecrate adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                                maxLines: isReadMore ? 100 : 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.roboto(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 50, left: 10),
                                        child: Visibility(
                                          visible: true,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Visibility(
                                                  visible: true,
                                                  child: InkWell(
                                                    onTap: () {},
                                                    child: RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          const TextSpan(
                                                            text: '1000',
                                                            style: TextStyle(
                                                              color: Colors.white70,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: " Likes",
                                                            style: GoogleFonts.roboto(
                                                              color: Colors.white,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 70,
                      right: 10,
                      child: SizedBox(
                        height: 450,
                        // color: Colors.red.withOpacity(0.5),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    true ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
                                    color: Color.fromARGB(
                                      255,
                                      214,
                                      183,
                                      8,
                                    ),
                                  ),
                                  color: Colors.white,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    '10K',
                                    style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    false ? Icons.favorite : Icons.favorite_border,
                                    color: Colors.red,
                                  ),
                                  color: Colors.white,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    '10K',
                                    style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) => CommentSection(),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.comment,
                                    color: Colors.white,
                                  ),
                                ),
                                InkWell(
                                  child: Text(
                                    '10K',
                                    style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.share,
                                    color: Colors.white,
                                  ),
                                  color: Colors.white,
                                ),
                                Text(
                                  'Share',
                                  style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    false ? Icons.bookmark : Icons.bookmark_border,
                                    color: Colors.white,
                                  ),
                                  color: Colors.white,
                                ),
                                Text(
                                  'Save',
                                  style: GoogleFonts.roboto(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    StreamBuilder(
                      stream: videoProgressController.stream,
                      builder: (context, snapshot) {
                        return Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: SliderComponentShape.noThumb,
                              overlayShape: SliderComponentShape.noOverlay,
                              trackHeight: 2,
                            ),
                            child: Slider(
                              value: (snapshot.data ?? 0).clamp(0.0, 1.0),
                              min: 0.0,
                              max: 1.0,
                              activeColor: Colors.red,
                              inactiveColor: Colors.white,
                              onChanged: (value) {
                                final position = videoPlayerController.value.duration.inMilliseconds * value;
                                videoPlayerController.seekTo(Duration(milliseconds: position.toInt()));
                              },
                              onChangeEnd: (value) {
                                videoPlayerController.play();
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            color: Colors.black,
            padding: EdgeInsets.only(
              top: 10,
              bottom: Platform.isIOS ? 20 : 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_box,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.account_box,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommentSection extends StatefulWidget {
  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List<Map<String, String>> comments = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: CommentBox(
        userImage: CommentBox.commentImageParser(
          imageURLorPath: "assets/user_profile.png",
        ),
        labelText: 'Write a comment...',
        errorText: 'Comment cannot be blank',
        withBorder: false,
        sendButtonMethod: () {
          if (formKey.currentState!.validate()) {
            setState(() {
              comments.insert(0, {
                'name': 'User',
                'pic': 'assets/user_profile.png',
                'message': commentController.text,
                'date': DateTime.now().toString(),
              });
            });
            commentController.clear();
            FocusScope.of(context).unfocus();
          }
        },
        formKey: formKey,
        commentController: commentController,
        backgroundColor: Colors.blue,
        textColor: Colors.black,
        sendWidget: Icon(Icons.send, size: 30, color: Colors.blue),
        child: commentList(),
      ),
    );
  }

  Widget commentList() {
    return ListView(
      children: comments.map((comment) {
        return ListTile(
          leading: GestureDetector(
            onTap: () {},
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: CommentBox.commentImageParser(
                  imageURLorPath: comment['pic']!,
                ),
              ),
            ),
          ),
          title: Text(
            comment['name']!,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(comment['message']!),
          trailing: Text(
            comment['date']!,
            style: TextStyle(fontSize: 10),
          ),
        );
      }).toList(),
    );
  }
}
