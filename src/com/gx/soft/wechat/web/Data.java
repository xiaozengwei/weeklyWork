package com.gx.soft.wechat.web;

public class Data {
    private thing1 thing1;
    private thing2 thing2;
    private thing3 thing3;
    public Data() {

    }

    public Data(com.gx.soft.wechat.web.thing1 thing1, com.gx.soft.wechat.web.thing2 thing2, com.gx.soft.wechat.web.thing3 thing3) {
        this.thing1 = thing1;
        this.thing2 = thing2;
        this.thing3 = thing3;
    }

    public com.gx.soft.wechat.web.thing1 getThing1() {
        return thing1;
    }

    public void setThing1(com.gx.soft.wechat.web.thing1 thing1) {
        this.thing1 = thing1;
    }

    public com.gx.soft.wechat.web.thing2 getThing2() {
        return thing2;
    }

    public void setThing2(com.gx.soft.wechat.web.thing2 thing2) {
        this.thing2 = thing2;
    }

    public com.gx.soft.wechat.web.thing3 getThing3() {
        return thing3;
    }

    public void setThing3(com.gx.soft.wechat.web.thing3 thing3) {
        this.thing3 = thing3;
    }
}
