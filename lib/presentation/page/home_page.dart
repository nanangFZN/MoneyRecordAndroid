import 'package:d_chart/d_chart.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money/config/app_asset.dart';
import 'package:money/config/session.dart';
import 'package:money/presentation/controller/c_user.dart';

import '../../config/app_color.dart';
import 'auth/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cUser = Get.put(CUser());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      endDrawer: Drawer(),
      
      body:Column(
        children:[
          Padding(
            padding: const EdgeInsets.fromLTRB(20,50,20,30),
            child: Row(children: [
              Image.asset(AppAsset.profile),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text("Hi,",
                      style:TextStyle(
                        fontWeight:FontWeight.bold,
                        fontSize:20,
                        color:AppColor.primary
                      )
                      ),
                      Obx(
                         (){
                          return Text(cUser.data.name ?? '',
                          style:TextStyle(
                        fontWeight:FontWeight.bold,
                        fontSize:20,
                        color:AppColor.primary
                      )
                          );
                        }
                      )
                    ]
                  ),
                ),
              ),
              Builder(
                builder: (ctx) {
                  return Material(
                    borderRadius: BorderRadius.circular(10),
                    color:AppColor.primary,
                    child:InkWell(
                      onTap: (){
                        Scaffold.of(ctx).openEndDrawer();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(Icons.menu,color:AppColor.third),
                      ))
                  );
                }
              )
            ],),
          ),

          Expanded(child: ListView(
            padding: EdgeInsets.fromLTRB(20,0,20,30),
            children:[
              Text("Outcome Today",
              style:Theme.of(context).textTheme.headline5!.copyWith(
                fontWeight: FontWeight.bold,
                color:AppColor.primary
              )
              ),
              DView.spaceHeight(),
              CardToday(context),
              DView.spaceHeight(30),
              Center(
                child: Container(
                  height:5,
                  width:50,
                  decoration: BoxDecoration(
                    color:AppColor.primary,
                    borderRadius: BorderRadius.circular(15)
                  ),
                ),
              ),
              DView.spaceHeight(30),
              Text("Outcome This Week",
              style:Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.bold,
                color:AppColor.primary

              )
              ),
              DView.spaceHeight(),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartBar(
                          data: [
                              {
                                  'id': 'Bar',
                                  'data': [
                                      {'domain': '2020', 'measure': 3},
                                      {'domain': '2021', 'measure': 4},
                                      {'domain': '2022', 'measure': 6},
                                      {'domain': '2023', 'measure': 0.3},
                                  ],
                              },
                          ],
                          domainLabelPaddingToAxisLine: 16,
                          axisLineTick: 2,
                          axisLinePointTick: 2,
                          axisLinePointWidth: 10,
                          axisLineColor: AppColor.primary,
                          measureLabelPaddingToAxisLine: 16,
                          barColor: (barData, index, id) => AppColor.primary,
                          showBarValue: true,
                      ),
              ),
              DView.spaceHeight(),
              Text("Comparison This Month",
              style:Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.bold,
                color:AppColor.primary

              )
              ),
              Row(
                children: [
                  
                  SizedBox(
                    width:MediaQuery.of(context).size.width*0.5,
                    height:MediaQuery.of(context).size.width*0.5,
                    child: Stack(
                      children: [
                        DChartPie(
                            data: [
                                {'domain': 'Flutter', 'measure': 28},
                                {'domain': 'React Native', 'measure': 27},
                                {'domain': 'Ionic', 'measure': 20},
                                {'domain': 'Cordova', 'measure': 15},
                            ],
                            fillColor: (pieData, index) => AppColor.fourth,
                            donutWidth: 30,
                            labelColor: AppColor.primary,
                        ),
                        Center(child: Text("60 %",
                        style:Theme.of(context).textTheme.headline4!.copyWith(
                fontWeight: FontWeight.bold,
                color:AppColor.primary

              )
                        ))
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children:[
                      Row(
                        children: [
                          Container(
                            width:16,
                            height:16,
                            color:AppColor.primary
                          ),
                          DView.spaceWidth(8),
                          Text("Income",
                          style:TextStyle(
                          fontWeight: FontWeight.bold,
                          color:AppColor.primary

                            )
                          )
                        ],
                      ),
                      DView.spaceHeight(8),
                       Row(
                        children: [
                          Container(
                            width:16,
                            height:16,
                            color:AppColor.secondary
                          ),
                          DView.spaceWidth(8),
                          Text("Outcome",
                          style:TextStyle(
                          fontWeight: FontWeight.bold,
                          color:AppColor.primary

                            )
                          )
                        ],
                      ),
                      DView.spaceHeight(20),
                      Text("Income",
                      style:TextStyle(
                        color:AppColor.primary
                      ),
                      ),
                      Text("Is Greater 20%",
                      style:TextStyle(
                        color:AppColor.primary
                      )
                      ),
                      Text("Than Expenditure",
                      style:TextStyle(
                        color:AppColor.primary
                      )
                      ),
                      DView.spaceHeight(10),
                      Text("Or Equivalent",
                      style:TextStyle(
                        color:AppColor.primary
                      )
                      ),
                      Text("Rp 20.000,00",
                      style:TextStyle(
                        color:AppColor.primary
                      )
                      )
                    ]
                  )
                ],
              ),
            ]
          ))             
            ]
          )
    );
  }

  Material CardToday(BuildContext context) {
    return Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 4,
              color:AppColor.primary,
              child:Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children:[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16,20,16,4),
                    child: Text("Rp 500.000,00",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight:FontWeight.bold,
                      color:AppColor.third
                    ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
                    child: Text("+20% from yesterday",
                    style:TextStyle(
                      fontSize:16,
                      color:AppColor.fourth
                    )
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 0, 0, 16),
                    padding: EdgeInsets.symmetric(vertical:8),
                    decoration:const BoxDecoration(
                      color:AppColor.fourth,
                      borderRadius:BorderRadius.only(
                        topLeft:Radius.circular(8),
                        bottomLeft:Radius.circular(8)
                      )
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:[
                        Text("See More",
                        style:TextStyle(
                          fontWeight:FontWeight.bold,
                          color:AppColor.primary
                        )
                        ),
                        Icon(Icons.navigate_next)
                      ]
                    )
                  )
                ]
              )
            );
  }
}