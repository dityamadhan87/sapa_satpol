import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarField extends StatefulWidget {
  final String label;
  final DateTime? initialDate;
  final void Function(DateTime)? onDateSelected;

  const CalendarField({
    super.key,
    this.label = "Tanggal",
    this.initialDate,
    this.onDateSelected,
  });

  @override
  State<CalendarField> createState() => _CalendarFieldState();
}

class _CalendarFieldState extends State<CalendarField>{
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

  Future<void> _selectDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      helpText: 'Pilih Tanggal',
      locale: const Locale('id'), 
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      if (widget.onDateSelected != null) {
        widget.onDateSelected!(picked);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isPotrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final formattedDate = selectedDate != null
        ? DateFormat('dd MMM yyyy', 'id').format(selectedDate!)
        : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: widget.label,
            style: TextStyle(
              fontSize: (screenWidth * 0.04),
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            children: const [
              TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),

        SizedBox(height: screenWidth * 0.02),

        GestureDetector(
          onTap: _selectDate,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenWidth * 0.025
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formattedDate.isNotEmpty ? formattedDate : 'Pilih tanggal',
                  style: TextStyle(
                    color: formattedDate.isNotEmpty
                        ? Colors.black
                        : Colors.grey.shade500,
                    fontSize:(isPotrait ? screenWidth * 0.035 : screenWidth * 0.025),
                  ),
                ),
                Icon(Icons.calendar_today, size: screenWidth * 0.04, color: Colors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }
}