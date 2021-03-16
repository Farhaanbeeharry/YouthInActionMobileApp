import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yia/common/StateMonitor.dart';

abstract class Controller {
  BuildContext context;
  View view;
  Map<String, dynamic> widget;
  bool ready = false;

  getWidget(String name) {
    return widget[name] == null ? false : widget[name];
  }

  onInit() async {}

  onReady() {} //override to call your function on ready (after initState)
}

mixin View<T extends StatefulWidget> on State<T> {
  Controller viewController;
  bool _disposed = false;
  bool _ready = false;
  List<dynamic> callbacks = [];

  _init(Controller controller, [Map<String, dynamic> widgets]) {
    this.viewController = controller;
    viewController.view = this;
    viewController.widget = widgets;
    this.viewController.ready = true;
    _addInstance(getName());
    this.viewController.onInit();
  }

  _addInstance(InstanceNames instanceName) {
    StateMonitor.addControllerInstance(instanceName, this.viewController);
    StateMonitor.addViewInstance(instanceName, this);
  }

  InstanceNames
      getName(); // override to the name of that instance of the object
  Widget getBody(); // the widget that comprises the main view
  Controller getController(); // the controller for that view
  Map<String, dynamic> getWidget() {
    // make the parameters passed to the widget accessible
    // override to return your own.. see example at passwordFormField
    return null;
  }

  @override
  void initState() {
    super.initState();
    this._ready = true;
    this._checkSetStateQueue();
    new Timer(new Duration(seconds: 1), this.getController().onReady);
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
    StateMonitor.removeViewInstance(getName());
    StateMonitor.removeControllerInstance(getName());
  }

  @override
  Widget build(BuildContext context) {
    this._init(this.getController(), this.getWidget());
    this.viewController.context = context;
    return this.getBody();
  }

  callSetState(callback) {
    if (!this._disposed) {
      if (!this._ready) {
        if (callback != null) this.callbacks.add(callback);
      } else {
        setState(() => {if (callback != null) callback()});
        this._checkSetStateQueue();
      }
    }
  }

  _checkSetStateQueue() {
    if (!this._ready) return;

    if (this.callbacks.length > 0) {
      setState(() {
        for (var callback in this.callbacks) if (callback != null) callback();
      });
    }
  }
}

class OPRTypes {
  static int Unchanged = 0;
  static int Added = 4;
  static int Deleted = 12;
  static int Modified = 16;
}
