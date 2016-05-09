package cn.chia.pay.wechat.util.authorization.token;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * @author 莫庆来, 2016年4月20日 下午12:13:22
 * <p>启动Servlet，初始化servlet时，即启动请求access_token的线程，并将其保存在内存中，
 * 通过CacheToken对象访问获取的 token</p>
 * <p>应该考虑用redis来存</p>
 */
@Controller
public class TokenServlet extends HttpServlet{

	private static final long serialVersionUID = 3927756062086902356L;
	
	@Override
	public void init() throws ServletException {
//		new Thread(new TokenListener()).start();
	}
}
