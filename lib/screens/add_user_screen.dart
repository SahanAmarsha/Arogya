
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import '../models/user.dart';

import './dashboard_screen.dart';

class AddUserScreen extends StatefulWidget {
  static const routeName = '/add-user';
  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {

  final _ageFocusNode =FocusNode();
  final _nicFocusNode =FocusNode();
  final _occupationFocusNode =FocusNode();
  final _addressFocusNode =FocusNode();
  final _imageUrlController = new TextEditingController();
  final _imgUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();

  var  _editUser = User(
    id: null,
    name: '',
    address: '',
    age: 0,
    occupation: '',
    nicNumber: '',
    avatar: '',
  );
  var _initValues = {
    'name' : '',
    'address' : '',
    'age' : '',
    'occupation' : '',
    'nicNumber': '',
    'avatar': ''
  };
  var _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _imgUrlFocusNode.removeListener(_updateImageUrl);
    _ageFocusNode.dispose();
    _addressFocusNode.dispose();
    _imageUrlController.dispose();
    _imgUrlFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    _imgUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }



  void _updateImageUrl()
  {
    if(!_imgUrlFocusNode.hasFocus)
    {
      setState(() {

      });
    }

  }

  Future<void> _saveForm() async
  {
//    final isValid = _form.currentState.validate();
//    if(!isValid)
//    {
//      return;
//    }
//    _form.currentState.save();
//
//    setState(() {
//      _isLoading = true;
//    });
//
//
//
//      try{
//        await Provider.of<UserProvider>(context, listen: false).addUser(_editUser);
//      } catch (error)
//      {
//        await showDialog(
//            context: context,
//            builder: (ctx) => AlertDialog(
//              title: Text('An error occured'),
//              content: Text('Something went wrong'),
//              actions: <Widget>[
//                FlatButton(
//                  child: Text('Okay'),
//                  onPressed: ()
//                  {
//                    Navigator.of(ctx).pop();
//
//                  },
//                )
//              ],
//            )
//        );
//
//      }
      //      finally{
      //
      //        setState(() {
      //          _isLoading = false;
      //        });
      //      }
//    setState(() {
//      _isLoading = false;
//    });
    Navigator.of(context).pushReplacementNamed(DashboardScreen.routeName);

    //Navigator.of(context).pop();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New User'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              _saveForm();
            },
          )
        ],
      ),
      body: _isLoading?
      Center(
        child:CircularProgressIndicator(),
      ):
      Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: _initValues['name'],
                decoration: InputDecoration(labelText: 'Name'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_)
                {
                  FocusScope.of(context).requestFocus(_nicFocusNode);
                },
                validator: (value)
                {
                  if(value.isEmpty)
                  {
                    return ('Please provide a name');
                  } else
                  {
                    return null;
                  }
                },
                onSaved: (value)
                {
                  _editUser = User(
                    id: _editUser.id,
                    name: value,
                    nicNumber: _editUser.nicNumber,
                    occupation: _editUser.occupation,
                    address: _editUser.address,
                    age: _editUser.age,
                    avatar: _editUser.avatar,
                  );
                },
              ),
              TextFormField(
                initialValue: _initValues['nicNumber'],
                decoration: InputDecoration(labelText: 'NIC Number'),
                textInputAction: TextInputAction.next,
                focusNode: _nicFocusNode,
                onFieldSubmitted: (_)
                {
                  FocusScope.of(context).requestFocus(_occupationFocusNode);
                },
                validator: (value)
                {
                  if(value.isEmpty)
                  {
                    return ('Please provide a valid NIC number');
                  } else
                  {
                    return null;
                  }
                },
                onSaved: (value)
                {
                  _editUser = User(
                    id: _editUser.id,
                    name: _editUser.name,
                    nicNumber: value,
                    occupation: _editUser.occupation,
                    address: _editUser.address,
                    age: _editUser.age,
                    avatar: _editUser.avatar,
                  );
                },
              ),
              TextFormField(
                initialValue: _initValues['occupation'],
                decoration: InputDecoration(labelText: 'Occupation'),
                textInputAction: TextInputAction.next,
                focusNode: _occupationFocusNode,
                onFieldSubmitted: (_)
                {
                  FocusScope.of(context).requestFocus(_ageFocusNode);
                },
                validator: (value)
                {
                  if(value.isEmpty)
                  {
                    return ('Please provide a title');
                  } else
                  {
                    return null;
                  }
                },
                onSaved: (value)
                {
                  _editUser = User(
                    id: _editUser.id,
                    name: _editUser.name,
                    nicNumber: _editUser.nicNumber,
                    occupation: value,
                    address: _editUser.address,
                    age: _editUser.age,
                    avatar: _editUser.avatar,
                  );
                },
              ),
              TextFormField(
                initialValue: _initValues['age'],
                decoration: InputDecoration(labelText: 'Age'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _ageFocusNode,
                onFieldSubmitted: (_)
                {
                  FocusScope.of(context).requestFocus(_addressFocusNode);
                },
                validator: (value)
                {
                  if(value.isEmpty)
                  {
                    return ('Please provide a valid age');

                  }else if(int.tryParse(value)==null){

                    return ('Please enter a valid age');
                  }else if(int.parse(value)<=0)
                  {
                    return ('Please enter a valid age');
                  } else
                  {
                    return (null);
                  }
                },
                onSaved: (value)
                {
                  _editUser = User(
                    name: _editUser.name,
                    age: int.parse(value),
                    address: _editUser.address,
                    avatar: _editUser.avatar,
                    id: _editUser.id,
                    occupation: _editUser.occupation,
                    nicNumber: _editUser.nicNumber
                  );
                },
              ),

              TextFormField(
                initialValue: _initValues['address'],
                decoration: InputDecoration(labelText: 'Address'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _addressFocusNode,
                validator: (value)
                {
                  if(value.isEmpty || value.length<=10)
                  {
                    return ('Please provide a valid address');
                  } else
                  {
                    return (null);
                  }
                },
                onSaved: (value)
                {
                  _editUser = User(
                    name: _editUser.name,
                    id: _editUser.id,
                    nicNumber: _editUser.nicNumber,
                    avatar: _editUser.avatar,
                    age: _editUser.age,
                    address: value,
                    occupation: _editUser.occupation,
                  );
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.only(top: 8, right: 10, ),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: Colors.greenAccent
                        ),
                      ),
                      child: _imageUrlController.text.isEmpty ?
                      Text('Enter a URL') : FittedBox(
                        child: Image.network(_imageUrlController.text),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'image URL',
                      ),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      focusNode: _imgUrlFocusNode,
                      validator: (value)
                      {
                        if(value.isEmpty)
                        {
                          return ('Please provide a imageUrl');
                        } else if(!value.startsWith('http') && !value.startsWith('https'))
                        {
                          return ('Please provide a valid URL');
                        }
                        else
                        {
                          return (null);
                        }
                      },
                      onFieldSubmitted: (_)
                      {
                        _saveForm();
                      },
                      onSaved: (value)
                      {
                        _editUser = User(
                          name: _editUser.name,
                          id: _editUser.id,
                          nicNumber: _editUser.nicNumber,
                          age: _editUser.age,
                          address: _editUser.address,
                          occupation: _editUser.occupation,
                          avatar: value,
                        );
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
