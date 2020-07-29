import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/pages/home.dart';
class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  @override
  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this,
      duration: new Duration(milliseconds: 500),
    );
    _iconAnimation = new CurvedAnimation(parent: _iconAnimationController, curve: Curves.easeOut);
    _iconAnimation.addListener(()=>this.setState((){}));
    _iconAnimationController.forward();
  }
  String _email,_password;
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text("Comrade's Club"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        new Image(
            image: new AssetImage("assets/img2.jpg"),
          fit: BoxFit.cover,
          //color: Colors.black54,
          colorBlendMode: BlendMode.darken,
        ),
        new Container(
          padding: new EdgeInsets.fromLTRB(10, 50, 10, 0),
          child: Text("Sign In to Enter..",
          textAlign: TextAlign.center,
          style: TextStyle(
          fontSize: 40.0,
          letterSpacing: 3.0,
          color: Colors.black,
          fontFamily: 'Shadows',)
        ),),
        new Form(
        key: _formKey,
        child: new Container(
          padding: new EdgeInsets.fromLTRB(10, 120, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
            child :new Container(
              child: new FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
            ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: new TextFormField(
              validator: (input) {
                if(input.isEmpty){
                  return 'Please type Something';
                }
                return null;
              },
              onSaved: (input) => _email = input,
              decoration: InputDecoration(
                fillColor: Colors.black,
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Email",
                  border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
            ),),
            Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: TextFormField(
              validator: (input) {
                if(input.length <6){
                  return 'Please type password of at least 6 characters';
                }
                return null;
              },
              onSaved: (input) => _password = input,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Password",
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
              obscureText: true,
            ),),
            new MaterialButton(
              height: 50.0,
              minWidth: 150.0,
              onPressed: signIn,
              color: Colors.orangeAccent,
              splashColor: Colors.amber,
              child: Text('Sign In',
                style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 3.0,
                color: Colors.black,
              ),
              ),
            )
          ],
        ),)
      ),
      ],),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text("Help"),
        backgroundColor: Colors.black,
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
      }
      catch(e){
        print('Error: $e');
        _formKey.currentState.reset();
      }
    }
  }
}