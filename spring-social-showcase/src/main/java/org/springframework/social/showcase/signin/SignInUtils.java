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
package org.springframework.social.showcase.signin;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.http.HttpRequest;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.social.showcase.account.Account;
import org.springframework.social.showcase.account.AccountRepository;
import org.springframework.web.context.request.WebRequest;

public class SignInUtils {

    private final AccountRepository accountRepository;

    @Inject
    public SignInUtils(AccountRepository accountRepository) {
        this.accountRepository = accountRepository;
    }

    /**
     * Programmatically signs in the user with the given the user ID.
     */
    public static void signin(String userId, Account account, HttpServletRequest request) {
        System.out.println("User Id: " + userId + " Role Name: " + account.getRoleName());
        Set< GrantedAuthority> auths = new HashSet<GrantedAuthority>();
        auths.add(new GrantedAuthorityImpl(account.getRoleName()));


        WebAuthenticationDetails webdetails = null;
        if (null != request) {
            webdetails = new WebAuthenticationDetails(request);
        }



        UsernamePasswordAuthenticationToken auth_request = new UsernamePasswordAuthenticationToken(account, null, auths);
        if (null != webdetails) {
            auth_request.setDetails(webdetails);
        }
// auth_request.setDetails(auths);

        SecurityContextHolder.getContext().setAuthentication(auth_request);
    }
}
