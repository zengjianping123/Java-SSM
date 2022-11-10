package kesheTest.controller;

import kesheTest.bean.News;
import kesheTest.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/news")
public class NewsController {

    @Autowired
    @Qualifier("NewsServiceImpl")
    private NewsService newsService;
    private static boolean isUserLogined = false;
    private static boolean isRootLogined = false;

    /*@RequestMapping("login")
    public String login(String user, String password){
        if((isRootLogined = true) || (isUserLogined = true)){
            isUserLogined = false;
            isRootLogined = false;
        }
        if("root".equals(user) && "root".equals(password)){
            isRootLogined = true;
            System.out.println("你已登录");

            return "redirect:/news/allNews";
        }
         else if ("123".equals(user) && "123".equals(password)){
            isUserLogined = true;
            return "redirect:/news/newsList";
        }
         else {
             return "login";
         }
    }
*/
    @RequestMapping("/allNews")
    public String list(Model model) {
        List<News> list = newsService.queryAllNews();
        model.addAttribute("list", list);
        if(isRootLogined){
            return "allNews";
        }
        else {
            return "redirect:/news/login";
        }


    }

    @RequestMapping("/newsList")
    public String newsList(Model model) {
        List<News> list = newsService.queryAllNews();
        model.addAttribute("list", list);
            return "newsList";
    }

    @RequestMapping("/toAddNews")
    public String toAddPager(){
        if(isRootLogined){
            return "addNews";
        }
        else {
            return "redirect:/news/login";
        }
    }

    @RequestMapping("/addNews")
    public String addNews(News news){
        newsService.addNews(news);
        return "redirect:/news/allNews";
    }

    @RequestMapping("/toUpdateNews")
    public String toUpdatePager(int id,Model model){
        News news = newsService.queryNewsByID(id);
        model.addAttribute("updateNews",news);
        if(isRootLogined){
            return "updateNews";
        }
        else {
            return "redirect:/news/login";
        }
    }

    @RequestMapping("/updateNews")
    public String updateNews(News news){
        newsService.updateNews(news);
        if(isRootLogined){
            return "redirect:/news/allNews";
        }
        else {
            return "redirect:/news/login";
        }
    }

    @RequestMapping("/deleteNews")
    public String deleteNews(int id){
        newsService.deleteNewsByID(id);
        if(isRootLogined){
            return "redirect:/news/allNews";
        }
        else {
            return "redirect:/news/login";
        }
    }

    @RequestMapping("/queryNews")
    public String queryNews(String queryNewsName,Model model){
        News news = newsService.queryNewsByHead(queryNewsName);
        List<News> list = new ArrayList<News>();
        list.add(news);
        if(news == null){
            model.addAttribute("error","未查询到！");
        }
        model.addAttribute("list",list);
        return "allNews";
    }

    @RequestMapping("/userQueryNews")
    public String userQueryNews(String queryNewsHead,Model model){
        News news = newsService.queryNewsByHead(queryNewsHead);
        List<News> list = new ArrayList<News>();
        list.add(news);
        if(news == null){
            model.addAttribute("error","未查询到！");
        }
        model.addAttribute("list",list);
        return "newsList";
    }

    @RequestMapping("/toContentNews")
    public String toContentPage(int id, Model model){
        News news = newsService.queryNewsByID(id);
        model.addAttribute("contentNews",news);
        if(isRootLogined){
            return "contentNews";
        }
        else {
            return "redirect:/news/login";
        }
    }

    @RequestMapping("/toUserContentNews")
    public String toUserContentPage(int id, Model model){
        News news = newsService.queryNewsByID(id);
        model.addAttribute("contentNews",news);
        if(isUserLogined){
            return "userContentNews";
        }
        else {
            return "redirect:/news/login";
        }
    }

    @RequestMapping("/contentNews")
    public String contentNews(){
        if(isUserLogined){
            return "redirect:/news/allNews";
        }
        else {
            return "redirect:/news/login";
        }
    }

    @RequestMapping("/userContentNews")
    public String userContentNews(){
        if(isUserLogined){
            return "redirect:/news/newsList";
        }
        else {
            return "redirect:/news/login";
        }
    }
}
