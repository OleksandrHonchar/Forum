package com.habds.forum.controllers;

import com.habds.forum.Comment;
import com.habds.forum.Theme;
import com.habds.forum.service.CommentService;
import com.habds.forum.service.ThemeService;
import com.habds.forum.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import java.util.Map;


@Controller
public class ThemeController {


    @Autowired
    private ThemeService themeService;
    @Autowired
    private UserService userService;
    @Autowired
    private CommentService commentService;

    @RequestMapping(value = "/addTheme", method = RequestMethod.POST)
    public String addTheme(@ModelAttribute("theme") Theme theme, BindingResult result) {
        theme.setUser(userService.getLoggedInUser());
        themeService.addTheme(theme);

        return "redirect:/themes/"+theme.getId();
    }

    @RequestMapping(value = {"/", "/forum"})
    public String listThemes(Map<String, Object> map) {
        map.put("themes", themeService.getThemes());

        return "themes";
    }

    @RequestMapping(value = "/themes/{themeId}")
    public String theme(@PathVariable int themeId, Map<String, Object> map) {

        Theme theme = themeService.getThemeById(themeId);
        map.put("theme", theme);
        map.put("comments", theme.getComments());
        return "theme";
    }

    @RequestMapping(value = "/themes/{themeId}/addComment", method = RequestMethod.POST)
    public String addComment(@ModelAttribute("comment") Comment comment, @PathVariable int themeId,
                             BindingResult result) {

        comment.setUser(userService.getLoggedInUser());
        comment.setTheme(themeService.getThemeById(themeId));
        commentService.addComment(comment);

        return "redirect:/themes/{themeId}";
    }
}
