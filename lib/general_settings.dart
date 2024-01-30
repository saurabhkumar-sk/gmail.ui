import 'package:email_ui/utils/color.dart';
import 'package:email_ui/utils/countru.dart';
import 'package:email_ui/utils/testStyle.dart';
import 'package:email_ui/utils/testsize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:language_picker/language_picker_dropdown.dart';
import 'package:language_picker/languages.dart';
import 'package:language_picker/languages.g.dart';

class GeneralSettings extends StatefulWidget {
  const GeneralSettings({super.key});

  @override
  State<GeneralSettings> createState() => _GeneralSettingsState();
}

class _GeneralSettingsState extends State<GeneralSettings> {
  String _selectedCountry = 'India';
  String _selectedtextstyle = 'Scans Serif';
  String _selectedtextsize = 'Small';
  Color _selectedColor = Colors.red;

  final List<String> _country = Country.country;
  final List<String> _textstyles = TextStyles.textstyles;
  final List<String> _textsize = TestSizes.textsize;
  final List<Color> _colors = MyColors.colors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Language :',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 160),
              const Text(
                'Gmail Display Language :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(
                  height: 25,
                  width: 250,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: LanguagePickerDropdown(
                    initialValue: Languages.korean,
                    onValuePicked: (Language language) {},
                  ),
                ),
              ),
              const SizedBox(width: 4),
              const Text(
                ' Change language settings for other Google products',
                style: TextStyle(
                  color: Color.fromARGB(255, 82, 33, 243),
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Phone numbers :',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              const SizedBox(width: 122),
              const Text(
                'Default country code :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              Container(
                height: 25,
                width: 250,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: DropdownButton<String>(
                  isExpanded: true,
                  underline: const SizedBox(
                    height: 20,
                    width: 100,
                  ),
                  value: _selectedCountry,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCountry = newValue!;
                      Intl.defaultLocale = _selectedCountry;
                    });
                  },
                  items: _country.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          const Divider(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Default text style :',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(
                      '(Use the Remove formatting button on\n the toolbar to reset the default text style)',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 33),
              Card(
                surfaceTintColor: Colors.transparent,
                elevation: 10,
                shape: const BeveledRectangleBorder(),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          DropdownButton<String>(
                            underline: const SizedBox(),
                            value: _selectedtextstyle,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedtextstyle = newValue!;
                                Intl.defaultLocale = _selectedtextstyle;
                              });
                            },
                            items: _textstyles
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          DropdownButton<String>(
                            underline: const SizedBox(),
                            value: _selectedtextsize,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedtextsize = newValue!;
                                Intl.defaultLocale = _selectedtextsize;
                              });
                            },
                            items: _textsize
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          DropdownButton<Color>(
                            underline: const SizedBox(),
                            value: _selectedColor,
                            onChanged: (Color? newValue) {
                              setState(() {
                                _selectedColor = newValue!;
                              });
                            },
                            items: _colors
                                .map<DropdownMenuItem<Color>>((Color color) {
                              return DropdownMenuItem<Color>(
                                  value: color,
                                  child: const Icon(Icons.text_format));
                            }).toList(),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.format_clear,
                            ),
                          ),
                          const SizedBox(
                            width: 100,
                          )
                        ],
                      ),
                      const Text(
                        'This is what your body text will look like',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Stars :',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              const SizedBox(width: 160),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                RichText(
                  text: const TextSpan(
                      text: 'Drag the stars between the lists.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text:
                              'The stars will rotate in the order shown below when you click successively. To learn the name of a star for search, hover your mouse over the image.',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ]),
                ),
                const SizedBox(height: 13),
                const Padding(
                  padding: EdgeInsets.only(right: 500),
                  child: Row(
                    children: [
                      Text('Presents:'),
                      SizedBox(width: 40),
                      Text(
                        '1 star  4 star  all stars',
                        style:
                            TextStyle(color: Color.fromARGB(255, 65, 33, 243)),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(right: 621),
                  child: Row(
                    children: [
                      Text('In use:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 56),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 510),
                  child: Row(
                    children: [
                      const Text(
                        'Not in use:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 20),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.star,
                            color: Colors.redAccent,
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.star,
                            color: Colors.purple,
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.star,
                            color: Colors.blue,
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.star,
                            color: Colors.green,
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              border: Border.all(
                                color: Colors.black,
                                width: 0.5,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.priority_high,
                                size: 12,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              border: Border.all(
                                color: Colors.black,
                                width: 0.5,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.double_arrow,
                                size: 12,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              border: Border.all(
                                color: Colors.black,
                                width: 0.5,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.priority_high,
                                size: 12,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              border: Border.all(
                                color: Colors.black,
                                width: 0.5,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.done,
                                size: 12,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(
                                color: Colors.black,
                                width: 0.5,
                              ),
                            ),
                            child: const Center(
                              child: RotatedBox(
                                quarterTurns: 2,
                                child: Icon(
                                  Icons.priority_high,
                                  size: 12,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              border: Border.all(
                                color: Colors.black,
                                width: 0.5,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.question_mark,
                                size: 12,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ])
            ],
          ),
          const Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Signature:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(
                      '(appended at the end of all outgoing\nmessages)',
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 33),
              Column(
                children: [
                  Container(
                    height: 200,
                    width: 240,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const ListTile(
                      titleTextStyle: TextStyle(color: Colors.amber),
                      leading: Text('Ajay'),
                      trailing: Wrap(
                        spacing: 13,
                        children: [
                          Icon(
                            Icons.edit,
                          ),
                          Icon(Icons.delete)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                      onPressed: () {},
                      child: Container(
                        height: 40,
                        width: 240,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.blue,
                            ),
                            Text(
                              'Add New card',
                              style: TextStyle(color: Colors.blue),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
