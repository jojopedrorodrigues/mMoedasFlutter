import 'package:flutter/material.dart';
import 'package:moedas/Control/MoedaList.dart';
import 'package:moedas/Model/Dados.dart';
import 'package:moedas/Model/Moeda.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:moedas/View/Info.dart';

MoedaList info_Dados = MoedaList();

Moeda moeda = Moeda();
List lMoedas = [];
Dados dados = Dados();

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), (() async {
      dados = await info_Dados.lerDados();
      lMoedas = await info_Dados.lerMoeda();
    }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);
    InfoModal modalInfo = InfoModal();
    ScrollController controll;
    return Scaffold(
      body: SizedBox(
        width: query.size.width,
        height: query.size.height,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 35),
            ),
            SizedBox(
              width: query.size.width,
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.only(left: 22)),
                  SizedBox(
                    width: query.size.width - 102,
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 15),
                        ),
                        Text(
                          "ID: " + dados.id,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 5)),
                        Text(
                          "Saldo: " + dados.balance + " R\$ ",
                          style: const TextStyle(
                              fontSize: 21,
                              color: Colors.black,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80.0,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://static.vecteezy.com/ti/vetor-gratis/p1/2387693-icone-do-perfil-do-usuario-gr%C3%A1tis-vetor.jpg"))),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 22)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(padding: EdgeInsets.only(left: 22)),
                Icon(
                  Icons.monetization_on,
                  color: Colors.green,
                ),
                Padding(padding: EdgeInsets.only(left: 5)),
                Text(
                  "Criptomoedas: ",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 22)),
            //MINHA LISTA
            Builder(
              builder: (context) {
                ItemScrollController _scrollController = ItemScrollController();
                final List meuMap;
                List nome = [];
                List cotacao = [];
                List simbolo = [];
                List img = [];
                List sobre = [];
                List fee = [];
                for (var element in lMoedas) {
                  nome.add(element["currency_name"]);
                  cotacao.add(element['cotation']);
                  simbolo.add(element['symbol']);
                  img.add(element['image_url']);
                  sobre.add(element['details']['about']);
                  fee.add(element['details']['fee']);
                }
                return SizedBox(
                    height: 550,
                    child: ListView.builder(
                      itemBuilder: ((context, index) {
                        return SizedBox(
                          width: query.size.width - 22,
                          height: 100,
                          child: Padding(
														padding: const EdgeInsets.all(22),
														child: Card(
															elevation: 5.0,
															child: Column(
																children: [
																	const Padding(padding: EdgeInsets.only(top: 5)),
																	Row(
																		crossAxisAlignment: CrossAxisAlignment.start,
																		children: [
																			const Padding(
																					padding: EdgeInsets.only(left: 22)),
																			Text(
																			simbolo[index],
																				style:
																						const TextStyle(color: Colors.green),
																			),
																			const Padding(
																					padding: EdgeInsets.only(left: 100)),
																			Text(
																				"1 " + nome[index],
																				style: const TextStyle(
																						color: Colors.black,
																						fontWeight: FontWeight.w700),
																			),
																		],
																	),
																	const Padding(
																			padding: EdgeInsets.only(top: 8)),
																	SizedBox(
																		child: Row(
																			crossAxisAlignment: CrossAxisAlignment.start,
																			children: [
																				const Padding(
																						padding: EdgeInsets.only(left: 22)),
																				Opacity(
																					opacity: 0.9,
																					child: Container(
																						width: 30,
																						height: 30.0,
																						decoration: BoxDecoration(
																								shape: BoxShape.circle,
																								image: DecorationImage(
																										fit: BoxFit.fill,
																										image: NetworkImage(img[index]))),
																					),
																				),
																				const Padding(
																						padding: EdgeInsets.only(left: 111)),
																				Text(
																					cotacao[index],
																					style: const TextStyle(
																							color: Colors.black, fontSize: 14),
																				),
																			],
																		),
																	),
																	const Padding(padding: EdgeInsets.only(top: 8)),
																	Expanded(
																			child: Container(
																		color: Colors.black,
																		width: query.size.width,
																		height: 20,
																		child: RaisedButton(
																			color: Colors.black,
																			elevation: 2,
																			focusElevation: 4,
																			hoverElevation: 4,
																			highlightElevation: 8,
																			disabledElevation: 1,
																			onPressed: () {
																				modalInfo.modal(context, simbolo[index].toString(), fee[index].toString(),sobre[index].toString());
																			},
																			child: const Text(
																				'Detalhes',
																				style: TextStyle(color: Colors.white),
																			),
																		),
																	))
																],
															),
														),
													),
                        );
                      }),
                      itemCount: lMoedas.length,
                    ));
              },
            ),
            //AQUI VAI SER A LIST
          ],
        ),
      ),
    );
  }
}
