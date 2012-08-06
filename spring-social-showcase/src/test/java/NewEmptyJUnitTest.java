import javax.inject.Provider;
import org.junit.Test;
import org.junit.Assert;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.showcase.HomeController;
import org.springframework.social.showcase.account.AccountRepository;
import org.springframework.social.showcase.signin.SigninController;
import org.springframework.test.AbstractDependencyInjectionSpringContextTests;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.web.servlet.ModelAndView;

public class NewEmptyJUnitTest extends AbstractDependencyInjectionSpringContextTests {
   private final Provider<ConnectionRepository> connectionRepositoryProvider = null;
    private final AccountRepository accountRepository  = null;
     
   public void testHelloController() {
//HomeController h = new HomeController(connectionRepositoryProvider, accountRepository);        
//        h.home(null, null);
       
        
   }
}