// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/services/weather_service.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.deepPurple),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFF673AB7)),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: const BoxDecoration(color: Color(0xFFFFAB40)),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: TextField(
                    cursorColor: const Color(0xFFFFC91B),
                    onChanged: (name) {
                      setState(() {
                        cityName = name;
                      });
                    },
                    onSubmitted: (data) async {
                      cityName = data;
                      WeatherService service = WeatherService();
                      WeatherModel? weather =
                          await service.getWeather(cityName: cityName!);
                      Provider.of<WeatherProvider>(context, listen: false)
                          .weatherModelProvider = weather;
                      Navigator.pop(context);
                    },
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          color: Color(0xFFFFC91B),
                          width: 2,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      label: const Text("Search"),
                      labelStyle: const TextStyle(
                        fontSize: 24,
                        fontFamily: "havelocktitling",
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFC91B),
                      ),
                      hintText: "Enter The City",
                      hintStyle: const TextStyle(
                        color: Colors.white60,
                        fontFamily: "havelocktitling",
                        fontSize: 16,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () async {
                          WeatherService service = WeatherService();
                          WeatherModel? weather =
                              await service.getWeather(cityName: cityName!);
                          Provider.of<WeatherProvider>(context, listen: false)
                              .weatherModelProvider = weather;
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.search),
                        color: const Color(0xFFFFC91B),
                        padding: const EdgeInsets.only(right: 32),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String? cityName;
