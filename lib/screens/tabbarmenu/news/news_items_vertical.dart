// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_scale/models/news_model.dart';

Widget NewsItemVerticalList(List<NewsModel> news) {
  return ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: news.length,
    itemBuilder: (context, index) {
      
      NewsModel newsModel = news[index];

      return ListTile(
        onTap: () {
          Navigator.pushNamed(
            context, 
            '/newsdetail', 
            arguments: { 'news': newsModel.toJson() }
          );
        },
        leading: Image.network(newsModel.imageurl!),
        title: Text(
          newsModel.topic.toString(),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          newsModel.detail.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      );
    }
  );
}