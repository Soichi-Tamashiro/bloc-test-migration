import 'package:bloc_test/blocs/blocs.dart';
import 'package:bloc_test/config/app_router.dart';
import 'package:bloc_test/config/theme.dart';
import 'package:bloc_test/screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'repositories/repositories.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            // paymentBloc: context.read<PaymentBloc>(),
            checkoutRepository: CheckoutRepository(),
          ),
        ),
        BlocProvider(create: (_) => WishlistBloc()..add(LoadWishlist())),
        BlocProvider(create: (_) => CartBloc()..add(LoadCart())),
        BlocProvider(
          create: (_) => CategoryBloc(
            categoryRepository: CategoryRepository(),
          )..add(
              LoadCategories(),
            ),
        ),
        BlocProvider(
          create: (_) => ProductBloc(
            productRepository: ProductRepository(),
          )..add(LoadProducts()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter bloc ecommerce',
        theme: theme(),
        debugShowCheckedModeBanner: true,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
