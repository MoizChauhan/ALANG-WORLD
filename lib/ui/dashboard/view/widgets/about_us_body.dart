// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../../../utils/app_images.dart';

class AboutUsBody extends StatefulWidget {
  const AboutUsBody({Key? key}) : super(key: key);

  @override
  State<AboutUsBody> createState() => _AboutUsBodyState();
}

class _AboutUsBodyState extends State<AboutUsBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "About Alang World",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "InterMedium",
                  fontSize: 19.62,
                  fontWeight: FontWeight.w500,
                  color: Colors.transparent,
                  shadows: [
                    Shadow(offset: Offset(0, -10), color: Colors.black)
                  ],
                  // decoration: TextDecoration.underline,
                  // decorationColor: Colors.black,
                  // decorationThickness: 2,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Alang Ship Breaking Yard is world's largest ship breaking yard with total wealth of US\$110.6 billion (including total assets since established) it is located at Alang, Bhavnagar, Gujarat, India.",
              style: TextStyle(
                fontFamily: "InterMedium",
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Container(
                  width: 158,
                  height: 116,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      // image: AssetImage("assets/images/side.png"),
                      image: AssetImage(APPImages.imgAboutAlangWorld1),
                      fit: BoxFit.fill
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Text(
                    "Alang Ship Breaking Yard has a total of 183 plots or ship breaking yards. It has total capacity of 4.5 million Light Displacement Tonnage (LDT or weight of a vessel without fuel, cargo, etc).",
                    style: TextStyle(
                      fontFamily: "InterMedium",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "The shipyards at Alang recycle approximately half of all ships salvaged around the world. The governments of Japan and Gujarat have signed a Memorandum of Understanding, which focuses on technology transfer and financial assistance from Japan to assist in the upgrading of operations at Alang Ship Breaking Yard to meet international standards.",
              style: TextStyle(
                fontFamily: "InterMedium",
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    "This is a part of the Delhi Mumbai Industrial Corridor, a larger partnership between the Japanese and Gujarat government. Under this plan, Japan will address the environmental implications of ship ",
                    style: TextStyle(
                      fontFamily: "InterMedium",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 158,
                  height: 116,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      // image: AssetImage("assets/images/side.png"),
                      image: AssetImage(APPImages.imgAboutAlangWorld4),
                      fit: BoxFit.fill
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "breaking in Alang Ship Breaking Yard, and will develop a marketing strategy. The project is to be carried out as a public-private partnership. The project's aim is to make this shipyard the largest International Maritime Organization-compliant ship recycling yard in the world. The ships have always been valuable and even after being recycled, when they are not seaworthy. ship recycling industry has till now processed 8500 ships amounting to 70 Million tonnes.  ",
              style: TextStyle(
                fontFamily: "InterMedium",
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Container(
                  width: 158,
                  height: 116,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      // image: AssetImage("assets/images/side.png"),
                      image: AssetImage(APPImages.imgAboutAlangWorld5),
                      fit: BoxFit.fill
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Text(
                    "This industry provides direct employment to about 50,000 workers and indirect employment to lakhs of workers, by way of re-rolling mills, scrap traders, oxygen gas plants, transporters, real estate ",
                    style: TextStyle(
                      fontFamily: "InterMedium",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5,),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "market and money market. Alang Ship recycling creates a net wage income of Rs 60 crores annually. The Alang ship breaking yard has 3000+ yards who engage in selling ship products. There are wide range & categories of products like Automation Products, Hydraulic Machinery, Drills & Power Tools, Pumps & Compressor, Electric Motors & Components, Marine Boat & Engine, Tools & Spares, Electricals, Consumer Goods, Heavy Machinery, Shafts, Fire Protection & Safety Equipment, Ship Souvenirs & Artifacts, Household Items, Furniture, Sports & Gym Equipment, Stationery, Books & Maps, Art gallery, Ship Navigation, etc.",
              style: TextStyle(
                fontFamily: "InterMedium",
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    "Currently, it’s very difficult for anyone to know about any product if he/she want to purchase from Alang Ship Breaking Yard. The buyer needs to personally visit and practically it’s too much energy &  time",
                    style: TextStyle(
                      fontFamily: "InterMedium",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 158,
                  height: 116,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      // image: AssetImage("assets/images/side.png"),
                      image: AssetImage(APPImages.imgAboutAlangWorld2),
                      fit: BoxFit.fill
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5,),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "consuming to visit 3000+ places and check product. Alang World comes with solution to bring Alang Ship Breaking Yard products on-board to platform so it can be visited any time & place. The key is Alang World play key role to directly connect between seller & buyer with NO CHARGE or HIDDEN COST in any of the transaction.The goal of Alang World is to make Alang Ship Breaking Yard product available globally.",
              style: TextStyle(
                fontFamily: "InterMedium",
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
