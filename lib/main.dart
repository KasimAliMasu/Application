import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ).copyWith(
          error: Colors.black,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: InputDecorationTheme(
          errorStyle: TextStyle(color: Colors.red),
        ),
      ),
      home: FirstRoute(title: 'Home Page'),
    );
  }
}

class FirstRoute extends StatefulWidget {
  final String title;

  FirstRoute({Key? key, required this.title}) : super(key: key);

  @override
  _FirstRouteState createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  final TextEditingController _dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final InputDecoration _commonInputDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color: Colors.black),
    ),
    labelStyle: TextStyle(color: Colors.black),
  );

  bool isSnackBarVisible = false;

  void _clearError() {
    if (isSnackBarVisible) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      isSnackBarVisible = false;
    }
  }

  void _showErrorSnackBar(String message) {
    if (!isSnackBarVisible) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
      isSnackBarVisible = true;
    } else {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            'Edit Profile',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ),
        leading: IconButton(
          color: Colors.black87,
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 16),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 75,
                      backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-vector/illustration-businessman_53876-5856.jpg?w=740&t=st=1707128998~exp=1707129598~hmac=b584ca1491be54bd14695f40c6b08aa4020e35351eac99c985844c2835e91084',
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black87,
                        ),
                        child: IconButton(
                          iconSize: 15,
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Container(
                    width: 345,
                    height: 65,
                    margin: EdgeInsets.only(top: 6),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          _showErrorSnackBar('Please enter your full name');
                          return 'Please enter your full name';
                        } else if (value.length < 3) {
                          return 'Name must be more than 2';
                        }
                        return null;
                      },
                      decoration: _commonInputDecoration.copyWith(
                        labelText: 'Full Name',
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Container(
                    width: 345,
                    height: 65,
                    margin: EdgeInsets.only(top: 1),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          _showErrorSnackBar('Please enter your Last name');
                          return 'Please enter your Last name';
                        }
                        return null;
                      },
                      decoration: _commonInputDecoration.copyWith(
                        labelText: 'Last Name',
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Container(
                    width: 345,
                    height: 65,
                    margin: EdgeInsets.only(top: 6),
                    child: DropdownButtonFormField<String>(
                      decoration: _commonInputDecoration.copyWith(
                        labelText: 'Gender',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      value: null,
                      items: ['Male', 'Female', 'Other']
                          .map((gender) => DropdownMenuItem<String>(
                                value: gender,
                                child: Text(gender),
                              ))
                          .toList(),
                      onChanged: (value) {},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          _showErrorSnackBar('Please select your gender');
                          return 'Please select your gender';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Container(
                    width: 345,
                    height: 65,
                    margin: EdgeInsets.only(top: 6),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          _showErrorSnackBar('Please enter your Date of Birth');
                          return 'Please enter your Date of Birth';
                        }
                        return null;
                      },
                      readOnly: true,
                      controller: _dateController,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );

                        if (pickedDate != null) {
                          setState(() {
                            _dateController.text =
                                pickedDate.toLocal().toString().split(' ')[0];
                          });
                        }
                      },
                      decoration: _commonInputDecoration.copyWith(
                        labelText: 'Date of Birth',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        suffixIcon: Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Container(
                    width: 345,
                    height: 65,
                    margin: EdgeInsets.only(top: 6),
                    child: TextFormField(
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          _showErrorSnackBar('Please enter your mobile number');
                          return 'Please enter your mobile number';
                        } else if (value.length != 10) {
                          return 'Mobile Number must be of 10 digits';
                        }
                        return null;
                      },
                      decoration: _commonInputDecoration.copyWith(
                        labelText: 'Mobile No',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Container(
                    width: 345,
                    height: 65,
                    margin: EdgeInsets.only(top: 6),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          _showErrorSnackBar('Please enter your email address');
                          return 'Please enter your email address';
                        } else if (!value.contains('@') ||
                            !value.contains('.com')) {
                          return 'Enter a valid Email';
                        }

                        return null;
                      },
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      decoration: _commonInputDecoration.copyWith(
                        labelText: 'Email ID',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Container(
                    width: 345,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        _clearError();
                        if (_formKey.currentState!.validate()) {
                          _showErrorSnackBar('Form successfully validated!');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                      ),
                      child: const Text(
                        'Confirm',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
