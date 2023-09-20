import 'package:flutter/material.dart';
import 'package:shop/modules/shop/login/Shop_login_screen.dart';
import 'package:shop/shared/network/local/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../shared/styles/colors.dart';

class BoardingModel{
  final String ? image;
  final String ? title;
  final String ? body;

  BoardingModel({required this.image, required this.title, required this.body});

}


class OnBoardingScreen extends StatefulWidget {
   OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
   var boardcontroller = PageController();

List<BoardingModel>boarding = [
  BoardingModel(
      image: 'assets/images/onboard1.jpg',
      title: 'On Board 1 Title',
      body: 'On Board 1 Body'),
  BoardingModel(
      image: 'assets/images/onboard1.jpg',
      title: 'On Board 2 Title',
      body: 'On Board 2 Body'),
  BoardingModel(
      image: 'assets/images/onboard1.jpg',
      title: 'On Board 3 Title',
      body: 'On Board 3 Body'),

  ];
bool isLast=false;
void submit(){
  CacheHelper.saveData(key: 'onBoarding', value: 'true').then((value) {
    if(value!){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ShopLoginScreen()));

    }
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(onPressed: (){
              submit();
    },child:Text('SKIP'))
          ],
        ),
        body:Padding(padding:EdgeInsets.all(30),child:
    Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index){
                  if (index==boarding.length-1)
                    {
                      setState(() {
                        isLast= true;
                      });
                    }else{
                    setState(() {
                      isLast= false;
                    });
                  }
                },
                physics: BouncingScrollPhysics(),
                controller: boardcontroller,

                itemBuilder: (context, index) => BuildBordingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: boardcontroller,
                    count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                    expansionFactor: 4,
                    spacing: 5,
                    activeDotColor: defaultColor

                  ),
                ),
              Spacer(),
              FloatingActionButton(onPressed: (){
                if(isLast){
                  submit();
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>ShopLoginScreen()));
                }else{
                boardcontroller.nextPage(
                    duration:
                    Duration(milliseconds: 750),
                    curve: Curves.fastLinearToSlowEaseIn
                );}
              },child: Icon(
                  Icons.arrow_forward_ios
              ),)
              ],
            )
          ],
        )));
  }

  Widget BuildBordingItem( BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Expanded(
            child: Image(image: AssetImage('${model.image}'),),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            '${model.title}',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
             '${model.body}',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),

          // PageView.builder(itemBuilder:(context,index)=>)
        ],
      );
}
