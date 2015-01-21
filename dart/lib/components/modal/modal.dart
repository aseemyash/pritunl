library modal_comp;

import 'package:angular/angular.dart' show Component, NgAttr, NgOneWay,
  NgTwoWay, NgCallback;
import 'dart:html' as dom;

@Component(
  selector: 'modal',
  templateUrl: 'packages/pritunl/components/modal/modal.html',
  cssUrl: 'packages/pritunl/components/modal/modal.css'
)
class ModalComp {
  bool state;
  Function submit;
  Function cancel;

  @NgAttr('title')
  String title;

  var _advanced;
  @NgAttr('advanced')
  get advanced {
    return this._advanced;
  }
  set advanced(val) {
    if (val == '') {
      this._advanced = true;
    }
    else {
      this._advanced = false;
    }
  }

  var _okText;
  @NgAttr('ok-text')
  String get okText {
    if (this._okText != null && this._okText != '') {
      return this._okText;
    }
    return 'Ok';
  }
  set okText(String val) {
    this._okText = val;
  }

  var _cancelText;
  @NgAttr('cancel-text')
  String get cancelText {
    if (this._cancelText != null && this._cancelText != '') {
      return this._cancelText;
    }
    return 'Cancel';
  }
  set cancelText(String val) {
    this._cancelText = val;
  }

  void softClose(dom.Element target) {
    if (target.classes.contains('modal')) {
      this.cancel();
    }
  }

  void hardClose() {
    this.cancel();
  }
}
