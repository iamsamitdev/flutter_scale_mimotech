// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_scale/main.dart';
import 'package:flutter_scale/models/news_model.dart';

Widget newsItemHorizontalList(List<NewsModel> news) {
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: news.length,
      itemBuilder: (context, index) {
        NewsModel newsModel = news[index];

        return Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context, 
                '/newsdetail', 
                arguments: { 'news': newsModel.toJson() }
              );
            },
            child: Card(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    newsModel.imageurl != null
                        ? Container(
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(4),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(newsModel.imageurl!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            newsModel.topic.toString(),
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            newsModel.detail.toString(),
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
