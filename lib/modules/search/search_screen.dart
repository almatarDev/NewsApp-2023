import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/cubit.dart';
import 'package:newsapp/layout/cubit/states.dart';
import 'package:newsapp/shared/component.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
          ),
          body: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
                child: defaultFormField(
                    controller: searchController,
                    type: TextInputType.text,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'search must not be empty';
                      }
                      return null;
                    },
                    label: 'Search',
                    prefix: Icons.search,
                    onChange: (value) {
                      NewsCubit.get(context).getSearch(value.toLowerCase());
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: articleBuilder(list, context, isSearch: true),
              ),
            ],
          ),
        );
      },
    );
  }
}
