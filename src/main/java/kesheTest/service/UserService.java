package kesheTest.service;

import kesheTest.bean.User;
import kesheTest.common.Resp;

public interface UserService {
    String getPassword(String name);

    Resp<User> queryUser(String name, String password);
}
