
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

  final _priceFocusNode =FocusNode();
  final _descFocusNode =FocusNode();
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
    _priceFocusNode.dispose();
    _descFocusNode.dispose();
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
    final isValid = _form.currentState.validate();
    if(!isValid)
    {
      return;
    }
    _form.currentState.save();

    setState(() {
      _isLoading = true;
    });



      try{
        await Provider.of<UserProvider>(context, listen: false).addUser(_editUser);
      } catch (error)
      {
        await showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text('An error occured'),
              content: Text('Something went wrong'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Okay'),
                  onPressed: ()
                  {
                    Navigator.of(ctx).pop();

                  },
                )
              ],
            )
        );

      }
      //      finally{
      //
      //        setState(() {
      //          _isLoading = false;
      //        });
      //      }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pushReplacementNamed(DashboardScreen.routeName);

    //Navigator.of(context).pop();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
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
                initialValue: _initValues['title'],
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_)
                {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                validator: (value)
                {
                  if(value.isEmpty)
                  {
                    return ('Please provide a value');
                  } else
                  {
                    return null;
                  }
                },
                onSaved: (value)
                {
                  _editUser = Product(
                    title: value,
                    price: _editUser.price,
                    desc: _editUser.desc,
                    imgUrl: _editUser.imgUrl,
                    id: _editUser.id,
                    isFavourite: _editUser.isFavourite,
                  );
                },
              ),
              TextFormField(
                initialValue: _initValues['price'],
                decoration: InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_)
                {
                  FocusScope.of(context).requestFocus(_descFocusNode);
                },
                validator: (value)
                {
                  if(value.isEmpty)
                  {
                    return ('Please provide a value');

                  }else if(double.tryParse(value)==null){

                    return ('Please enter a valid number');
                  }else if(double.parse(value)<=0.0)
                  {
                    return ('Please enter a valid number');
                  } else
                  {
                    return (null);
                  }
                },
                onSaved: (value)
                {
                  _editUser = Product(
                    title: _editUser.title,
                    price: double.parse(value),
                    desc: _editUser.desc,
                    imgUrl: _editUser.imgUrl,
                    id: _editUser.id,
                    isFavourite: _editUser.isFavourite,
                  );
                },
              ),

              TextFormField(
                initialValue: _initValues['description'],
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descFocusNode,
                validator: (value)
                {
                  if(value.isEmpty)
                  {
                    return ('Please provide a description');
                  } else if(value.length<=10)
                  {
                    return ('Description should be more than 10 characters');
                  } else
                  {
                    return (null);
                  }
                },
                onSaved: (value)
                {
                  _editUser = Product(
                    title: _editUser.title,
                    price:_editUser.price,
                    desc: value,
                    imgUrl: _editUser.imgUrl,
                    id: _editUser.id,
                    isFavourite: _editUser.isFavourite,
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
                        _editUser = Product(
                          title: _editUser.title,
                          price: _editUser.price,
                          desc: _editUser.desc,
                          imgUrl: value,
                          id: _editUser.id,
                          isFavourite: _editUser.isFavourite,
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
