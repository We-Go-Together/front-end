import 'package:get_it/get_it.dart';
import 'package:herewego/injector.config.dart';
import 'package:injectable/injectable.dart';

final locator = GetIt.instance;

@InjectableInit()
GetIt configureDependencies() => locator.init();