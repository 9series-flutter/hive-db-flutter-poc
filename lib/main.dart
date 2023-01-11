import 'package:hive_demo/core/common_import.dart';

late Box box;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  box = await Hive.openBox(AppConfigs.myBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<ProductListBloc>(
          create: (BuildContext context) => ProductListBloc(),
        ),
        BlocProvider<CartListBloc>(
          create: (BuildContext context) =>
              CartListBloc()..add(const GetCartList()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigatorKey.navigatorKey,
        title: AppStrings.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ScreenProductList(),
      ),
    );
  }
}
