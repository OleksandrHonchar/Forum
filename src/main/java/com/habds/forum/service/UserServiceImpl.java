package com.habds.forum.service;

import com.habds.forum.User;
import com.habds.forum.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;


    @Transactional
    public void addUser(User user) {
        userDAO.addUser(user);
    }

    @Transactional
    public List<User> list() {
        return userDAO.list();
    }

    @Transactional
    public void removeUser(int id) {
        userDAO.removeUser(id);
    }

    @Transactional
    public User getUser(String username) {
        return userDAO.getUser(username);
    }

    @Override
    public User getLoggedInUser() {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        return userDAO.getUser(username);
    }
}
