// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/view/search/filter_view.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
        ),
        title: Text(
          "Review",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              DefaultImages.more,
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 20),
              SizedBox(
                height: 38,
                width: Get.width,
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 20),
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: ratingCard(
                        index == 0
                            ? "All"
                            : index == 1
                                ? "5"
                                : index == 2
                                    ? "4"
                                    : index == 3
                                        ? "3"
                                        : index == 4
                                            ? "2"
                                            : index == 5
                                                ? "1"
                                                : "0.0",
                        index == 0
                            ? HexColor(AppTheme.primaryColorString!)
                            : Colors.transparent,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Text(
                      "Rating",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 16),
                    ),
                    const SizedBox(width: 14),
                    const Icon(
                      Icons.star,
                      color: Color(0xffFFD300),
                      size: 15,
                    ),
                    Text(
                      "  4.8  ",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14,
                            color: HexColor(AppTheme.primaryColorString!),
                          ),
                    ),
                    Text(
                      "(4,981 reviews)",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14,
                            color: const Color(0xff757575),
                          ),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      "See All",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 16,
                            color: HexColor(AppTheme.primaryColorString!),
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 0; i < 5; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppTheme.isLightTheme == true
                                ? Theme.of(context).appBarTheme.backgroundColor
                                : const Color(0xff1F222A),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    const Color(0xff04060F).withOpacity(0.05),
                                blurRadius: 8,
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 48,
                                      width: 48,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            i == 0
                                                ? DefaultImages.pr1
                                                : i == 1
                                                    ? DefaultImages.pr2
                                                    : DefaultImages.pr3,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 14),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          i == 0
                                              ? "Jenny Wilson"
                                              : i == 1
                                                  ? "Guy Hawkins"
                                                  : "Kristin Watson",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                fontSize: 16,
                                              ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          i == 0
                                              ? "Dec 10, 2024"
                                              : i == 1
                                                  ? "Dec 10, 2024"
                                                  : "Dec 09, 2024",
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                fontSize: 12,
                                              ),
                                        )
                                      ],
                                    ),
                                    const Expanded(child: SizedBox()),
                                    ratingCard("5.0",
                                        HexColor(AppTheme.primaryColorString!)),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  i == 0
                                      ? "Very nice and comfortable hotel, thank you for accompanying my vacation!"
                                      : i == 0
                                          ? "Very beautiful hotel, my family and I are very satisfied with the service!"
                                          : "The rooms are very comfortable and the natural views are amazing, can't wait to come back again!",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        height: 1.4,
                                        fontSize: 14,
                                      ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
