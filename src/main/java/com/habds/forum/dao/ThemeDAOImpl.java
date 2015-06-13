package com.habds.forum.dao;

import com.habds.forum.Theme;
import com.habds.forum.User;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;


@Repository
public class ThemeDAOImpl implements ThemeDAO {

    @Autowired
    private SessionFactory sessionFactory;


    @Override
    public List<Theme> getThemes() {
        return sessionFactory.getCurrentSession().createQuery("from Theme").list();
    }


    @Override
    public void addTheme(Theme theme) {
        theme.setDate(new Date());
        sessionFactory.getCurrentSession().save(theme);
    }

    @Override
    public Theme getThemeById(int id) {
        Query query = sessionFactory.getCurrentSession().createQuery("select t from Theme t where t.id = :id");
        query.setParameter("id", id);
        return (Theme) query.list().get(0);
    }
}
