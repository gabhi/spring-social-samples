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

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.http.HttpRequest;

import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.web.SignInAdapter;
import org.springframework.social.showcase.account.Account;
import org.springframework.social.showcase.account.AccountRepository;
import org.springframework.social.showcase.account.JdbcAccountRepository;
import org.springframework.web.context.request.NativeWebRequest;

public class SimpleSignInAdapter implements SignInAdapter {

  private final RequestCache requestCache;
  private final AccountRepository accountRepository;

  @Inject
  public SimpleSignInAdapter(RequestCache requestCache, AccountRepository accountRepository) {
    this.requestCache = requestCache;
    this.accountRepository = accountRepository;
  }

  @Override
  public String signIn(String localUserId, Connection<?> connection, NativeWebRequest request) {
    //   Account userAccount =  jdbcAccountRepository.findAccountByUsername(localUserId);

    // SignInUtils.signin(localUserId,userAccount);
    // requestCache.getRequest(null, null)
    System.out.print(accountRepository.findAccountByUsername(localUserId));
    SignInUtils.signin(localUserId, accountRepository.findAccountByUsername(localUserId), request.getNativeRequest(HttpServletRequest.class));
    return extractOriginalUrl(request);
  }

  private String extractOriginalUrl(NativeWebRequest request) {
    HttpServletRequest nativeReq = request.getNativeRequest(HttpServletRequest.class);
    HttpServletResponse nativeRes = request.getNativeResponse(HttpServletResponse.class);
    SavedRequest saved = requestCache.getRequest(nativeReq, nativeRes);
    if (saved == null) {
      return null;
    }
    requestCache.removeRequest(nativeReq, nativeRes);
    removeAutheticationAttributes(nativeReq.getSession(false));
    return saved.getRedirectUrl();
  }

  private void removeAutheticationAttributes(HttpSession session) {
    if (session == null) {
      return;
    }
    session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
  }
}
