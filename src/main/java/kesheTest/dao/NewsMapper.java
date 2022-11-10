package kesheTest.dao;

import kesheTest.bean.News;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NewsMapper {
    int addNews(News News);
    int deleteNewsByID(@Param("newsId") int id);
    int updateNews(News News);
    News queryNewsByID(@Param("newsId") int id);
    List<News> queryAllNews();
    News queryNewsByHead(@Param("newsHead") String newsHead);

}
