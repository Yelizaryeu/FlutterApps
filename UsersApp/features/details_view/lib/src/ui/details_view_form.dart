import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:details_view/bloc/details_view/bloc.dart';
import 'package:details_view/src/ui/widgets/user_detail_cache_image_widget.dart';
import 'package:details_view/src/ui/widgets/user_posts_widget.dart';
import 'package:flutter/material.dart';

class DetailsViewForm extends StatefulWidget {
  const DetailsViewForm({super.key});

  @override
  State<DetailsViewForm> createState() => _DetailsFormState();
}

class _DetailsFormState extends State<DetailsViewForm> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext contextWidget) {
    return BlocBuilder<DetailsBloc, DetailsState>(
      builder: (BuildContext context, DetailsState state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.orange,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_5),
              child: Text(
                'Details',
                textAlign: TextAlign.center,
                style: AppFonts.bold26.copyWith(color: AppColors.darkBlack),
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
              child: Container(
            color: AppColors.darkBlack,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: AppDimens.PADDING_30),
                          child: UserDetailCacheImageWidget(
                            width: 100,
                            height: 100,
                            imageUrl: state.user!.avatar ?? '',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: AppDimens.PADDING_8),
                          child: Text(
                            state.user!.name,
                            style: AppFonts.bold28.copyWith(color: AppColors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: AppDimens.PADDING_8),
                          child: Text(
                            "Email: ${state.user!.email}",
                            style: AppFonts.normal20.copyWith(color: AppColors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: AppDimens.PADDING_8),
                          child: Text(
                            "Phone: ${state.user!.phone}",
                            style: AppFonts.normal20.copyWith(color: AppColors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: AppDimens.PADDING_8),
                          child: Column(
                            children: [
                              Text(
                                "Address",
                                style: AppFonts.normal30.copyWith(color: AppColors.white),
                              ),
                              Text(
                                "${state.user!.address["city"]}, ${state.user!.address["street"]}, ${state.user!.address["suite"]}",
                                style: AppFonts.normal14.copyWith(color: AppColors.white),
                              ),
                              Text(
                                "Zipcode: ${state.user!.address["zipcode"]}",
                                style: AppFonts.normal14.copyWith(color: AppColors.white),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: AppDimens.PADDING_8),
                          child: Column(
                            children: [
                              Text(
                                "Company",
                                style: AppFonts.normal30.copyWith(color: AppColors.white),
                              ),
                              Text(
                                "Name: ${state.user!.company["name"]}",
                                style: AppFonts.normal14.copyWith(color: AppColors.white),
                              ),
                              Text(
                                "Catch phrase: ${state.user!.company["catchPhrase"]}",
                                style: AppFonts.normal14.copyWith(color: AppColors.white),
                              ),
                              Text(
                                "Business services: ${state.user!.company["bs"]}",
                                style: AppFonts.normal14.copyWith(color: AppColors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: AppDimens.PADDING_8),
                  child: Text(
                    "POSTS",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 350, maxHeight: 300),
                    child: state.posts != null
                        ? UserPostsWidget(posts: state.posts!)
                        : const Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                  ),
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}
