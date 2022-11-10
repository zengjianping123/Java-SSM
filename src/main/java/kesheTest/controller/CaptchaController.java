package kesheTest.controller;


import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.LineCaptcha;
import kesheTest.bean.Constants;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class CaptchaController {

    /**
     * 输入图片验证码
     * @param resp 将向该响应中输出一张图片验证码
     * @param session 图片验证码的内容将存入该 session
     */
    @RequestMapping("/captcha")
    public void captcha(HttpServletResponse resp, HttpSession session) throws IOException {
        LineCaptcha lineCaptcha = CaptchaUtil.createLineCaptcha(100, 38, 1, 100);
        session.setAttribute(Constants.CAPTCHA_KEY, lineCaptcha.getCode());
        lineCaptcha.write(resp.getOutputStream());
    }
}
