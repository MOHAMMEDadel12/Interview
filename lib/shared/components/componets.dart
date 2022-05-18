import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/web_view.dart';
import 'package:news_app/shared/styles/colors.dart';

import 'package:share/share.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher_string.dart';


Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

void openURL(String link) async {
  var urlLink = link;
  if (await canLaunchUrlString(urlLink)) {
    await launchUrlString(urlLink);
  } else {
    await launchUrlString(urlLink);
  }
}

void shareURL(String link) async {
  Share.share(link);
}

void copyURL(String link) async {
  FlutterClipboard.copy(link);
}

Widget buildArticleItem(article, context) => InkWell(
      onTap: () {
        navigateTo(
          context,
          WebViewScreen(article['url']),
        );
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage('${article['urlToImage']}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [


                        Card(

                          child: Container(
                            
                            width: 120,
                            color: defaultColor,
                            child: Center(
                              child: Text(
                                '${article['publishedAt']}'.substring(0,10),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18 ,

                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Card(
                          color: Colors.grey,
                          child: Text(
                            '${article['publishedAt']}'.substring(11,16),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18 ,
                            ),
                          ),
                        ),
                        Spacer(),
                        CircleAvatar(
                          child: IconButton(
                              onPressed: () {
                                shareURL(
                                    "$article['url']");
                              },
                              icon: Icon(
                                Icons.share,
                                size: 20,
                                color: Colors.black,
                              )),
                          backgroundColor:
                          Colors.grey.shade400,
                        ),
                        SizedBox(width: 15,),
                        CircleAvatar(
                          child: IconButton(
                              onPressed: () {
                               copyURL(
                                    "$article['url']");
                                showTopSnackBar(
                                    context, Center(
                                  child: Container(
                                    height: 70,
                                    width: 150,
                                    child: CustomSnackBar.info(
                                      backgroundColor: Colors.black,
                                      message: "Copied Link !",
                                    ),
                                  ),
                                ));
                              },
                              icon: Icon(Icons.copy,size: 20,
                                color: Colors.black,)),
                          backgroundColor: Colors.grey.shade400,

                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

Widget articleBuilder(list, context,) {
  if (list.length > 0) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => buildArticleItem(list[index], context),
      separatorBuilder: (context, index) => myDivider(),
      itemCount: 10,
    );
  } else {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );








