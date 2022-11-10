package kesheTest.service.Impl;

import kesheTest.bean.User;
import kesheTest.common.Resp;
import kesheTest.dao.UserMapper;
import kesheTest.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public String getPassword(String name) {

        return userMapper.getPassword(name);
    }

    @Override
    public Resp<User> queryUser(String name, String password) {
        User user = userMapper.queryUser(name,password);
        if(user==null){
            return Resp.error("您输入的用户名或密码有误");
        }
        return Resp.success(user);
    }
}
