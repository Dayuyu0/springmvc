package com.lagou.demo.controller;

import com.lagou.demo.service.IDemoService;
import com.lagou.edu.mvcframework.annotations.LagouAutowired;
import com.lagou.edu.mvcframework.annotations.LagouController;
import com.lagou.edu.mvcframework.annotations.LagouRequestMapping;
import com.lagou.edu.mvcframework.annotations.LagouSecurity;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@LagouController
@LagouRequestMapping("/demo")
@LagouSecurity(value={"1","2"})
public class DemoController {


    @LagouAutowired
    private IDemoService demoService;


    /**
     * URL: /demo/query?name=lisi
     * @param request
     * @param response
     * @param name
     * @return
     */
    @LagouRequestMapping("/query")
    @LagouSecurity(value={"1"})
    public String query(HttpServletRequest request, HttpServletResponse response,String name) {
        return demoService.get(name);
    }

    @LagouRequestMapping("/delete")
    @LagouSecurity(value={"2"})
    public boolean delete(HttpServletRequest request, HttpServletResponse response,String name) {
        return true;
    }
}
