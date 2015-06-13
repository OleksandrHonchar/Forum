package com.habds.forum.security;


import com.habds.forum.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
@Transactional(readOnly = true)
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserDAO userDAO;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        com.habds.forum.User domainUser = userDAO.getUser(username);


        boolean accountNonExpired = true;
        boolean credentialsNonExpired = true;
        boolean accountNonLocked = true;

        return new User(
                domainUser.getUsername(),
                domainUser.getPassword(),
                domainUser.isEnabled(),
                accountNonExpired,
                credentialsNonExpired,
                accountNonLocked,
                getAuthorities(domainUser.getRole().getId())
        );
    }

    public Collection<? extends GrantedAuthority> getAuthorities(int role) {
        return getGrantedAuthorities(getRoles(role));
    }

    public List<String> getRoles(int role) {

        List<String> roles = new ArrayList<String>();


        if (role == 1) {
            roles.add("ROLE_ADMIN");
            roles.add("ROLE_USER");
        } else if (role == 2) {
            roles.add("ROLE_USER");
        }

        return roles;
    }

    public static List<GrantedAuthority> getGrantedAuthorities(List<String> roles) {
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

        for (String role : roles) {
            authorities.add(new SimpleGrantedAuthority(role));
        }

        return authorities;
    }


}
