# `WEB01`
-  `Web`项目
- 本地`Tomcat`服务器调试
- 外部服务器部署
- 项目问题与解决方案
1. 外部服务器部署：
   问题描述：
   本地Tomcat服务器调试正常，一旦部署到外部服务器就出错，原因是使用了META-INF/context.xml 配置数据库，在部署到t外部服务器后，就会寻找数据源，由于本人没有使用数据库连接池，因此没有数据源，因而出错
   解决方案：
   直接删除META-INF/context.xml 文件，同时删除/注解掉pom.xml 文件中的 jakarta.annotation,jakarta.servlet 依赖
2. 点击导航栏时，已经登录的用户名/密码被刷新了
   解决方案：
   点击导航栏时，在超链接的url中发送用户名何密码
   例如：
   ```HTML
    <a href="Professor?clientName=${user.clientName}&password=${user.password}"> <li>教授</li></a>
   将用户名和密码直接发送过去，注意不能传递封装好的实体类（User等），只能传递字符
4. 如何直接在jsp页面中从数据库获取数据并渲染到jsp页面中
   解决方案：首先在JSP中使用Java代码获取数据库数据，同时使用 request.setAttribute("") 向session 中传递请求消息 ，然后就可以使用JSTL 动态生成页面并渲染了
