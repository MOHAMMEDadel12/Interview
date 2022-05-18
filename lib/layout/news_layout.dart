import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/business/business.dart';
import 'package:news_app/modules/science/science.dart';
import 'package:news_app/modules/sports/sports.dart';
import 'package:news_app/shared/styles/colors.dart';


class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {

          return DefaultTabController(
            length: 3,
            child: Scaffold(

              appBar: AppBar(
                title: Text('News App'),
                centerTitle: true,
                bottom: TabBar(
                  labelColor: defaultColor,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.work , color: defaultColor),
                      child: Text('Business'),
                    ),
                    Tab(
                      icon: Icon(Icons.sports),
                      child: Text('Sports'),

                    ),
                    Tab(
                      icon: Icon(Icons.science),
                      child: Text('Science'),

                    ),

                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  BusinessScreen(),
                  SportsScreen(),
                  SciencesScreen(),

                ],
              ),
            ),
          );
        },
      );
  }
}
