/*
 * Copyright 2011 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.springframework.social.showcase.account;

import java.security.Principal;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;

public class Account extends User implements Principal {

    private final String username;
    private final String password;
    private final String firstName;
    private final String lastName;
    private final String roleName;

    public String getRoleName() {
        return roleName;
    }

    public Account(String username, String password, String firstName, String lastName, final String roleName //,Set<GrantedAuthority> authorities
            ) {
        super(username, "", new HashSet<GrantedAuthority>() {
            {
                add(new GrantedAuthorityImpl(roleName));
            }
        });

        this.username = username;

        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.roleName = roleName;
    }

    public Account(String username, String password, boolean enabled,
            boolean accountNonExpired, boolean credentialsNonExpired,
            boolean accountNonLocked, String firstName, String lastName, String roleName, Set<GrantedAuthority> authorities) {
        super(username, password, enabled, accountNonExpired, credentialsNonExpired,
                accountNonLocked, authorities);
        this.username = username;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.roleName = roleName;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

//    @Override
//    public String toString() {
//        return this.username;
//    }
    public Collection<? extends GrantedAuthority> getAuthoritiesFromDB() {
        Set< GrantedAuthority> authorities = new HashSet<GrantedAuthority>();
        authorities.add(new GrantedAuthorityImpl(getRoleName()));
        return authorities;
    }

    @Override
    public boolean isAccountNonExpired() {
        //TODO
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        //TODO
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        //TODO
        return true;
    }

    @Override
    public boolean isEnabled() {
        //TODO
        return true;
    }

    @Override
    public String getName() {
        return getUsername();
    }
}
