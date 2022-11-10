package kesheTest.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class AppListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // 给 jsp 中的 applicationScope 添加一个存放虚拟目录的变量
        ServletContext servletContext = sce.getServletContext();
        servletContext.setAttribute("baseUrl", servletContext.getContextPath());
        System.out.println(servletContext.getContextPath());
    }


}
