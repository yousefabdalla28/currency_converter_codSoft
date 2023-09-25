import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'dropdown_row.dart';

class ConversionCard extends StatefulWidget {
  final rates;
  final Map currencies;
  const ConversionCard({super.key, @required this.rates, required this.currencies});

  @override
  State<ConversionCard> createState() => _ConversionCardState();
}

class _ConversionCardState extends State<ConversionCard> {
  TextEditingController amountController = TextEditingController();
  final GlobalKey<FormFieldState> formFieldKey = GlobalKey();
  String dropdownValue1 = 'USD';
  String dropdownValue2 = 'PKR';
  String conversion = '';
  bool isLoading = false;

  void startLoading() {
    setState(() {
      isLoading = true;
    });
  }

  void stopLoading() {
    setState(() {
      isLoading = false;
    });
  }

  void convertAndDisplay() {
    conversion =
    '${amountController.text} $dropdownValue1 = ${Utils.convert(widget.rates, amountController.text, dropdownValue1, dropdownValue2)} $dropdownValue2';
    stopLoading();
  }

  void swapCurrencies() {
    setState(() {
      String temp = dropdownValue1;
      dropdownValue1 = dropdownValue2;
      dropdownValue2 = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 120,),
          TextFormField(
            key: formFieldKey,
            controller: amountController,
            decoration: const InputDecoration(
              labelText: "Enter Amount To Convert \$",
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              fillColor: Colors.white,
              filled: true,
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter an amount';
              }
              return null;
            },
          ),
          const SizedBox(height: 20,),
          DropdownRow(
            label: 'From:',
            value: dropdownValue1,
            currencies: widget.currencies,
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue1 = newValue!;
              });
            },
          ),
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.swap_vert),
            onPressed: () {
              if(amountController.text.isEmpty){
                swapCurrencies();
              } else {
                swapCurrencies();
                convertAndDisplay();
              }
            },
          ),
          DropdownRow(
            label: 'To:',
            value: dropdownValue2,
            currencies: widget.currencies,
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue2 = newValue!;
              });
            },
          ),
          const SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {
                    if (formFieldKey.currentState!.validate()) {
                      startLoading();
                      conversion = '';
                      convertAndDisplay();
                    }
                  },
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Convert',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16)
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("Result",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                ),
                Text(
                  conversion,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const Spacer(),
          const Text('Currency Rates for codSoft intern',style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }
}

