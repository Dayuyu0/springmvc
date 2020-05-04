package com.lagou.edu.controller;

import com.lagou.edu.dao.ResumeDao;
import com.lagou.edu.pojo.Resume;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ResumeController {

     @Autowired
     private ResumeDao resumeDao;

     @RequestMapping(value = "/login", method = RequestMethod.GET)
     public String home(){
          return "login";
     }


     @RequestMapping(value = "/login",method = RequestMethod.POST)
     public String login(HttpServletRequest request, HttpServletResponse response, String username,String password){
          if(username.equals("admin") & password.equals("admin")){
               request.getSession().setAttribute("username",username);
               response.addHeader("username",username);
               return "redirect:list";
          }
          return "redirect:login";

     }

     @RequestMapping("/list")
     public ModelAndView queryAll(){
          List<Resume> all = resumeDao.findAll();
          ModelAndView modelAndView = new ModelAndView();
          modelAndView.addObject("list",all);
          modelAndView.setViewName("list");
          return modelAndView;
     }


     @RequestMapping(value = "/edit", method = RequestMethod.POST)
     @ResponseBody
     public Object edit(@RequestBody Resume resume) {
          resumeDao.save(resume);
          Map<String, String > map = new HashMap<>();
          map.put("status", "ok");
          return map;
     }
     @RequestMapping(value = "/edit", method = RequestMethod.GET)
     public ModelAndView edit(@RequestParam(value = "id", required = false) Long id){
          ModelAndView modelAndView = new ModelAndView();
          if (id != null){
               Resume resume = resumeDao.findById(id).get();
               modelAndView.addObject("resume",resume);
               modelAndView.setViewName("edit");
          }
          return modelAndView;
     }

     @RequestMapping("/deleteOne")
     public String deleteOne(@RequestParam("id") Long id) {
          resumeDao.deleteById(id);
          return "redirect:list";
     }

}
