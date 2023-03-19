// ignore_for_file: strict_raw_type

import 'package:fibotech/app/modules/detail/view/detail_weather.dart';
import 'package:fibotech/app/modules/home/view/home_page.dart';
import 'package:fibotech/app/modules/permission/view/permission_page.dart';
import 'package:fibotech/app/modules/weathers/view/weathers_page.dart';
import 'package:fibotech/core/values/const_page_names.dart';
import 'package:fibotech/data/model/weather_rest_model.dart';
import 'package:flutter/material.dart';

Route<dynamic> Function(RouteSettings) get routes => (RouteSettings settings) {
      Route<dynamic> route;
      switch (settings.name) {
        case PageNames.home:
          route = MaterialPageRoute<dynamic>(
            builder: (_) => const HomePage(),
            settings: RouteSettings(name: settings.name),
          );
          break;

        case PageNames.permission:
          route = MaterialPageRoute<dynamic>(
            builder: (_) => const PermissionPage(),
            settings: RouteSettings(name: settings.name),
          );
          break;
        case PageNames.detail:
          route = MaterialPageRoute<dynamic>(
            builder: (_) =>  DetailWeather(
              weatherModel: settings.arguments as WeatherModel
            ),
            settings: RouteSettings(name: settings.name),
          );
          break;
        case PageNames.weathers:
          route = MaterialPageRoute<dynamic>(
            builder: (_) => const WeathersPage(),
            settings: RouteSettings(name: settings.name),
          );
          break;
        default:
          route = MaterialPageRoute<dynamic>(
            builder: (_) => const PermissionPage(),
            settings: RouteSettings(name: settings.name),
          );
          break;
      }

      return route;
    };
