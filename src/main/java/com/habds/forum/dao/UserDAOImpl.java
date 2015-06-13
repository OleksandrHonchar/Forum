package com.habds.forum.dao;


import com.habds.forum.Role;
import com.habds.forum.User;


import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;


import java.util.List;


@Repository
public class UserDAOImpl implements UserDAO {
    public static final int DEFAULT_ROLE = 2;

    @Autowired
    private SessionFactory sessionFactory;


    @Override
    @SuppressWarnings("unchecked")
    public List<User> list() {
        return sessionFactory.getCurrentSession().createQuery("from User").list();
    }

    @Override
    public void addUser(User user) {
        Role role = (Role) sessionFactory.getCurrentSession().get(Role.class, DEFAULT_ROLE);// 2 - id
        user.setRole(role);
        user.setEnabled(true);
        sessionFactory.getCurrentSession().save(user);
    }

    @Override
    public void removeUser(int id) {
        User user = (User) sessionFactory.getCurrentSession().load(User.class, id);
        if (user != null) {
            sessionFactory.getCurrentSession().delete(user);
        }
    }

    @Override
    public User getUser(String username) {
        Query query = sessionFactory.getCurrentSession().createQuery("select u from User u where u.username = :username");
        query.setParameter("username", username);
        return (User) query.list().get(0);
    }

}
