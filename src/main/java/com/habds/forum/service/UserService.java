package com.habds.forum.service;

import com.habds.forum.User;

import java.util.List;


public interface UserService {
    List<User> list();

    void addUser(User user);

    void removeUser(int id);

    User getUser(String username);

    User getLoggedInUser ();
}
