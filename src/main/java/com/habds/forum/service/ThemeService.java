package com.habds.forum.service;

import com.habds.forum.Theme;

import java.util.List;


public interface ThemeService {
    void addTheme(Theme theme);

    List<Theme> getThemes();

    Theme getThemeById(int id);
}
