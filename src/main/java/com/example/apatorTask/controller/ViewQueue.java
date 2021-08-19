package com.example.apatorTask.controller;

import com.example.apatorTask.model.User;
import com.example.apatorTask.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
public class ViewQueue {

    private Long maxPageNumber;

    @Autowired
    private UserService userService;

    @RequestMapping(value="/queue")
    public ModelAndView showQueue(ModelAndView model) {
        int actualPage=0;
        int startpage = 1;
        int endpage = startpage + 10;
        if(maxPageNumber==null){ maxPageNumber= userService.totalUserNumber();}

        model.addObject("maxPage",maxPageNumber);
        model.addObject("users",userService.getUsers(0));
        model.addObject("actualPage",actualPage);
        model.addObject("startpage",startpage);
        model.addObject("endpage",endpage);
        model.setViewName("queue");
        return model;
    }


    @RequestMapping(value = "/viewQueueUsersPage", method = RequestMethod.GET)
    public String viewQueueUsersPage(@RequestParam(value = "page", required = false) int page, ModelMap model) {
        int actualPage=page;
        if(maxPageNumber==null){
            maxPageNumber= userService.totalUserNumber();
        }
        if(page>maxPageNumber) {
            page=0;
            actualPage=0;
        }
        if(page<0) {
            page=0;
            actualPage=0;
        }
        int startpage = page - 5 > 0?page - 5:1;
        int endpage = startpage + 10;

        model.addAttribute("maxPage", maxPageNumber);
        model.addAttribute("users", userService.getUsers(page));
        model.addAttribute("actualPage", actualPage);
        model.addAttribute("startpage", startpage);
        model.addAttribute("endpage", endpage);

        return "queue";
    }

    @RequestMapping(value = "/checkPostionAndTimeUser", method = RequestMethod.POST)
    public ModelAndView checkPostionAndTimeUser(ModelAndView model, HttpServletRequest request){
        String key = request.getParameter("key");

        List <User>users=userService.getAllUsers();

        int actualPage=0;
        int startpage = 1;
        int endpage = startpage + 10;
        if(maxPageNumber==null){ maxPageNumber= userService.totalUserNumber();}
        double waitingTime=0;
        int position=0;
        double lastAddTime;
        boolean information=false;
        for (User user : users) {
            position++;
            if(user.getType_user().equals("0")){
                waitingTime+=60;
                lastAddTime=60;
            }else{
                waitingTime+=20;
                lastAddTime=20;
            }

            if (user.getUser_pseudonym().equals(key) || user.getUser_unique_number().equals(key) ) {
                information=true;
                waitingTime=waitingTime-lastAddTime;
                waitingTime=waitingTime/60;
                model.addObject("waitingTime",waitingTime);
                model.addObject("position",position);
            }
        }

        model.addObject("maxPage",maxPageNumber);
        model.addObject("users",userService.getUsers(0));
        model.addObject("actualPage",actualPage);
        model.addObject("startpage",startpage);
        model.addObject("endpage",endpage);
        model.addObject("information",information);
        model.setViewName("queue");
        return model;
    }









}
