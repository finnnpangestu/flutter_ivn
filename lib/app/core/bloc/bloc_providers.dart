import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_detail_controller/product_detail_bloc.dart';
import 'package:flutter_ivn/app/features/product/presentation/controllers/product_list_controller/product_list_bloc.dart';

class BlocProviders {
  static List<BlocProvider> get providers => [
        BlocProvider<ProductListBloc>(create: (context) => ProductListBloc()),
        BlocProvider<ProductDetailBloc>(create: (context) => ProductDetailBloc()),
      ];
}
