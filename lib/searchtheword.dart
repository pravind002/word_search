import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wordsearch_game/helper.dart';

class Searchwords extends StatefulWidget {
  final List data;
  const Searchwords({super.key, required this.data});

  @override
  State<Searchwords> createState() => _SearchwordsState();
}

class _SearchwordsState extends State<Searchwords> {
  var search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Words")),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: int.parse(AllData.row.text),
              ),
              itemCount: widget.data.length,
              // int.parse(AllData.column.text) * int.parse(AllData.row.text),
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: (search.text
                                  .split('')
                                  .contains(widget.data[index][index]))
                              ? Colors.blue
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        widget.data[index][index].toString(),
                        style: const TextStyle(color: Colors.black),
                      ))),
                );
              },
            ),
          ),
          Column(
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: search,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: "Please Enter Words",
                ),
              ),
              MaterialButton(
                onPressed: () {
                  log(search.text.split('').toString());
                },
                color: Colors.blue,
                child: const Text(
                  "Search",
                  style: TextStyle(color: Colors.white),
                ),
                // height: 60,
              )
            ],
          )
        ],
      ),
    );
  }
}
