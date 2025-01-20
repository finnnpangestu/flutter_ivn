import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ivn/app/features/auth/presentation/controllers/auth_cubit.dart';
import 'package:flutter_ivn/app/features/main/presentation/controllers/main_cubit.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_detail_controller/product_detail_cubit.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_list_controller/product_list_cubit.dart';

class BlocProviders {
  static List<BlocProvider> get providers => [
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
        BlocProvider<MainCubit>(create: (context) => MainCubit()),
        BlocProvider<ProductListCubit>(create: (context) => ProductListCubit()),
        BlocProvider<ProductDetailCubit>(create: (context) => ProductDetailCubit()),
      ];
}
