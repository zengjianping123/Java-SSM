package kesheTest.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

@RequestMapping("/file")
@RestController
public class FileController {
    @RequestMapping("/showImg")
    public void showImg(HttpSession session, HttpServletResponse response, HttpServletRequest request,String filename){
        FileInputStream fis = null;
        ServletOutputStream os = null;
        File file = null;
        String fileAdress = "F:\\PROJECT\\img\\";
        try {
            //创建文件对象
            file = new File(fileAdress+filename);
            //判断文件是否存在，不存在则返回提示信息
            if(!file.exists()){
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
            //创建输入流
            fis = new FileInputStream(file);
            //创建输出流
            os = response.getOutputStream();
            //创建字节数组
            byte[] bytes = new byte[1024 * 4];
            int len = 0;
            //输入流写入输出流
            while((len=fis.read(bytes))>0) {
                os.write(bytes, 0, len);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if(os!=null){
                try {
                    os.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (fis!=null) {
                try {
                    fis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }


    }

}
