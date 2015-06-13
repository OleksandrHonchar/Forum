package com.habds.forum.dao;

import com.habds.forum.Comment;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Date;


@Repository
public class CommentDAOImpl implements CommentDAO {
    @Autowired
    SessionFactory sessionFactory;

    @Override
    public void addComment(Comment comment) {
        comment.setDate(new Date());
        sessionFactory.getCurrentSession().save(comment);
    }

}
