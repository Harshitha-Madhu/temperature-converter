import 'package:flutter/material.dart';

void main() {
  runApp(TemperatureConverterApp());
}

class TemperatureConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      home: TemperatureConverterPage(),
    );
  }
}

class TemperatureConverterPage extends StatefulWidget {
  @override
  _TemperatureConverterPageState createState() =>
      _TemperatureConverterPageState();
}

class _TemperatureConverterPageState extends State<TemperatureConverterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tempController = TextEditingController();

  String _selectedConversion = 'Celsius to Fahrenheit';
  String _result = '';

  void _convert() {
    if (_formKey.currentState!.validate()) {
      double inputTemp = double.parse(_tempController.text);

      double outputTemp;
      String result;

      if (_selectedConversion == 'Celsius to Fahrenheit') {
        outputTemp = (inputTemp * 9 / 5) + 32;
        result =
            '${inputTemp.toStringAsFixed(2)}°C = ${outputTemp.toStringAsFixed(2)}°F';
      } else {
        outputTemp = (inputTemp - 32) * 5 / 9;
        result =
            '${inputTemp.toStringAsFixed(2)}°F = ${outputTemp.toStringAsFixed(2)}°C';
      }

      setState(() {
        _result = result;
      });
    }
  }

  @override
  void dispose() {
    _tempController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: const Text('🌡️ Temperature Converter'),
        centerTitle: true,
        elevation: 4,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Enter Temperature',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _tempController,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                        labelText: 'Temperature',
                        prefixIcon: Icon(Icons.thermostat),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter a value';
                        }
                        final doubleVal = double.tryParse(value);
                        if (doubleVal == null) {
                          return 'Enter a valid number (e.g., 37.5)';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _selectedConversion,
                      items: const [
                        DropdownMenuItem(
                          value: 'Celsius to Fahrenheit',
                          child: Text('Celsius to Fahrenheit'),
                        ),
                        DropdownMenuItem(
                          value: 'Fahrenheit to Celsius',
                          child: Text('Fahrenheit to Celsius'),
                        ),
                      ],
                      decoration: const InputDecoration(
                        labelText: 'Conversion Type',
                        prefixIcon: Icon(Icons.swap_vert),
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedConversion = newValue!;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: _convert,
                      icon: const Icon(Icons.calculate_outlined),
                      label: const Text('Convert'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 24),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: _result.isNotEmpty
                          ? Text(
                              _result,
                              key: ValueKey<String>(_result),
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.pinkAccent,
                              ),
                              textAlign: TextAlign.center,
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}import 'package:flutter/material.dart';

void main() {
  runApp(TemperatureConverterApp());
}

class TemperatureConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      home: TemperatureConverterPage(),
    );
  }
}

class TemperatureConverterPage extends StatefulWidget {
  @override
  _TemperatureConverterPageState createState() =>
      _TemperatureConverterPageState();
}

class _TemperatureConverterPageState extends State<TemperatureConverterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tempController = TextEditingController();

  String _selectedConversion = 'Celsius to Fahrenheit';
  String _result = '';

  void _convert() {
    if (_formKey.currentState!.validate()) {
      double inputTemp = double.parse(_tempController.text);

      double outputTemp;
      String result;

      if (_selectedConversion == 'Celsius to Fahrenheit') {
        outputTemp = (inputTemp * 9 / 5) + 32;
        result =
            '${inputTemp.toStringAsFixed(2)}°C = ${outputTemp.toStringAsFixed(2)}°F';
      } else {
        outputTemp = (inputTemp - 32) * 5 / 9;
        result =
            '${inputTemp.toStringAsFixed(2)}°F = ${outputTemp.toStringAsFixed(2)}°C';
      }

      setState(() {
        _result = result;
      });
    }
  }

  @override
  void dispose() {
    _tempController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: const Text('🌡️ Temperature Converter'),
        centerTitle: true,
        elevation: 4,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Enter Temperature',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _tempController,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                        labelText: 'Temperature',
                        prefixIcon: Icon(Icons.thermostat),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter a value';
                        }
                        final doubleVal = double.tryParse(value);
                        if (doubleVal == null) {
                          return 'Enter a valid number (e.g., 37.5)';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _selectedConversion, // ✅ Fixed this line
                      items: const [
                        DropdownMenuItem(
                          value: 'Celsius to Fahrenheit',
                          child: Text('Celsius to Fahrenheit'),
                        ),
                        DropdownMenuItem(
                          value: 'Fahrenheit to Celsius',
                          child: Text('Fahrenheit to Celsius'),
                        ),
                      ],
                      decoration: const InputDecoration(
                        labelText: 'Conversion Type',
                        prefixIcon: Icon(Icons.swap_vert),
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedConversion = newValue!;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: _convert,
                      icon: const Icon(Icons.calculate_outlined),
                      label: const Text('Convert'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 24),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: _result.isNotEmpty
                          ? Text(
                              _result,
                              key: ValueKey<String>(_result),
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.pinkAccent,
                              ),
                              textAlign: TextAlign.center,
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}import 'package:flutter/material.dart';

void main() {
  runApp(TemperatureConverterApp());
}

class TemperatureConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      home: TemperatureConverterPage(),
    );
  }
}

class TemperatureConverterPage extends StatefulWidget {
  @override
  _TemperatureConverterPageState createState() =>
      _TemperatureConverterPageState();
}

class _TemperatureConverterPageState extends State<TemperatureConverterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tempController = TextEditingController();

  String _selectedConversion = 'Celsius to Fahrenheit';
  String _result = '';

  void _convert() {
    if (_formKey.currentState!.validate()) {
      double inputTemp = double.parse(_tempController.text);

      double outputTemp;
      String result;

      if (_selectedConversion == 'Celsius to Fahrenheit') {
        outputTemp = (inputTemp * 9 / 5) + 32;
        result =
            '${inputTemp.toStringAsFixed(2)}°C = ${outputTemp.toStringAsFixed(2)}°F';
      } else {
        outputTemp = (inputTemp - 32) * 5 / 9;
        result =
            '${inputTemp.toStringAsFixed(2)}°F = ${outputTemp.toStringAsFixed(2)}°C';
      }

      setState(() {
        _result = result;
      });
    }
  }

  @override
  void dispose() {
    _tempController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: const Text('🌡️ Temperature Converter'),
        centerTitle: true,
        elevation: 4,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Enter Temperature',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _tempController,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                        labelText: 'Temperature',
                        prefixIcon: Icon(Icons.thermostat),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter a value';
                        }
                        final doubleVal = double.tryParse(value);
                        if (doubleVal == null) {
                          return 'Enter a valid number (e.g., 37.5)';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _selectedConversion, // ✅ Fixed this line
                      items: const [
                        DropdownMenuItem(
                          value: 'Celsius to Fahrenheit',
                          child: Text('Celsius to Fahrenheit'),
                        ),
                        DropdownMenuItem(
                          value: 'Fahrenheit to Celsius',
                          child: Text('Fahrenheit to Celsius'),
                        ),
                      ],
                      decoration: const InputDecoration(
                        labelText: 'Conversion Type',
                        prefixIcon: Icon(Icons.swap_vert),
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedConversion = newValue!;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: _convert,
                      icon: const Icon(Icons.calculate_outlined),
                      label: const Text('Convert'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 24),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: _result.isNotEmpty
                          ? Text(
                              _result,
                              key: ValueKey<String>(_result),
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.pinkAccent,
                              ),
                              textAlign: TextAlign.center,
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
