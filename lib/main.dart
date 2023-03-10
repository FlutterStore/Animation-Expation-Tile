import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

const _headerStyle = TextStyle(color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
const _contentStyleHeader = TextStyle(color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
const _contentStyle = TextStyle(color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
const _loremIpsum ='''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Animation Expation Tile',style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),
        centerTitle: true,
      ),
      body: Accordion(
        maxOpenSections: 1,
        headerBackgroundColorOpened: Colors.black54,
        scaleWhenAnimating: true,
        openAndCloseAnimation: true,
        headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
        sectionClosingHapticFeedback: SectionHapticFeedback.light,
        children: [
          AccordionSection(
            isOpen: true,
            leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
            headerBackgroundColor: Colors.black,
            headerBackgroundColorOpened: Colors.red,
            header: const Text('Introduction', style: _headerStyle),
            content: const Text(_loremIpsum, style: _contentStyle),
            contentHorizontalPadding: 20,
            contentBorderWidth: 1,
            // onOpenSection: () => print('onOpenSection ...'),
            // onCloseSection: () => print('onCloseSection ...'),
          ),
          AccordionSection(
            isOpen: true,
            headerBackgroundColor: Colors.green,
            leftIcon: const Icon(Icons.compare_rounded, color: Colors.white),
            header: const Text('Nested Accordion', style: _headerStyle),
            contentBorderColor: const Color(0xffffffff),
            headerBackgroundColorOpened: Colors.amber,
            content: Accordion(
              maxOpenSections: 1,
              headerBackgroundColorOpened: Colors.black54,
              headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              children: [
                AccordionSection(
                  isOpen: true,
                  leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
                  headerBackgroundColor: Colors.black38,
                  headerBackgroundColorOpened: Colors.black54,
                  header: const Text('Nested Section #1', style: _headerStyle),
                  content: const Text(_loremIpsum, style: _contentStyle),
                  contentHorizontalPadding: 20,
                  contentBorderColor: Colors.black54,
                ),
                AccordionSection(
                  isOpen: true,
                  leftIcon: const Icon(Icons.compare_rounded, color: Colors.white),
                  header: const Text('Nested Section #2', style: _headerStyle),
                  headerBackgroundColor: Colors.black38,
                  headerBackgroundColorOpened: Colors.black54,
                  contentBorderColor: Colors.black54,
                  content: Row(
                    children: const [
                      Icon(Icons.compare_rounded,
                          size: 120, color: Colors.orangeAccent),
                      Flexible(
                          flex: 1,
                          child: Text(_loremIpsum, style: _contentStyle)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AccordionSection(
            isOpen: false,
            headerBackgroundColor: Colors.green,
            leftIcon: const Icon(Icons.food_bank, color: Colors.white),
            header: const Text('Company Info', style: _headerStyle),
            content: DataTable(
              sortAscending: true,
              sortColumnIndex: 1,
              dataRowHeight: 40,
              showBottomBorder: false,
              columns: const [
                DataColumn(
                  label: Text('ID', style: _contentStyleHeader),
                  numeric: true
                ),
                DataColumn(
                  label: Text('Description', style: _contentStyleHeader)
                ),
                DataColumn(
                  label: Text('Price', style: _contentStyleHeader),
                  numeric: true
                ),
              ],
              rows: const [
                DataRow(
                  cells: [
                    DataCell(Text('1',style: _contentStyle, textAlign: TextAlign.right)),
                    DataCell(Text('Fancy Product', style: _contentStyle)),
                    DataCell(Text(r'$ 199.99', style: _contentStyle, textAlign: TextAlign.right))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('2', style: _contentStyle, textAlign: TextAlign.right)),
                    DataCell(Text('Another Product', style: _contentStyle)),
                    DataCell(Text(r'$ 79.00', style: _contentStyle, textAlign: TextAlign.right))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('3', style: _contentStyle, textAlign: TextAlign.right)),
                    DataCell(Text('Really Cool Stuff', style: _contentStyle)),
                    DataCell(Text(r'$ 9.99', style: _contentStyle, textAlign: TextAlign.right))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('4', style: _contentStyle, textAlign: TextAlign.right)),
                    DataCell(Text('Last Product goes here', style: _contentStyle)),
                    DataCell(Text(r'$ 19.99', style: _contentStyle, textAlign: TextAlign.right))
                  ],
                ),
              ],
            ),
          ),
          AccordionSection(
            isOpen: false,
            headerBackgroundColor: Colors.green,
            leftIcon: const Icon(Icons.contact_page, color: Colors.white),
            header: const Text('Contact', style: _headerStyle),
            content: Wrap(
              children: List.generate(
                30,
                (index) => const Icon(
                  Icons.contact_page,
                  size: 30, color: Color(0xff999999)
                )
              ),
            ),
          ),
          AccordionSection(
            isOpen: false,
            headerBackgroundColor: Colors.green,
            leftIcon: const Icon(Icons.computer, color: Colors.white),
            header: const Text('Jobs', style: _headerStyle),
            content: const Icon(Icons.computer,
                size: 200, color: Color(0xff999999)),
          ),
          AccordionSection(
            isOpen: false,
            headerBackgroundColor: Colors.green,
            leftIcon: const Icon(Icons.movie, color: Colors.white),
            header: const Text('Culture', style: _headerStyle),
            content:
                const Icon(Icons.movie, size: 200, color: Color(0xff999999)),
          ),
          AccordionSection(
            isOpen: false,
            headerBackgroundColor: Colors.green,
            leftIcon: const Icon(Icons.people, color: Colors.white),
            header: const Text('Community', style: _headerStyle),
            content:
                const Icon(Icons.people, size: 200, color: Color(0xff999999)),
          ),
          AccordionSection(
            isOpen: false,
            headerBackgroundColor: Colors.green,
            leftIcon: const Icon(Icons.map, color: Colors.white),
            header: const Text('Map', style: _headerStyle),
            content: const Icon(Icons.map, size: 200, color: Color(0xff999999)),
          ),
        ],
      ),
    );
  }
}