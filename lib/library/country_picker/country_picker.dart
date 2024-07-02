
import 'dart:io';

import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';

class CountryPicker extends StatefulWidget {
  final String pageTitle;
  const CountryPicker({super.key, required this.pageTitle});

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {

  List<String> countryCodeList = [
    '420', '36', '48', '45', '353',
    '47', '46', '44', '43', '32', '33',
    '49', '352', '31', '41', '376', '350',
    '30', '39', '356', '351', '381', '34',
    '1', '52', '63', '65', '90', '971',
    '61', '64',
  ];
  String _selectedCountry = '+49';
  String _selectedFlag = 'flags/de.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
      ),
      body: Center(
        child: CountryListPick(
          appBar: AppBar(
            title: const Text('Pick Your Country'),
          ),
          theme: CountryTheme(
            isShowFlag: true,
            isShowTitle: true,
            isShowCode: true,
            isDownIcon: true,
            showEnglishName: true,
          ),
          initialSelection: _selectedCountry,
          pickerBuilder: (context, CountryCode? countryCode) {
            return Row(
              children: <Widget>[
                Image.asset(
                  countryCode!.flagUri!,
                  package: 'country_list_pick',
                  width: 32.0,
                ),
                SizedBox(width: 8.0),
                // Uncomment these lines to display dial code and country name
                // Text(
                //   countryCode.dialCode ?? '',
                //   style: TextStyle(fontSize: 16),
                // ),
                // SizedBox(width: 8.0),
                // Text(
                //   countryCode.name ?? '',
                //   style: TextStyle(fontSize: 16),
                // ),
              ],
            );
          },
          onChanged: (CountryCode? code) {
            debugPrint('Selected Country: ${code!.name}');
            debugPrint('Country Code: ${code.code}');
            debugPrint('Dial Code: ${code.dialCode}');
            debugPrint('Flag URI: ${code.flagUri}');
          },
          useUiOverlay: false,
          useSafeArea: true,
          countryBuilder: (context, CountryCode? code) {
            return countryCodeList.contains(code!.dialCode!.substring(1))
                ? InkWell(
              onTap: () {
                setState(() {
                  _selectedCountry = '${code.dialCode}';
                  _selectedFlag = '${code.flagUri}';
                });
                debugPrint('Tapped Country: ${code.dialCode}');
              },
              child: ListTile(
                leading: Image.asset(
                  code.flagUri!,
                  package: 'country_list_pick',
                  width: 32.0,
                ),
                title: Text(code.name!),
                // Uncomment this line to display dial code
                // trailing: Text(code.dialCode!),
              ),
            )
                : const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
