// ignore_for_file: non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/circular_profile_avatar.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/models/TwitterpostModel.dart';
import 'package:nbatrade/view/approval/approval.dart';
import 'package:social_embed_webview/platforms/twitter.dart';
import 'package:social_embed_webview/social_embed_webview.dart';



List<NewsPostModel> newsPosts = [
  NewsPostModel(
    imageUrl: 'assets/images/newsplayers.png',
    embedHtml: r"""
      <blockquote class="twitter-tweet" data-media-max-width="560">
        <p lang="en" dir="ltr">Who says no to this three-team deal? 🤔<br><br>(via u/maxthegolfer on <a href="https://t.co/EzrHobw7ZV">https://t.co/EzrHobw7ZV</a>) <a href="https://twitter.com/fanspo/status/1752747851426226593?ref_src=twsrc%5Etfw">January 31, 2024</a></p>
      </blockquote>
      <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
    """,
  ),
  NewsPostModel(
    imageUrl: 'assets/images/newsplayers1.jpg',
    embedHtml: r"""
      <blockquote class="twitter-tweet">
        <p lang="en" dir="ltr">With the Trade Deadline a week away I’ve started to make some mock trades on Fanspo. Here’s one I’d like to see<br><br>Raptors - Nic Claxton, Davis Bertans, 2025 First round pick<br><br>Nets - Gary Trent Jr, 2024 First round pick, 2024 2nd round pick<br><br>Thunder - Jakob Poeltl<br><br>Why Each team… <a href="https://twitter.com/ESPNneedsIKD/status/1753170061316255976?ref_src=twsrc%5Etfw">February 1, 2024</a></p>
      </blockquote>
      <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
    """,
  ),
  NewsPostModel(
    imageUrl: 'assets/images/newsplayers2.png',
    embedHtml: r"""
      <blockquote class="twitter-tweet">
        <p lang="en" dir="ltr">Kuzma to the Kings 🔥<br><br>Who says no? 🤔<br><br>(via <a href="https://twitter.com/BJDunkster?ref_src=twsrc%5Etfw">@BJDunkster</a> / <a href="https://twitter.com/fanspo/status/1753070545367908474?ref_src=twsrc%5Etfw">February 1, 2024</a>) <a href="https://twitter.com/fanspo/status/1753070545367908474?ref_src=twsrc%5Etfw">pic.twitter.com/7KngNFNKZj</a></p>
      </blockquote>
      <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
    """,
  ),
];

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate a delay to represent loading from an external source
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: Get.height * 0.19,
              flexibleSpace: FlexibleSpaceBar(
                background: PreferredSize(
                  preferredSize: Size.fromHeight(Get.height * 0.50),
                  child: CustomAppBar2(
                    title: 'News',
                    prefixIcon: Icons.arrow_back_ios,
                    prefixIconOnTap: () {
                      Get.back();
                      // Handle back button tap
                    },
                    sufixWidget: const CircularProfilePictureAvatar(),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 4),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(96, 0, 0, 0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: CarouselSlider(
                          items: newsPosts.map((post) {
                            return CustomImageContainer(
                              ImageUrl: post.imageUrl,
                            );
                          }).toList(),
                          options: CarouselOptions(
                            viewportFraction: 1,
                          ),
                        ),
                      ),
                    ),
                    const Text("Post/News From X",
                        style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: _isLoading
                          ? const CircularProgressIndicator()
                          : Column(
                              children: newsPosts.map((post) {
                                return Column(
                                  children: [
                                    SocialEmbed(
                                      socialMediaObj: TwitterEmbedData(
                                          embedHtml: post!.embedHtml),
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                );
                              }).toList(),
                            ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

// slider image---------------      custom image container
class CustomImageContainer extends StatelessWidget {
  const CustomImageContainer({
    super.key,
    this.width,
    this.height,
    this.applyImageRadius = true,
    this.border,
    this.background,
    this.fit,
    this.borderRadius = 20,
    this.isNetworkImage = false,
    required this.ImageUrl,
  });
  final double? width, height;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? background;
  final BoxFit? fit;
  final double borderRadius;
  final bool isNetworkImage;
  final String ImageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: Image(
                fit: fit,
                image: isNetworkImage
                    ? NetworkImage(ImageUrl)
                    : AssetImage(ImageUrl) as ImageProvider)));
  }
}
