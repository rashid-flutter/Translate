import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LangugeTranslate extends StatefulWidget {
  const LangugeTranslate({super.key});

  @override
  State<LangugeTranslate> createState() => _LangugeTranslateState();
}

class _LangugeTranslateState extends State<LangugeTranslate> {
  var languages = [
    'Hindi',
    'English',
    'Arabic',
    'Malayalam',
    'Telugu',
    'Tamil',
    'Thai',
    'Kannada',
    'Kashmiri'
  ];
  var originLanguage = "From";
  var translateLanguge = "TO";
  var output = '';
  final languageCon = TextEditingController();

  Future<void> translate(String src, String dest, String input) async {
    GoogleTranslator translator = GoogleTranslator();
    var translation = await translator.translate(input, from: src, to: dest);
    setState(() {
      output = translation.text.toString();
    });
    if (src == '--' || dest == '--') {
      setState(() {
        output = 'Fail to translate';
      });
    }
  }

  String getLanguageCode(String lang) {
    if (lang == "English") {
      return 'en';
    } else if (lang == "Hindi") {
      return "hi";
    } else if (lang == "Arabic") {
      return "ar";
    } else if (lang == "Malayalam") {
      return "ml";
    } else if (lang == "Tamil") {
      return "ta";
    } else if (lang == "Telugu") {
      return "te";
    } else if (lang == "Thai") {
      return "th";
    } else if (lang == "Kannada") {
      return "kn";
    } else if (lang == "Kashmiri") {
      return "ks";
    }
    return '--';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Language Translate",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    items: languages
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    // focusColor: Colors.black,
                    // iconDisabledColor: Colors.black,
                    // iconEnabledColor: Colors.black,
                    hint: Text(
                      originLanguage,
                      style: const TextStyle(color: Colors.black),
                    ),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    onChanged: (String? value) {
                      setState(() {
                        originLanguage = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  const Icon(
                    Icons.arrow_right_alt_outlined,
                    color: Colors.black,
                    size: 40,
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  DropdownButton(
                    items: languages
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    // focusColor: Colors.black,
                    // iconDisabledColor: Colors.black,
                    // iconEnabledColor: Colors.black,
                    hint: Text(
                      translateLanguge,
                      style: const TextStyle(color: Colors.black),
                    ),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    onChanged: (String? value) {
                      setState(() {
                        translateLanguge = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  autofocus: false,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      labelText: 'Please enter your text'),
                  controller: languageCon,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter text to translate';
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    translate(getLanguageCode(originLanguage),
                        getLanguageCode(translateLanguge), languageCon.text);
                  },
                  child: const Text("Translate")),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 0.5, color: Colors.black)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Text(
                          '\n$output',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
