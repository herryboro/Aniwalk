package kr.pandorabox.aniwalk;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	// preHandle() : 컨트롤러보다 먼저 수행되는 메서드
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        // session 객체를 가져옴
    	String uri = request.getRequestURI();
        HttpSession session = request.getSession();
        // login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
        Object owner = session.getAttribute("mem_nickname");
        Object walker = session.getAttribute("walker_id");
          
        if ( uri.contains("owner") & owner == null ){
            // 로그인이 안되어 있는 상태임으로 로그인 폼으로 다시 돌려보냄(redirect)
            response.sendRedirect("/aniwalk/index.do");
            return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
        }
        
        if ( uri.contains("walker") & walker == null) {
        	response.sendRedirect("/aniwalk/walker/index.do");
        	return false;
        }
          
        // preHandle의 return은 컨트롤러 요청 uri로 가도 되냐 안되냐를 허가하는 의미임
        // 따라서 true로하면 컨트롤러 uri로 가게 됨.
        return true;
    }
}
