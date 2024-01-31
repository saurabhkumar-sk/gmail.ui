import 'package:email_ui/components/stars.dart';
import 'package:email_ui/utils/color.dart';
import 'package:email_ui/utils/countru.dart';
import 'package:email_ui/utils/testStyle.dart';
import 'package:email_ui/utils/testsize.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:language_picker/language_picker_dropdown.dart';
import 'package:language_picker/languages.dart';

class GeneralSettings extends StatefulWidget {
  const GeneralSettings({super.key});

  @override
  State<GeneralSettings> createState() => _GeneralSettingsState();
}

class _GeneralSettingsState extends State<GeneralSettings> {
  String _selectedCountry = 'India';
  String _signature = 'No signature';
  final String _signaturesaurabh = 'Saurabh';
  String _selectedtextstyle = 'Scans Serif';
  String? _selectedtext = "Normal";
  String? _text;
  Color _selectedColor = Colors.red;
  bool isSelected = false;

  final List<String> _country = Country.country;
  final List<String> _textstyles = TextStyles.textstyles;
  final List<String> _textsize = TestSizes.textsize;
  final List<Color> _colors = MyColors.colors;

  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                    items:
                        _country.map<DropdownMenuItem<String>>((String value) {
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              items: _textstyles.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            const SizedBox(width: 10),
                            DropdownButton<String>(
                              underline: const SizedBox(),
                              value: _selectedtext,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedtext = newValue!;
                                  Intl.defaultLocale = _selectedtext;
                                });
                              },
                              items: _textsize.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            const SizedBox(width: 10),
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
                            const SizedBox(width: 10),
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
            const Stars(),
            const Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
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
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Learn More",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 33),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.69,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 0.1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 140, left: 5),
                            child: SizedBox(
                              height: 50,
                              width: 285,
                              child: TextField(
                                controller: textEditingController,
                                maxLines: 100,
                                style: const TextStyle(color: Colors.black),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 0,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Color.fromARGB(118, 204, 229, 250),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.edit_outlined),
                                      SizedBox(width: 20),
                                      Icon(Icons.delete_outline),
                                    ],
                                  ),
                                  hintText: "My Signature",
                                ),
                              ),
                            ),
                          ),
                          const VerticalDivider(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 120,
                                width: 430,
                                child: TextField(
                                  controller: textEditingController2,
                                  maxLines: 200,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.zero),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    hintText: "Thanks\nSaurabh Kumar",
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  RotatedBox(
                                    quarterTurns: 1,
                                    child: Container(
                                      height: 740,
                                      width: 0.2,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                  const SizedBox(width: 10),
                                  DropdownButton<String>(
                                    underline: const SizedBox(),
                                    icon: const Row(
                                      children: [
                                        Icon(Icons.text_fields),
                                        Icon(Icons.arrow_drop_down),
                                      ],
                                    ),
                                    value: _text,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _text = newValue!;
                                        Intl.defaultLocale = _text;
                                      });
                                    },
                                    items: _textsize
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.format_bold,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.format_italic,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.format_underline,
                                    ),
                                  ),
                                  DropdownButton<Color>(
                                    underline: const SizedBox(),
                                    value: _selectedColor,
                                    onChanged: (Color? newValue) {
                                      setState(() {
                                        _selectedColor = newValue!;
                                      });
                                    },
                                    items: _colors.map<DropdownMenuItem<Color>>(
                                        (Color color) {
                                      return DropdownMenuItem<Color>(
                                          value: color,
                                          child: const Icon(Icons.text_format));
                                    }).toList(),
                                  ),
                                  const SizedBox(width: 10),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.link,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.photo,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Row(
                                      children: [
                                        Icon(
                                          Icons.format_align_left,
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Row(
                                      children: [
                                        Icon(
                                          Icons.format_list_numbered,
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 100,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 295,
                      height: 45,
                      child: TextButton.icon(
                        label: const Text("Create new"),
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: const BorderSide(
                                  color: Colors.black,
                                  width: 0.3,
                                )),
                          ),
                        ),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text("Signature defaults"),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "FOR NEW EMAILS USE",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 25,
                              width: 250,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                underline: Container(),
                                value: _signature,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _signature = newValue!;
                                    Intl.defaultLocale = _signature;
                                  });
                                },
                                items: [
                                  DropdownMenuItem(
                                    value: _signature,
                                    child: Text(_signature),
                                  ),
                                  DropdownMenuItem(
                                    value: _signaturesaurabh,
                                    child: Text(_signaturesaurabh),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "ON REPLY/FORWARD USE",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 25,
                              width: 250,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                underline: Container(),
                                value: _signature,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _signature = newValue!;
                                    Intl.defaultLocale = _signature;
                                  });
                                },
                                items: [
                                  DropdownMenuItem(
                                    value: _signature,
                                    child: Text(_signature),
                                  ),
                                  DropdownMenuItem(
                                    value: _signaturesaurabh,
                                    child: Text(_signaturesaurabh),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Checkbox(
                          value: isSelected,
                          onChanged: (value) {
                            setState(
                              () {
                                isSelected = value!;
                              },
                            );
                          },
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          "Insert signature before quoted text in replies and remove the \"--\" line that precedes it.",
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
