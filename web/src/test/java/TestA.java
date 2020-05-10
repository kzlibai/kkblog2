import com.kzewen.common.PageBean;
import com.kzewen.dao.AdminMapper;
import com.kzewen.dao.ArticleMapper;
import com.kzewen.entity.Admin;
import com.kzewen.entity.Article;
import com.kzewen.entity.FileImg;
import com.kzewen.services.ArticleService;
import com.kzewen.services.FileImgService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@ContextConfiguration(locations = {"classpath:spring-mybatis.xml", "classpath:spring-mvc.xml"})
public class TestA extends AbstractJUnit4SpringContextTests {
    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private ArticleService articleService;

    @Autowired
    ArticleMapper articleMapper;

    @Autowired
    private FileImgService fileImgService;

    @Test
    public void testFindByKey() {
        List<Article> articleList = articleMapper.finByKey("3");
        for(Article article:articleList){
            System.out.println(article.getTitle());
        }
    }

    @Test
    public void testFileImg() {
        FileImg fileImg = new FileImg();
        fileImg.setUuid("1");
        FileImg res = fileImgService.findOne(fileImg);
        System.out.println(res.getFileName() + "-------" + res.getStoreaddress());

    }


    @Test
    public void testAdmin() {
        Admin admin = new Admin();
        admin.setAccount("admin");
        admin.setPassword("admin");
        Admin admin1 = adminMapper.selectOne(admin);
        System.out.println(admin1.getBrief());
    }

    @Test
    public void testArticle() {
        PageBean<Article> res = articleService.findAll(1, 5);
        List<Article> list = res.getList();
        for (Article article : list) {
            System.out.println(article.getTitle() + '\n');
        }
    }


}
