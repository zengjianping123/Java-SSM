package kesheTest.service;

import kesheTest.bean.News;

import java.util.List;

public interface NewsService {
    int addNews(News news);
    int deleteNewsByID(int id);
    int updateNews(News news);
    News queryNewsByID(int id);
    List<News> queryAllNews();
    News queryNewsByHead(String newsHead);
}
