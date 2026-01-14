import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:markethub/constants/error_handling.dart';
import 'package:markethub/constants/global_variables.dart';
import 'package:markethub/constants/utils.dart';
import 'package:markethub/models/service_models.dart';
import 'package:markethub/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HubServices {
  Future<Map<String, List<TravelDeal>>> fetchTravelDeals({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    Map<String, List<TravelDeal>> travelDeals = {
      'flights': [],
      'buses': [],
      'trains': [],
    };
    try {
      http.Response res = await http.get(
        Uri.parse('${GlobalVariables.uri}/api/travel/deals'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      if (!context.mounted) return travelDeals;

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          var data = jsonDecode(res.body);
          for (var item in data['flights']) {
            travelDeals['flights']!.add(TravelDeal.fromMap(item));
          }
          for (var item in data['buses']) {
            travelDeals['buses']!.add(TravelDeal.fromMap(item));
          }
          for (var item in data['trains']) {
            travelDeals['trains']!.add(TravelDeal.fromMap(item));
          }
        },
      );
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.toString());
      }
    }
    return travelDeals;
  }

  Future<List<HomeService>> fetchHomeServices({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<HomeService> servicesList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('${GlobalVariables.uri}/api/services/home'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      if (!context.mounted) return servicesList;

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            servicesList.add(
              HomeService.fromMap(jsonDecode(res.body)[i]),
            );
          }
        },
      );
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.toString());
      }
    }
    return servicesList;
  }

  Future<List<HealthProvider>> fetchHealthConsultations({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<HealthProvider> doctorsList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('${GlobalVariables.uri}/api/health/consultations'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      if (!context.mounted) return doctorsList;

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            doctorsList.add(
              HealthProvider.fromMap(jsonDecode(res.body)[i]),
            );
          }
        },
      );
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.toString());
      }
    }
    return doctorsList;
  }

  Future<List<JobListing>> fetchJobListings({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<JobListing> jobsList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('${GlobalVariables.uri}/api/careers/jobs'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      if (!context.mounted) return jobsList;

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            jobsList.add(
              JobListing.fromMap(jsonDecode(res.body)[i]),
            );
          }
        },
      );
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.toString());
      }
    }
    return jobsList;
  }

  Future<List<RealEstateProperty>> fetchProperties({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<RealEstateProperty> propertiesList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('${GlobalVariables.uri}/api/real-estate/properties'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      if (!context.mounted) return propertiesList;

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            propertiesList.add(
              RealEstateProperty.fromMap(jsonDecode(res.body)[i]),
            );
          }
        },
      );
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.toString());
      }
    }
    return propertiesList;
  }
}
