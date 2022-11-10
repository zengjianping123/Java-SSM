package kesheTest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/page")
public class PageController {
    //登录页面
    @RequestMapping("/toLogin")
    public String  loginVeiw(){
        return  "login";
    }
    //主页面
    @RequestMapping("/toMain")
    public String  toMain(){
        return  "main/main";
    }
}
