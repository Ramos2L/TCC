import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tcc_gestao_gado/app/core/models/cattle_model.dart';
import 'package:tcc_gestao_gado/app/core/storage/cattle_storage.dart';
import 'package:tcc_gestao_gado/app/core/storage/user_storage.dart';
import 'package:tcc_gestao_gado/app/core/ui/theme/app_theme.dart';
import 'package:tcc_gestao_gado/app/modules/app_routes.dart';
import 'package:tcc_gestao_gado/app/modules/auth/login/repositories/login_repository.dart';
import 'package:tcc_gestao_gado/app/modules/auth/login/repositories/login_repository_impl.dart';
import 'package:tcc_gestao_gado/app/modules/auth/recuperate/repositories/recuperate_repository.dart';
import 'package:tcc_gestao_gado/app/modules/auth/recuperate/repositories/recuperate_repository_impl.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/repositories/register_repository.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/repositories/register_repository_impl.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository_impl.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton<FlutterSecureStorage>((i) => const FlutterSecureStorage()),
        Bind.lazySingleton<UserStore>((i) => UserStore(storage: i())),
        Bind.lazySingleton<CattleStore>((i) => CattleStore(storage: i())),
        Bind.lazySingleton<CattleModel>((i) => CattleModel()),
        Bind.lazySingleton<FirebaseAuth>((i) => FirebaseAuth.instance),
        Bind.lazySingleton<FirebaseFirestore>((i) => FirebaseFirestore.instance),
        Bind.lazySingleton<FirebaseStorage>((i) => FirebaseStorage.instance),
        Bind.lazySingleton<MainRepository>(
            (i) => MainRepositoryImpl(firebaseFirestore: i(), storage: i())),
        Bind.lazySingleton<LoginRepository>(
          (i) => LoginRepositoryImpl(
            userStore: i(),
            firebaseAuth: i(),
            firebaseFirestore: i(),
            cattleStore: i(),
          ),
        ),
        Bind.lazySingleton<RegisterRepository>(
          (i) => RegisterRepositoryImpl(
            firebaseAuth: i(),
            firebaseFirestore: i(),
          ),
        ),
        Bind.lazySingleton<RecuperateRepository>(
          (i) => RecuperateRepositoryImpl(firebaseAuth: i()),
        ),
      ],
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Gestão de Gado",
          theme: AppTheme.theme,
          localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
          supportedLocales: const [Locale('pt'), Locale('en')],
          initialRoute: '/',
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
