package kesheTest.dao;

import kesheTest.bean.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapper {

    String getPassword(String name);

    User queryUser(@Param("name") String name,@Param("password")String password);
}
