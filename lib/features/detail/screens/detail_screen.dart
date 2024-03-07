import 'package:auto_route/auto_route.dart';
import 'package:crud_flutter/features/detail/bloc/detail_bloc.dart';
import 'package:crud_flutter/features/features.dart';
import 'package:crud_flutter/utils/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          locator.get<DetailBloc>()..add(OnGetUserDetailEvent(id: id)),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(Constants.detail),
        ),
        body: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            return state.when(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loaded: (user) => SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTitleWidget(title: Constants.name),
                          const SizedBox(height: 8),
                          Text(user.name),
                          const SizedBox(height: 8),
                          const CustomTitleWidget(title: Constants.lastname),
                          const SizedBox(height: 8),
                          Text(user.lastname),
                          const SizedBox(height: 8),
                          const CustomTitleWidget(title: Constants.email),
                          const SizedBox(height: 8),
                          Text(user.email),
                          const SizedBox(height: 8),
                          const CustomTitleWidget(title: Constants.phone),
                          const SizedBox(height: 8),
                          Text(user.phone.toString()),
                          const SizedBox(height: 8),
                          const CustomTitleWidget(title: Constants.dateOfBirth),
                          const SizedBox(height: 8),
                          Text(user.dateOfBirth),
                          const SizedBox(height: 8),
                          const CustomTitleWidget(title: Constants.state),
                          const SizedBox(height: 8),
                          Text(user.isActive
                              ? Constants.active
                              : Constants.inactive),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              error: (error) => Center(
                child: Text(error),
              ),
            );
          },
        ),
      ),
    );
  }
}
