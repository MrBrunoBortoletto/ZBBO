sap.ui.define(["sap/ui/core/mvc/Controller","sap/m/MessageToast","sap/ui/model/json/JSONModel","sap/ui/model/resource/ResourceModel"],function(e,o,t,n){"use strict";return e.extend("com.numenit.bbortoletto.HelloWorld.controller.View1",{onInit:function(){+
var e={recipient:{name:"world"}};var o=new t(e);this.getView().setModel(o);var r=new n({bundleName:"com.numenit.bbortoletto.HelloWorld.controller.View1"});this.getView().setModel(r,"i18")},onShowHello:function(){var e=this.getView().getModel("i18n").getR+
esourceBundle();var t=this.getView().getModel().getProperty("/recipient/name");var n=e.getText("Olá",[t]);o.show(n)}})});                                                                                                                                      