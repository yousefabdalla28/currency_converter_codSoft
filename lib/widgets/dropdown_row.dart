import 'package:flutter/material.dart';

class DropdownRow extends StatelessWidget {
  final String label;
  final String value;
  final Map currencies;
  final void Function(String?) onChanged;

  const DropdownRow({super.key,
    required this.label,
    required this.value,
    required this.currencies,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
        ),
        const SizedBox(width: 20,),
        Expanded(
          child: DropdownButton<String>(
            borderRadius: BorderRadius.circular(15),
            menuMaxHeight: 500.0,
            value: value,
            dropdownColor: Colors.black,
            icon: const Icon(Icons.arrow_drop_down_rounded,color: Colors.white,),
            isExpanded: true,
            onChanged: onChanged,
            items: currencies.keys.toSet().toList()
                .map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text('$value - ${currencies[value]}',
                overflow: TextOverflow.ellipsis,style: const TextStyle(color: Colors.white),),
              );
            }).toList(),
          ),
        ),
        const SizedBox(width: 20,),
      ],
    );
  }
}

