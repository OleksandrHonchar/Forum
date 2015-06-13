package com.habds.forum.dao;

import com.habds.forum.User;
import java.util.List;

public interface UserDAO {
    List<User> list();

    void addUser(User user);

    void removeUser(int id);

    User getUser(String username);

}
