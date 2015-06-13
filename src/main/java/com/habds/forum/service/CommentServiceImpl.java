package com.habds.forum.service;


import com.habds.forum.Comment;
import com.habds.forum.dao.CommentDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;


@Service

public class CommentServiceImpl implements CommentService {
    @Autowired
    CommentDAO commentDAO;


    @Transactional
    public void addComment(Comment comment) {
        commentDAO.addComment(comment);


    }
}
