package com.habds.forum.service;

import com.habds.forum.Theme;
import com.habds.forum.dao.ThemeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;


@Service
public class ThemeServiceImpl implements ThemeService {
    @Autowired
    ThemeDAO themeDAO;

    @Transactional
    public void addTheme(Theme theme) {
        themeDAO.addTheme(theme);

    }

    @Override
    public List<Theme> getThemes() {
        return themeDAO.getThemes();
    }

    @Override
    public Theme getThemeById(int id) {
        return themeDAO.getThemeById(id);
    }


}
