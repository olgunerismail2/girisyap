import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => GirisEkrani(),
        "/ProfilSayfasiRotasi": (context) => ProfilEkrani(),
      },
    );
  }
}

class GirisEkrani extends StatefulWidget {
  const GirisEkrani({super.key});

  @override
  State<GirisEkrani> createState() => _GirisEkraniState();
}

//sayfalar arası geçiş
class _GirisEkraniState extends State<GirisEkrani> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  girisYap() {
    if (t1.text == "ismail" && t2.text == "1234") {
      Navigator.pushNamed(context, "/ProfilSayfasiRotasi",
          arguments: VeriModeli(kullaniciAdi: t1.text, sifre: t2.text));
    } else {}
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Yanlış kullanıcı adı veya şifre"),
          content: new Text("Lütfen giriş bilgilerinizi gözden geçirin."),
          actions: <Widget>[
            new TextButton(
              child: new Text("Kapat"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Giriş Ekrani")),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(100),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(hintText: "Kullanıcı Adı"),
                controller: t1,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Şifre"),
                controller: t2,
              ),
              ElevatedButton(onPressed: girisYap, child: Text("Giriş Yap")),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilEkrani extends StatefulWidget {
  const ProfilEkrani({super.key});

  @override
  State<ProfilEkrani> createState() => _ProfilEkraniState();
}

class _ProfilEkraniState extends State<ProfilEkrani> {
  cikisYap() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    VeriModeli iletilenArgumanlar =
        ModalRoute.of(context)!.settings.arguments as VeriModeli;

    return Scaffold(
      appBar: AppBar(title: Text("Profil Sayfasi")),
      body: Container(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: cikisYap,
              child: Text("Cikiş Yap"),
            ),
            Text(iletilenArgumanlar.kullaniciAdi),
            Text(iletilenArgumanlar.sifre),
          ],
        ),
      ),
    );
  }
}

class VeriModeli {
  String kullaniciAdi, sifre;
  VeriModeli({required this.kullaniciAdi, required this.sifre});
}
