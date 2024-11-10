//package wyz.jingangHotel02.ssm.interceptor;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.web.servlet.HandlerInterceptor;
//import org.springframework.web.servlet.ModelAndView;
//
//public class LoginInterceptor implements HandlerInterceptor {
//
//	@Override
//	public void afterCompletion(HttpServletRequest arg0,
//			HttpServletResponse arg1, Object arg2, Exception arg3)
//			throws Exception {
//		// TODO Auto-generated method stub
//
//	}
//
//	@Override
//	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
//			Object arg2, ModelAndView arg3) throws Exception {
//		// TODO Auto-generated method stub
//
//	}
//
//	@Override
//	public boolean preHandle(HttpServletRequest request,
//			HttpServletResponse response, Object handler) throws Exception {
//		String url = request.getRequestURI();
//		if (url.indexOf("login.action") >= 0) {
//			return true;
//		}
//		HttpSession session = request.getSession();
//		String phone = (String) session.getAttribute("phone");
//		if (phone != null) {
//			return true;
//		}
//		request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request,
//				response);
//		return false;
//	}
//
//}
