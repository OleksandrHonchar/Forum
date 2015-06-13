package com.habds.forum.dao;

import com.habds.forum.Theme;
import com.habds.forum.User;

import java.util.List;


public interface ThemeDAO {

    List getThemes();

    void addTheme(Theme theme);

    Theme getThemeById(int id);

}
