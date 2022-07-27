import 'package:flutter/material.dart';
import 'package:testa5er/pages/news.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isValid = false;
  bool isValid2 = false;
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color.fromRGBO(57, 118, 193, 100),

      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
               Center(

                 child: Container(
                   height: 250,
                    child: Center(child: Text("LOGIN" , style: TextStyle(fontSize: 36 , fontWeight: FontWeight.w800 , color: Colors.white),)),
                  ),
               ),
              Center(

                child: Container(

                  height: (1-.25)*MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35))
                  ),
                  child: Center(child:Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: const InputDecoration(
                              focusColor: Color.fromRGBO(57, 118, 193, 100),
                              icon: Icon(Icons.person , color: Color.fromRGBO(57, 118, 193, 100),),
                              // hintText: 'User Name',
                              labelText: 'User Name',
                              labelStyle: TextStyle(
                                color: Color.fromRGBO(57, 118, 193, 100),
                              )

                          ),
                          onSaved: (value) {
                            // This optional block of code can be used to run
                            // code when the user saves the form.
                          },
                          onFieldSubmitted: (value) {
                            //Validator
                          },
                          validator: (value) {
                            if (value!.isEmpty || value.length < 3) {
                              print(value.length);
                              return 'Enter More Than 3 Number';
                            }
                            isValid = true;
                            return null;
                          },
                        ),
                        SizedBox(height: 25,),
                        TextFormField(
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: const InputDecoration(
                            focusColor: Color.fromRGBO(57, 118, 193, 100),
                            // hoverColor: Color.fromRGBO(57, 118, 193, 100),
                            icon: Icon(Icons.lock , color: Color.fromRGBO(57, 118, 193, 100),),
                            // hintText: 'User Name',
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(57, 118, 193, 100),
                            )

                          ),

                          onSaved: (value) {
                            // This optional block of code can be used to run
                            // code when the user saves the form.
                          },
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 7) {
                              return 'Enter a valid password! (More Than 7 char or number)';
                            }
                            isValid2 = true;
                            return null;
                          },
                        ),
                        SizedBox(height: 25,),
                        ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(57, 118, 193, 100)),),
                            onPressed: () => {
                              _submit(),
                              {(isValid2 == true && isValid == true)? Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const NewsScreen()),
                              ) :null}
                            },
                            child: Text("LOGIN")),
                        SizedBox(height: 25,),
                        Text("New Member ... ?" ,style: TextStyle(fontStyle: FontStyle.italic),)
                      ],
                    ),
                  )),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
