import com.kzewen.dao.AdminMapper;
import com.kzewen.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;

public class Test {
    @Autowired
    private AdminMapper adminMapper;

    @org.junit.Test
    public void testLogin(){
        Admin admin = new Admin();
        admin.setAccount("admin");
        admin.setPassword("admin");
        Admin res = adminMapper.selectOne(admin);
       /* Admin res = adminMapper.login(admin);*/
        System.out.println(res.getBrief());
    }
}
