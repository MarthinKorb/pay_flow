import 'package:flutter/material.dart';
import 'package:pay_flow/modules/home/home_controller.dart';
import 'package:pay_flow/shared/auth/auth_controller.dart';
import 'package:pay_flow/shared/models/user_model.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/themes/appcolors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();
  final authController = AuthController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pages = [
      Container(color: Colors.grey[200]),
      Container(color: Colors.grey[300]),
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          color: AppColors.primary,
          height: size.height * 0.3,
          child: SafeArea(
            child: Center(
              child: FutureBuilder<UserModel?>(
                future: authController.getUser(),
                builder: (context, snapshot) => ListTile(
                  title: Text.rich(
                    TextSpan(
                      text: 'Olá, ',
                      style: AppTextStyles.titleRegular,
                      children: [
                        TextSpan(
                          text: snapshot.data?.name,
                          style: AppTextStyles.titleBoldBackground,
                        ),
                      ],
                    ),
                  ),
                  subtitle: Text(
                    'Mantenha suas contas em dia',
                    style: AppTextStyles.captionShape,
                  ),
                  trailing: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.network(
                      snapshot.data!.photoURL!,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: pages[homeController.currentPage],
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: AppColors.primary,
              ),
              onPressed: () {
                homeController.setPage(0);
                setState(() {});
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.add_box_outlined,
                  color: AppColors.shape,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/barcode_scanner');
                },
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.description_outlined,
                color: AppColors.body,
              ),
              onPressed: () {
                homeController.setPage(1);
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
