/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.61
 * Generated at: 2021-02-04 15:38:51 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.bc.mybatis.CommVO;
import java.util.List;
import com.bc.mybatis.BBSVO;
import com.bc.mybatis.DAO;

public final class view_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("jar:file:/Users/yuna/Desktop/mystudy/60_Web/JSP/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/14_BBS/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1612363716000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("com.bc.mybatis.BBSVO");
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("com.bc.mybatis.CommVO");
    _jspx_imports_classes.add("com.bc.mybatis.DAO");
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    \n");
      out.write("    ");
      out.write('\n');
 
	//파라미터 값 확인
	String b_idx = request.getParameter("b_idx");
	String cPage = request.getParameter("cPage");

	//1.게시글 조회수 1 증가 (실습)
	//BBSVO vo = new BBSVO();
	//String hit = Integer.toString(DAO.updateHit(b_idx));	
	//vo.setHit(hit);
	//System.out.println(">view hit : " + vo.getHit());
	
	DAO.updateHit(Integer.parseInt(b_idx));

	//2. 게시글 (b_idx) 데이터 조회 //  후 화면 표시(나중에~)
	BBSVO bvo = DAO.selectOne(b_idx);
	System.out.println(">view bvo : " + bvo);
	
	// 3. 게시글 (b_idx)에 딸린 댓글이 있으면 화면표시 (검색, 찾기)
	List<CommVO> list = DAO.getCommList(b_idx);
	System.out.println(">view comm list : " + list);
	
	// EL, JSTL 사용을 위한 scope 상에 속성 등록하고 화면 표시
	session.setAttribute("bvo", bvo);
	session.setAttribute("cPage", cPage);
	pageContext.setAttribute("c_list", list);
	

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<title>View Content</title>\n");
      out.write("<link href=\"/14_BBS/css/board.css\" rel=\"stylesheet\">\n");
      out.write("<style>\n");
      out.write("\t#bbs table {\n");
      out.write("\t\twidth: 580px;\n");
      out.write("\t\tmargin-left: 10px;\n");
      out.write("\t\tborder-collapse: collapse;\n");
      out.write("\t\tfont-size: 14px;\n");
      out.write("\t}\n");
      out.write("\t#bbs table caption {\n");
      out.write("\t\tfont-size: 20px;\n");
      out.write("\t\tfont-weight: bold;\n");
      out.write("\t\tmargin-bottom: 10px;\n");
      out.write("\t}\n");
      out.write("\t#bbs table th, #bbs table td {\n");
      out.write("\t\ttext-align: center;\n");
      out.write("\t\tborder: 1px solid black;\n");
      out.write("\t\tpadding: 4px 10px;\n");
      out.write("\t}\n");
      out.write("\t#bbs .align-left { text-align: left; }\n");
      out.write("\t\n");
      out.write("\t.title { background-color: lightsteelblue; }\n");
      out.write("\t\n");
      out.write("\t.no { width: 10%; }\n");
      out.write("\t.writer { width: 15%; }\n");
      out.write("\t.regdate { width: 20%; }\n");
      out.write("\t.hit { width: 15%; }\n");
      out.write("\t\n");
      out.write("\t/***** 페이지 표시 부분 스타일(시작) ****/\n");
      out.write("\t.paging { \n");
      out.write("\t\tlist-style: none;\n");
      out.write("\t\t\n");
      out.write("\t }\n");
      out.write("\t.paging li {\n");
      out.write("\t\tfloat: left;\n");
      out.write("\t\tmargin-right: 8px;\n");
      out.write("\t}\n");
      out.write("\t.paging li a {\n");
      out.write("\t\ttext-decoration: none;\n");
      out.write("\t\tdisplay: block;\n");
      out.write("\t\tpadding: 3px 7px;\n");
      out.write("\t\tborder: 1px solid rgba(56, 56, 56, 0.986);;\n");
      out.write("\t\tfont-weight: bold;\n");
      out.write("\t\tcolor: black;\n");
      out.write("\t}\n");
      out.write("\t.paging .disable {\n");
      out.write("\t\tborder: 1px solid silver;\n");
      out.write("\t\tpadding: 3px 7px;\n");
      out.write("\t\tcolor: silver;\n");
      out.write("\t}\n");
      out.write("\t.paging .now {\n");
      out.write("\t\tborder: 1px solid pink;\n");
      out.write("\t\tpadding: 3px 7px;\n");
      out.write("\t\tbackground-color: pink;\n");
      out.write("\t}\n");
      out.write("\t.paging li a:hover {\n");
      out.write("\t\tbackground-color: rgba(56, 56, 56, 0.986);\n");
      out.write("\t\tcolor: white;\n");
      out.write("\t}\n");
      out.write("\t/***** 페이지 표시 부분 스타일(끝) ****/\n");
      out.write("</style>\n");
      out.write("<script>\n");
      out.write("\t// 파라미터 값 (cPage 값을 함께 넘겨준다.)\n");
      out.write("\tfunction modify_go() {\n");
      out.write("\t\tdocument.frm.action = \"modify.jsp\";\n");
      out.write("\t\tdocument.frm.submit();\n");
      out.write("\t}\n");
      out.write("\tfunction delete_go() {\n");
      out.write("\t\tdocument.frm.action = \"delete.jsp\";\n");
      out.write("\t\tdocument.frm.submit();\n");
      out.write("\t}\n");
      out.write("\t//목록은 이전에 봤던 목록페이지로 돌아가게 해준다. (cPage값으로 인식!)\n");
      out.write("\tfunction list_go() {\n");
      out.write("\t\tdocument.frm.action = \"list.jsp\";\n");
      out.write("\t\tdocument.frm.submit();\n");
      out.write("\t}\n");
      out.write("</script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<div id=\"bbs\">\n");
      out.write("\n");
      out.write("<form method=\"post\" name=\"frm\">\n");
      out.write("\t<table>\n");
      out.write("\t\t<caption>Details</caption>\n");
      out.write("\t<tbody>\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t\t<th>Title</th>\n");
      out.write("\t\t\t<td>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${bvo.subject }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</td>\n");
      out.write("\t\t</tr>\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t\t<th>Writer</th>\n");
      out.write("\t\t\t<td>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${bvo.writer }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</td>\n");
      out.write("\t\t</tr>\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t\t<th>Attached-File</th>\n");
      out.write("\t\t\t<td>\n");
      out.write("\t\t\t");
      if (_jspx_meth_c_005fif_005f0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("\t\t\t");
      if (_jspx_meth_c_005fif_005f1(_jspx_page_context))
        return;
      out.write("\n");
      out.write("\t\t\t</td>\n");
      out.write("\t\t</tr>\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t\t<th>Content</th>\n");
      out.write("\t\t\t<td>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${bvo.content }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</td>\n");
      out.write("\t\t</tr>\n");
      out.write("\t\t</tbody>\n");
      out.write("\t\t<tfoot>\n");
      out.write("\t\t\t<tr>\n");
      out.write("\t\t\t\t<td colspan=\"2\">\n");
      out.write("\t\t\t\t\t<input type=\"button\" value=\"수정\" onclick=\"modify_go()\">\n");
      out.write("\t\t\t\t\t<input type=\"button\" value=\"삭제\" onclick=\"delete_go()\">\n");
      out.write("\t\t\t\t\t<input type=\"button\" value=\"목록\" onclick=\"list_go()\">\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" name=\"cPage\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${cPage }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("\t\t\t\t</td>\n");
      out.write("\t\t\t</tr>\n");
      out.write("\t\t</tfoot>\n");
      out.write("\t</table>\n");
      out.write("</form>\n");
      out.write("<hr>\n");
      out.write("\n");
      out.write("<form action=\"ans_write_ok.jsp\" method=\"post\">\n");
      out.write("\t<p>Name : <input type=\"text\" name=\"writer\" class=\"feedback-input\">\n");
      out.write("\tPassword : <input type=\"password\" name=\"pwd\" class=\"feedback-input\"></p>\n");
      out.write("\t<p>Comment : <textarea name=\"content\" rows=\"4\" cols=\"55\"></textarea>\n");
      out.write("\t<input type=\"submit\" value=\"Write Comment\">\n");
      out.write("\t<input type=\"hidden\" name=\"b_idx\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${bvo.b_idx }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("\t</p>\n");
      out.write("</form>\n");
      out.write("<hr>\n");
      out.write("Comments\n");
      out.write("<hr>\n");
      if (_jspx_meth_c_005fforEach_005f0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fif_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f0_reused = false;
    try {
      _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f0.setParent(null);
      // /view.jsp(140,3) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${empty bvo.file_name }", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
      if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("\t\t\t\t<p>첨부파일 없음</p>\n");
          out.write("\t\t\t");
          int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
      _jspx_th_c_005fif_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f0_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f1(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f1 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f1_reused = false;
    try {
      _jspx_th_c_005fif_005f1.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f1.setParent(null);
      // /view.jsp(143,3) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${not empty bvo.file_name }", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f1 = _jspx_th_c_005fif_005f1.doStartTag();
      if (_jspx_eval_c_005fif_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("\t\t\t\t<a href=\"download.jsp?name=");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${bvo.file_name }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
          out.write('"');
          out.write('>');
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${bvo.file_name }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
          out.write("</a>\n");
          out.write("\t\t\t");
          int evalDoAfterBody = _jspx_th_c_005fif_005f1.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f1);
      _jspx_th_c_005fif_005f1_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f1, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f1_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fforEach_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_005fforEach_005f0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    boolean _jspx_th_c_005fforEach_005f0_reused = false;
    try {
      _jspx_th_c_005fforEach_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fforEach_005f0.setParent(null);
      // /view.jsp(178,0) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fforEach_005f0.setVar("commVO");
      // /view.jsp(178,0) name = items type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
      _jspx_th_c_005fforEach_005f0.setItems(new org.apache.jasper.el.JspValueExpression("/view.jsp(178,0) '${c_list }'",_jsp_getExpressionFactory().createValueExpression(_jspx_page_context.getELContext(),"${c_list }",java.lang.Object.class)).getValue(_jspx_page_context.getELContext()));
      int[] _jspx_push_body_count_c_005fforEach_005f0 = new int[] { 0 };
      try {
        int _jspx_eval_c_005fforEach_005f0 = _jspx_th_c_005fforEach_005f0.doStartTag();
        if (_jspx_eval_c_005fforEach_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
          do {
            out.write("\n");
            out.write("<div class=\"comment\">\n");
            out.write("\t<form action=\"ans_del.jsp\" method=\"post\">\n");
            out.write("\t\t<p>Name : ");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${commVO.writer }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("&nbsp; Date : ");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${commVO.write_date }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("</p>\n");
            out.write("\t\t<p>Comment : ");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${commVO.content }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("</p>\n");
            out.write("\t\t<!-- 삭제요청시, 암호 -->\n");
            out.write("\t\t<input type=\"submit\" value=\"댓글삭제\">\n");
            out.write("\t\t<!-- 바람직한 방법은 아닙니다. c_idx + pwd -> 삭제용도 -->\n");
            out.write("\t\t<input type=\"hidden\" name=\"c_idx\" value=\"");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${commVO.c_idx }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("\">\n");
            out.write("\t\t<input type=\"hidden\" name=\"pwd\" value=\"");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${commVO.pwd }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("\">\n");
            out.write("\t\t");
            out.write("\n");
            out.write("\t\t<input type=\"hidden\" name=\"b_idx\" value=\"");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${commVO.b_idx }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("\">\n");
            out.write("\t</form>\n");
            out.write("</div>\n");
            int evalDoAfterBody = _jspx_th_c_005fforEach_005f0.doAfterBody();
            if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
              break;
          } while (true);
        }
        if (_jspx_th_c_005fforEach_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
          return true;
        }
      } catch (java.lang.Throwable _jspx_exception) {
        while (_jspx_push_body_count_c_005fforEach_005f0[0]-- > 0)
          out = _jspx_page_context.popBody();
        _jspx_th_c_005fforEach_005f0.doCatch(_jspx_exception);
      } finally {
        _jspx_th_c_005fforEach_005f0.doFinally();
      }
      _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.reuse(_jspx_th_c_005fforEach_005f0);
      _jspx_th_c_005fforEach_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fforEach_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fforEach_005f0_reused);
    }
    return false;
  }
}