package kesheTest.controller;

import kesheTest.bean.Constants;
import kesheTest.bean.User;
import kesheTest.common.Resp;
import kesheTest.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Autowired
    private UserService userService;
    //登录
    @RequestMapping("/login")
    @ResponseBody
    public Resp<User> login(HttpSession session, String username, String password, String captcha){
        //判断验证码是否为空
        if(captcha==null){
            //return Resp.error("请输入验证码！");
            return null;
        }
        //获取会话里的验证码数据
        String realCaptcha = (String) session.getAttribute(Constants.CAPTCHA_KEY);
        //判断输入的验证码和生产的验证码是否一致
        if(!captcha.equals(realCaptcha)){
            //如果验证码不对需要移除session里的记录
            session.removeAttribute(Constants.CAPTCHA_KEY);
            System.out.println("输入的验证码有误");
            //return Resp.error("输入的验证码有误");
            return null;
        }
        session.removeAttribute(Constants.CAPTCHA_KEY);
        Resp<User> user = userService.queryUser(username,password);
        if(user.getData()!=null&& user.getData().getStatus()==1){
            System.out.println("您的账号状态已停用");
            //return Resp.error("您的账号状态已停用，请联系管理员");
            return null;

        }
        if (user.getCode()==200) {
            session.setAttribute(Constants.USER_KEY,user.getData());
        }
        System.out.println(user.getData().toString());

        return user;
    }

}
