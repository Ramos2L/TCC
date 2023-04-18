import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/circle_avatar_widget.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  final _firebaseAuth = FirebaseAuth.instance;

  String? nome = '';
  String? email = '';

  getUser() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    print('Id: user ${users.id}');
    //print(users.doc(users.id).snapshots());
    User? user = _firebaseAuth.currentUser;
    user?.uid;
    print('teste ${user?.uid}');
    String? uid = user?.uid;
    users.doc(uid).get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document exists on the database');
      } else {
        print('object');
      }
    });

    users.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        print(doc["phone"]);
      }
    });

    setState(() {
      // nome = user!.displayName;
      // print('usuario: $nome');

      email = user!.email;
      print('usuario: $email');
    });
  }

  @override
  Widget build(BuildContext context) {
    getUser();
    return Drawer(
      backgroundColor: context.colors.background,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: context.colors.background,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatarWidget(
                  width: 75,
                  height: 75,
                  image: context.images.introImage1,
                ),
                Text(
                  'nome!',
                  style: context.textStyles.textLight.copyWith(
                    color: context.colors.secondary,
                    fontSize: 18,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  email!,
                  style: context.textStyles.textLight.copyWith(
                    color: context.colors.secondary,
                    fontSize: 18,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1.5, color: context.colors.primary),
          const SizedBox(height: 10),
          ListTile(
            title: Text(
              'Home',
              style: context.textStyles.textMedium.copyWith(
                color: context.colors.secondary,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            title: Text(
              'Manejo',
              style: context.textStyles.textMedium.copyWith(
                fontSize: 20,
                color: context.colors.secondary,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/manejo');
            },
          ),
          ListTile(
            title: Text(
              'Cadastro de animais',
              style: context.textStyles.textMedium.copyWith(
                color: context.colors.secondary,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/consulta');
            },
          ),
          ListTile(
            title: Text(
              'Consultar animais',
              style: context.textStyles.textMedium.copyWith(
                color: context.colors.secondary,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/consulta');
            },
          ),
          ListTile(
            title: Text(
              'Relatório',
              style: context.textStyles.textMedium.copyWith(
                color: context.colors.secondary,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/relatorio');
            },
          ),
          ListTile(
            title: Text(
              'Vendas',
              style: context.textStyles.textMedium.copyWith(
                color: context.colors.secondary,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/vendas');
            },
          ),
          ListTile(
            title: Text(
              'Pasto',
              style: context.textStyles.textMedium.copyWith(
                color: context.colors.secondary,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/pasto');
            },
          ),
          ListTile(
            title: Text(
              'Conta',
              style: context.textStyles.textMedium.copyWith(
                color: context.colors.secondary,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/conta');
            },
          ),
          ListTile(
            title: Text(
              'Sobre',
              style: context.textStyles.textMedium.copyWith(
                color: context.colors.secondary,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/sobre');
            },
          ),
          ListTile(
            title: Text(
              'Sair',
              style: context.textStyles.textMedium.copyWith(
                color: context.colors.secondary,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap: () async {
              await _firebaseAuth.signOut().then((user) => Navigator.pushNamed(context, '/'));
              //Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
