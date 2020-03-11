package com.nwnu.common.utils;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class NavigationTag extends TagSupport {

	
	static final long serialVersionUID = 2372405317744358833L;

    /**
     * request �����ڱ���Page<E> ����ı�����,Ĭ��Ϊ��page��
     */
    private String bean = "page";

    /**
     * ��ҳ��ת��url��ַ,�����Ա���
     */
    private String url = null;

    /**
     * ��ʾҳ������
     */
    private int number = 5;

    @Override
    public int doStartTag() throws JspException {
        JspWriter writer = pageContext.getOut();
        HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
        Page page = (Page) request.getAttribute(bean);
        if (page == null)
            return SKIP_BODY;
        url = resolveUrl(url, pageContext);
        try {
            // ������ҳ��
            int pageCount = page.getTotal() / page.getSize();
            if (page.getTotal() % page.getSize() > 0) {
                pageCount++;
            }
            writer.print("<nav><ul class=\"pagination\">");
            // ��ʾ����һҳ����ť
            if (page.getPage() > 1) {
                String preUrl = append(url, "page", page.getPage() - 1);
                preUrl = append(preUrl, "rows", page.getSize());
                writer.print("<li><a href=\"" + preUrl + "\">��һҳ</a></li>");
            } else {
                writer.print("<li class=\"disabled\"><a href=\"#\">��һҳ</a></li>");
            }
            // ��ʾ��ǰҳ���ǰ2ҳ��ͺ���ҳ��
            // ��1 �� 1 2 3 4 5, ��2 �� 1 2 3 4 5, ��3 ��1 2 3 4 5,
            // ��4 �� 2 3 4 5 6 ,��10 �� 8 9 10 11 12
            int indexPage = (page.getPage() - 2 > 0) ? page.getPage() - 2 : 1;
            for (int i = 1; i <= number && indexPage <= pageCount; indexPage++, i++) {
                if (indexPage == page.getPage()) {
                    writer.print("<li class=\"active\"><a href=\"#\">" + indexPage
                            + "<span class=\"sr-only\">(current)</span></a></li>");
                    continue;
                }
                String pageUrl = append(url, "page", indexPage);
                pageUrl = append(pageUrl, "rows", page.getSize());
                writer.print("<li><a href=\"" + pageUrl + "\">" + indexPage + "</a></li>");
            }
            // ��ʾ����һҳ����ť
            if (page.getPage() < pageCount) {
                String nextUrl = append(url, "page", page.getPage() + 1);
                nextUrl = append(nextUrl, "rows", page.getSize());
                writer.print("<li><a href=\"" + nextUrl + "\">��һҳ</a></li>");
            } else {
                writer.print("<li class=\"disabled\"><a href=\"#\">��һҳ</a></li>");
            }
            writer.print("</nav>");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return SKIP_BODY;
    }

    private String append(String url, String key, int value) {
        return append(url, key, String.valueOf(value));
    }

    /**
     * Ϊurl �μӲ����Զ�
     */
    private String append(String url, String key, String value) {
        if (url == null || url.trim().length() == 0) {
            return "";
        }
        if (url.indexOf("?") == -1) {
            url = url + "?" + key + "=" + value;
        } else {
            if (url.endsWith("?")) {
                url = url + key + "=" + value;
            } else {
                url = url + "&amp;" + key + "=" + value;
            }
        }
        return url;
    }

    /**
     * Ϊurl ��ӷ�ҳ�������
     */
    private String resolveUrl(String url, javax.servlet.jsp.PageContext pageContext) throws JspException {
        Map params = pageContext.getRequest().getParameterMap();
        for (Object key : params.keySet()) {
            if ("page".equals(key) || "rows".equals(key))
                continue;
            Object value = params.get(key);
            if (value == null)
                continue;
            if (value.getClass().isArray()) {
                url = append(url, key.toString(), ((String[]) value)[0]);
            } else if (value instanceof String) {
                url = append(url, key.toString(), value.toString());
            }
        }
        return url;
    }

    public String getBean() {
        return bean;
    }

    public void setBean(String bean) {
        this.bean = bean;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void setNumber(int number) {
        this.number = number;
    }

}

