package kesheTest.service.Impl;

import kesheTest.bean.News;
import kesheTest.dao.NewsMapper;
import kesheTest.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {
    private NewsMapper newsMapper;
    @Autowired
    public void setNewsMapper(NewsMapper newsMapper) {
        this.newsMapper = newsMapper;
    }

    @Override
    public int addNews(News news) {
        return newsMapper.addNews(news);
    }

    @Override
    public int deleteNewsByID(int id) {
        return newsMapper.deleteNewsByID(id);
    }

    @Override
    public int updateNews(News news) {
        return newsMapper.updateNews(news);
    }

    @Override
    public News queryNewsByID(int id) {
        return newsMapper.queryNewsByID(id);
    }

    @Override
    public List<News> queryAllNews() {
        return newsMapper.queryAllNews();
    }

    @Override
    public News queryNewsByHead(String newsHead) {
        return newsMapper.queryNewsByHead(newsHead);
    }
}
