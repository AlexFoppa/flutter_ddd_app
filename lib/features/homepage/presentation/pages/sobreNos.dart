import 'package:flutter/material.dart';

class SobreNos extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre nós'),
        ),
          body:
          Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
          Text('Lorem ipsum lacus eleifend eros orci cubilia nulla curabitur, velit conubia velit odio blandit consequat sed porttitor, facilisis habitant hendrerit praesent netus sed netus. metus eu curabitur eu elementum risus ornare accumsan nisl dolor, dictumst vehicula nec lorem et taciti aliquam pellentesque, eu dui dapibus vehicula lorem auctor praesent aenean. quisque sed bibendum ante proin quisque imperdiet velit, dictumst ad vel velit quisque aenean blandit curabitur, phasellus egestas gravida orci praesent himenaeos. hac ut torquent iaculis suscipit proin aptent risus congue nullam, aliquam viverra donec elit ut auctor hendrerit viverra aliquam, nibh magna semper donec curabitur porttitor a ut. '),
          RaisedButton(
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              onPressed: () {
               Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
           ]
         )
          )
      );
  }}