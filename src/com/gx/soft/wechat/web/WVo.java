package com.gx.soft.wechat.web;

import com.gx.core.page.Page;
import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;

import java.util.HashMap;

public class WVo {
    private String touser;
    private String template_id;
    private Data data;
    private String page;

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }

    public String getTouser() {
        return touser;
    }

    public void setTouser(String touser) {
        this.touser = touser;
    }

    public String getTemplate_id() {
        return template_id;
    }

    public void setTemplate_id(String template_id) {
        this.template_id = template_id;
    }

    public Data getData() {
        return data;
    }

    public void setData(Data data) {
        this.data = data;
    }
}
