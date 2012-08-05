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
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.social.showcase.account.Account;
import org.springframework.social.showcase.account.AccountRepository;

public class SignInUtils {

     private   final AccountRepository accountRepository;

    @Inject
    public SignInUtils(AccountRepository accountRepository) {
        this.accountRepository = accountRepository;
    }
    
    /**
     * Programmatically signs in the user with the given the user ID.
     */
    public static void signin(String userId
            ,Account account
            ) {
        System.out.print(userId+account.getRoleName());
        Set < GrantedAuthority> auths = new HashSet<GrantedAuthority>();
        auths.add(new GrantedAuthorityImpl(account.getRoleName()));
        
        SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken(userId, null, auths));
    }
    
     
}
