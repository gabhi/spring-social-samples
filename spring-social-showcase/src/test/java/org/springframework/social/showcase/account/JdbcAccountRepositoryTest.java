/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.springframework.social.showcase.account;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 *
 * @author Abhijit Gaikwad <gaikwad.abhijit@gmail.com>
 */
@RunWith(SpringJUnit4ClassRunner.class)
public class JdbcAccountRepositoryTest {
    
    @Autowired
    JdbcAccountRepository jdbcAccountRepository;
    
    public JdbcAccountRepositoryTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of createAccount method, of class JdbcAccountRepository.
     */
    @Test
    public void testCreateAccount() throws Exception {
        System.out.println("createAccount");
        Account user = null;
        jdbcAccountRepository.createAccount(user);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of findAccountByUsername method, of class JdbcAccountRepository.
     */
    @Test
    public void testFindAccountByUsername() {
        System.out.println("findAccountByUsername");
        String username = "";
         Account expResult = new Account("abhijit", "abhijit", "abhijit", "gaikwad", "ROLE_JOBSEEKER", 1);
        Account result = jdbcAccountRepository.findAccountByUsername("abhijit");
        assertEquals(expResult, result);
     }
}
