import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertask/features/questions/presentation/bloc/questions/questions_bloc.dart';
import 'package:fluttertask/features/questions/presentation/bloc/questions/questions_event.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/questions/presentation/pages/questions_page.dart';
import 'injection_container.dart' as di;
import 'cors/app_theme.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=>di.sl<QuestionsBloc>()..add(GetAllQuestionsEvent())),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            home:QuestionsPage()
        )
    );
  }
}
