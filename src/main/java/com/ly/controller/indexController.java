package com.ly.controller;

import com.ly.service.Index.IndexService;
import com.ly.service.User.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

@Controller
public class indexController {
    @Autowired
    @Qualifier("IndexServiceImpl")
    private IndexService indexService;

}
