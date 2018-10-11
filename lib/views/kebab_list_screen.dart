import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:estiam_doctor_client/redux/actions/kebab_actions.dart';
import 'package:estiam_doctor_client/redux/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:estiam_doctor_client/models/kebab.dart';
import 'package:estiam_doctor_client/views/components/main_drawer.dart';

class KebabListScreen extends StatelessWidget {

  /// Constructor
  KebabListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Kebab App')
      ),
      body: new StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) {
          _ViewModel vm = _ViewModel.fromStore(store);
          return vm;
        },
        builder: (BuildContext context, vm) {
          return _buildKebabList(context, vm.kebabs);
        }
      ),
      drawer: new MainDrawer(),
    );
  }
  
  /// Create kebabs list
  Widget _buildKebabList(BuildContext context, List<Kebab> kebabs) {
    return ListView.builder(
      itemCount: kebabs.length,
      itemBuilder: (context, i) {
        return _buildKebabRow(context, kebabs.elementAt(i));
      },
    );
  }
  
  /// Create row from kebab
  Widget _buildKebabRow(BuildContext context, Kebab kebab) {
    return ListTile(
      title: new Text(kebab.name),
      subtitle: new Text(kebab.price.toString() + ' €'),
      onTap: () {
        print(kebab.toString() + ' tapped');
        StoreProvider.of<AppState>(context).dispatch(
          new KebabRequest(kebab.name)
        );
        Navigator.of(context).pushNamed('/kebabs/details');
      }
    );
  }
}

class _ViewModel {
  final List<Kebab> kebabs;

  /// Constructor
  _ViewModel({
    @required this.kebabs
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(kebabs: store.state.kebab.kebabs);
  }
}