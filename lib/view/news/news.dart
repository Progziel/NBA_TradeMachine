// ignore_for_file: non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/view/approval/approval.dart';
import 'package:social_embed_webview/platforms/twitter.dart';
import 'package:social_embed_webview/social_embed_webview.dart';

String Post1 = r"""
<blockquote class="twitter-tweet" data-media-max-width="560"><p lang="en" dir="ltr">Who says no to this three-team deal? 🤔<br><br>(via u/maxthegolfer on <a href="https://t.co/EzrHobw7ZV">https://t.co/EzrHobw7ZV</a>) <a href="https://t.co/QfN0UPgxKk">pic.twitter.com/QfN0UPgxKk</a></p>&mdash; Fanspo (@fanspo) <a href="https://twitter.com/fanspo/status/1752747851426226593?ref_src=twsrc%5Etfw">January 31, 2024</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>""";

String Post2 = r"""
<blockquote class="twitter-tweet"><p lang="en" dir="ltr">With the Trade Deadline a week away I’ve started to make some mock trades on Fanspo. Here’s one I’d like to see<br><br>Raptors - Nic Claxton, Davis Bertans, 2025 First round pick<br><br>Nets - Gary Trent Jr, 2024 First round pick, 2024 2nd round pick<br><br>Thunder - Jakob Poeltl<br><br>Why Each team… <a href="https://t.co/bmjlfz2qso">pic.twitter.com/bmjlfz2qso</a></p>&mdash; IKD (@ESPNneedsIKD) <a href="https://twitter.com/ESPNneedsIKD/status/1753170061316255976?ref_src=twsrc%5Etfw">February 1, 2024</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>""";

String Post3 = r"""
<blockquote class="twitter-tweet"><p lang="en" dir="ltr">The Memphis Grizzlies are trading Steven Adams to the Houston Rockets for Victor Oladipo and three second-round picks, sources tell ESPN.</p>&mdash; Adrian Wojnarowski (@wojespn) <a href="https://twitter.com/wojespn/status/1753201914186006775?ref_src=twsrc%5Etfw">February 1, 2024</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>""";

String Post4 = r"""
<blockquote class="twitter-tweet"><p lang="en" dir="ltr">Kuzma to the Kings 🔥<br><br>Who says no? 🤔<br><br>(via <a href="https://twitter.com/BJDunkster?ref_src=twsrc%5Etfw">@BJDunkster</a> / <a href="https://t.co/EzrHobwFPt">https://t.co/EzrHobwFPt</a>) <a href="https://t.co/7KngNFNKZj">pic.twitter.com/7KngNFNKZj</a></p>&mdash; Fanspo (@fanspo) <a href="https://twitter.com/fanspo/status/1753070545367908474?ref_src=twsrc%5Etfw">February 1, 2024</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>""";

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAssets.lightGreyBG,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.height * 0.50),
        child: CustomAppBar2(
            title: 'News',
            prefixIcon: Icons.arrow_back_ios,
            prefixIconOnTap: () {
              Get.back();
              // Handle back button tap
            },
            sufixWidget: const CircleAvatar()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///  CarouselSlider
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(96, 0, 0, 0),
                    borderRadius: BorderRadius.circular(20)),
                child: CarouselSlider(
                    items: const [
                      CustomImageContainer(
                          ImageUrl: 'assets/images/newsplayers.png'),
                      CustomImageContainer(
                          ImageUrl: 'assets/images/newsplayers1.jpg'),
                      CustomImageContainer(
                          fit: BoxFit.cover,
                          ImageUrl: 'assets/images/newsplayers2.png'),
                    ],
                    options: CarouselOptions(
                      viewportFraction: 1,
                    )),
              ),
            ),
            // CarouselSlider close

            const Text("Post/News From X",
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 5),

            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // post 1
                  SocialEmbed(
                      socialMediaObj: TwitterEmbedData(embedHtml: Post1)),

                  const SizedBox(height: 20),
                  // post 2
                  SocialEmbed(
                      socialMediaObj:
                          TwitterEmbedData(embedHtml: Post3)), // post 1
                  const SizedBox(height: 20),
                  // post 3
                  SocialEmbed(
                      socialMediaObj: TwitterEmbedData(embedHtml: Post1)),

                  const SizedBox(height: 20),
                  // post 4
                  SocialEmbed(
                      socialMediaObj: TwitterEmbedData(embedHtml: Post4)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
