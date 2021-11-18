import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController precoAlcool = TextEditingController();
  TextEditingController precoGasolina = TextEditingController();
  var alc = 'ALCOOL';
  var gas = 'GASOLINA';
  var resul = '';
  var botao = 'Calcular';
  dynamic result = new Container(
    child: Text(
      "",
    ),
  );
  var mensagem =
      "Veja qual a Facada que vai doer um pouco menos, digite abaixo os valores usando (.)";
  void calcular() {
    double calcular = double.tryParse(precoAlcool.text);
    double calcular1 = double.tryParse(precoGasolina.text);

    if (calcular == null || calcular1 == null) {
      setState(() {
        mensagem =
            "Impossivel Calcular, digite um numero maior que 0, e use (.)";
        result = new Container(
          child: Text(
            "",
          ),
        );
      });
    } else {
      if (calcular / calcular1 < 0.7) {
        setState(() {
          mensagem =
              "Olha... Segundo nossos calculos, a facada que você vai tomar que vai doer menos é com o: ";
          resul = alc;

          result = Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: new Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  resul,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        });
      } else {
        setState(() {
          mensagem =
              "Olha... Segundo nossos calculos, a facada que você vai tomar que vai doer menos é com: ";

          resul = gas;

          result = Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: new Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  resul,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        });
      }
    }
    limparTexto();
    botao = 'Calcular Novamente';
  }

  void limparTexto() {
    precoAlcool.text = '';
    precoGasolina.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text("Alcool ou Gasolina",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'imagens/carro.gif',
              height: 200,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 14),
              child: Column(
                children: [
                  Text(
                    mensagem,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    textAlign: TextAlign.center,
                  ),
                  result
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: SizedBox(
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Preço Alcool ex: 10.59',
                  ),
                  controller: precoAlcool,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 5, 40, 0),
              child: SizedBox(
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Preço Gasolina ex: 12.59',
                  ),
                  controller: precoGasolina,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 220,
                child: ElevatedButton(onPressed: calcular, child: Text(botao)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
