import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:details_view/bloc/details_view/bloc.dart';
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
                        SizedBox(
                          height: 32,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(state.user!.name, style: AppFonts.normal30.copyWith(color: Colors.black)),
                          ],
                        ),
                        // UserDetailCacheImageWidget(
                        //   width: 100,
                        //   height: 100,
                        //   imageUrl: state.user!.avatar ?? '',
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(top: AppDimens.PADDING_30, bottom: AppDimens.PADDING_20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 140,
                                decoration: BoxDecoration(
                                  color: AppColors.black12,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      'Height',
                                      style: TextStyle(
                                        fontSize: 28,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Text(
                                      state.user!.phone,
                                      style: TextStyle(
                                        fontSize: 28,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 140,
                                decoration: BoxDecoration(
                                  color: AppColors.black12,
                                  borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS_8),
                                ),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Weight',
                                      style: TextStyle(
                                        fontSize: 28,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Text(
                                      state.user!.email,
                                      style: const TextStyle(
                                        fontSize: 28,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 300,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(95, 80, 80, 80),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Type',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                state.user!.address.toString(),
                                style: const TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Text(
                  "POSTS",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
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
