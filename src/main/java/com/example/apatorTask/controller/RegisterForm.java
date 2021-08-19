package com.example.apatorTask.controller;


import com.example.apatorTask.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;


@Controller
public class RegisterForm {
    @Autowired
    private UserService userService;

    @RequestMapping(value="/registerForm")
    public ModelAndView index(ModelAndView model) {
        model.setViewName("registerForm");
        return model;
    }


    @RequestMapping(value="/registerUserForm",method = RequestMethod.POST)
    public ModelAndView addUser(ModelAndView model, HttpServletRequest request){
        String pseudonym = request.getParameter("pseudonym");
        String type_user = request.getParameter("options-register");

        if(type_user.equals("instant")) {
            type_user="0";
        }
        if(type_user.equals("vip")) {
            type_user="1";
        }
        if(type_user.equals("normal")) {
            type_user="2";
        }

        boolean isUserAddSuccess=userService.addUserToDatabase(pseudonym,type_user);
        String unique_number = userService.getUnique_number();
        model.addObject("isUserAddSuccess",isUserAddSuccess);
        model.addObject("unique_number",unique_number);
        model.addObject("user_pseudonym",pseudonym);
        model.setViewName("registerForm");
        return model;
    }



}
