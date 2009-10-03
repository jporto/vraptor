
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/header.jsp">
	<jsp:param name="extras" value='
		<link href="../includes/css/java.css" rel="stylesheet" type="text/css" media="screen" />
		<link href="../includes/css/xml2html.css" rel="stylesheet" type="text/css" media="screen" />
		<link href="../includes/css/style.css" rel="stylesheet" type="text/css" media="screen" />
	'/>
</jsp:include><div id="contentWrap">
    	<div id="contentDocumentacao">
        	<h2><span>documentação</span></h2>
            <h3>documentação toda em português, configuração, migração e utilização.</h3>
            
            <div id="subMenuDoc">
            	<img id="positionTop" src="../includes/images/subMenuTop-trans.png" />
                <img id="positionBottom" src="../includes/images/subMenuBottom-trans.png" />
            	<ol type="1">
									<li><a class="link_toc" href="../../documentation/vraptor3-one-minute-guide/">1. VRaptor3 - One minute guide</a></li>
		
									<li><a class="link_toc" href="../../documentation/vraptor3-ten-minutes-guide/">2. VRaptor3 - Ten minutes guide</a></li>
		
									<li><a class="link_toc" href="../../documentation/resources-rest/">3. Resources-Rest</a></li>
		
									<li><a class="link_toc" href="../../documentation/components/">4. Components</a></li>
		
									<li><a class="link_toc" href="../../documentation/converters/">5. Converters</a></li>
		
									<li><a class="link_toc" href="../../documentation/interceptors/">6. Interceptors</a></li>
		
									<li><a class="link_toc" href="../../documentation/validation/">7. Validation</a></li>
		
									<li><a class="link_toc" href="../../documentation/view-and-ajax/">8. View and Ajax</a></li>
		
									<li><a class="link_toc" href="../../documentation/dependency-injection/">9. Dependency injection</a></li>
		
									<li><a class="link_toc" href="../../documentation/downloading/">10. Downloading</a></li>
		
									<li><a class="link_toc" href="../../documentation/utility-components/">11. Utility Components</a></li>
		
									<li><a class="link_toc" href="../../documentation/advanced-configurations-overriding-vraptor-s-behavior-and-conventions/">12. Advanced configurations: overriding VRaptor's behavior and conventions</a></li>
		
									<li><a class="link_toc" href="../../documentation/testing-components-and-controllers/">13. Testing components and controllers</a></li>
		
									<li><a class="link_toc" href="../../documentation/changelog/">14. ChangeLog</a></li>
		
									<li><a class="link_toc" href="../../documentation/migrating-from-vraptor2-to-vraptor3/">15. Migrating from VRaptor2 to VRaptor3</a></li>
		
                </ol>
            </div><!-- submenu-->
                        
            <div id="textoCapitulo">
	
		<h2 class="chapter">Resources-Rest</h2>

		


<h3 class="section">What are Resources?</h3>
	    	<span class="paragraph">Resources are anything that can be accessed by our clients.</span>
	    	<span class="paragraph">In a VRaptor-based Web application, a resource must be annotated with <code class="inlineCode">@Resource</code>.
If you annotate a class with <code class="inlineCode">@Resource</code>, all its public methods become accessible
through GET requests to specific URIs.</span>
	    	<span class="paragraph">The following example shows a resource called <code class="inlineCode">ClienteController</code>, which provides
several operations over clients.</span>
	    	<span class="paragraph">Creating the class below with all its methods instantly make the URIs <strong class="definition">/client/add</strong>,
<strong class="definition">/client/list</strong>, <strong class="definition">/client/show</strong>, <strong class="definition">/client/remove</strong> and <strong class="definition">/client/update</strong>
available, each one invoking the respective method.</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">ClientController </span><span class="java8">{<br />
 <br />
&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">add</span><span class="java8">(</span><span class="java10">Client client</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp; </span><span class="java10">...<br />
&nbsp; </span><span class="java8">}<br />
&nbsp; <br />
&nbsp; </span><span class="java4">public </span><span class="java10">List&lt;Client&gt; list</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java10">...<br />
&nbsp; </span><span class="java8">}<br />
&nbsp; <br />
&nbsp; </span><span class="java4">public </span><span class="java10">Client show</span><span class="java8">(</span><span class="java10">Client profile</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java10">...<br />
&nbsp; </span><span class="java8">}<br />
 <br />
&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">remove</span><span class="java8">(</span><span class="java10">Client client</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp; </span><span class="java10">...<br />
&nbsp; </span><span class="java8">}<br />
<br />
&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">update</span><span class="java8">(</span><span class="java10">Client client</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp; </span><span class="java10">...<br />
&nbsp; </span><span class="java8">}<br />
&nbsp; <br />
}</span></code></div>
		

<h3 class="section">Parâmetros dos métodos</h3>
	    	<span class="paragraph">You can receive parameters on your controller methods, and if those parameters
follow the java beans convention (getters and setters for class fields), 
you can use dots for browsing through the fields. For instance, on method:</span>
	    	<div class="java"><code class="java">
<span class="java4">public </span><span class="java9">void </span><span class="java10">update</span><span class="java8">(</span><span class="java10">Client client</span><span class="java8">) {<br />
&nbsp;&nbsp; </span><span class="java3">//...<br />
</span><span class="java8">}</span></code></div>
	    	<span class="paragraph">you can receive on the request parameters:</span>
	    	<div class="java"><code class="java">client.id=<span class="texvalue">3<br /></span>
client.name=John&nbsp;<span class="texvalue">Doe<br /></span>
client.user.login=<span class="texvalue">johndoe</span></code></div>
	    	<span class="paragraph">and the respective fields will be set, browsing through getters and setters starting
from client.</span>
	    	<span class="paragraph">If an object field or a method parameter is a list (List&lt;&gt; or array), you can receive
several request parameters, using square brackets and indexes:</span>
	    	<div class="java"><code class="java">client.phones[0]=+55&nbsp;<span class="texvalue">11&nbsp;5571-2751&nbsp;<span class="texcomment">#if&nbsp;it&nbsp;is&nbsp;a&nbsp;string&nbsp;list<br /></span></span>
client.relatives[0].id=1&nbsp;<span class="texvalue"><span class="texcomment">#if&nbsp;it&nbsp;is&nbsp;an&nbsp;arbitrary&nbsp;object,&nbsp;you&nbsp;can&nbsp;continue&nbsp;to&nbsp;browse<br /></span></span>
client.relatives[3].id=1&nbsp;<span class="texvalue"><span class="texcomment">#indexes&nbsp;don't&nbsp;need&nbsp;to&nbsp;be&nbsp;sequential<br /></span></span>
client.relatives[0].name=Mary&nbsp;<span class="texvalue">Doe&nbsp;<span class="texcomment">#using&nbsp;the&nbsp;same&nbsp;index,&nbsp;it&nbsp;will&nbsp;be&nbsp;set&nbsp;on&nbsp;same&nbsp;object<br /></span></span>
clients[1].id=23&nbsp;<span class="texvalue"><span class="texcomment">#it&nbsp;works&nbsp;if&nbsp;you&nbsp;receive&nbsp;a&nbsp;client&nbsp;list&nbsp;as&nbsp;method&nbsp;parameter</span></span></code></div>
	    	<div class="box"><h3>Reflection on parameter names</h3>
<span class="paragraph">Unfortunately Java can't reflect parameters names, these data don't stay in bytecode
(unless you compile your code in debug mode, but that is optional). It causes that most
frameworks that need this kind of information end up creating annotations, which makes
a very ugly code (like JAX-WS, where its very common to find methods with signature like:
<code class="inlineCode">void add(@WebParam(name="client") Client client)</code>).</span><span class="paragraph">VRaptor uses the Paranamer framework (<a class="link" target="_blank" href="http://paranamer.codehaus.org">http://paranamer.codehaus.org</a>), which can get parameter
names information through pre compilation or debug data, avoiding the creation of annotations
for this purpose. Some VRaptor developers also participate in Paranamer development.</span></div>
		

<h3 class="section">Scopes</h3>
	    	<span class="paragraph">Sometimes you want to share a component among all users, or through all requests from
the same user or one instance for each user request.</span>
	    	<span class="paragraph">To specify in which scope your component will live, use the annotations
<code class="inlineCode">@ApplicationScoped</code>, <code class="inlineCode">@SessionScoped</code> and <code class="inlineCode">@RequestScoped</code>.</span>
	    	<span class="paragraph">If you don't specify a scope for your component, VRaptor assumes the request scope,
meaning a fresh instance will be created for each request.</span>
		

<h3 class="section">Http Methods</h3>
	    	<span class="paragraph">The best practice when using HTTP Methods is to specify a different URI for each method,
like GET, POST, PUT etc.</span>
	    	<span class="paragraph">In order to accomplish that, we use annotations <code class="inlineCode">@Get</code>, <code class="inlineCode">@Post</code>, <code class="inlineCode">@Delete</code> etc,
in conjunction with the <code class="inlineCode">@Path</code> annotation, which allows us to configure a custom URI.</span>
	    	<span class="paragraph">The following example changes the default URIs for <code class="inlineCode">ClienteController</code>.
Now we specify two different URIs for different HTTP methods:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">ClientController </span><span class="java8">{<br />
<br />
&nbsp; </span><span class="java16">@Path</span><span class="java8">(</span><span class="java5">&#34;/client&#34;</span><span class="java8">)<br />
&nbsp; </span><span class="java16">@Post<br />
&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">add</span><span class="java8">(</span><span class="java10">Client client</span><span class="java8">) {<br />
&nbsp; }<br />
&nbsp; <br />
&nbsp; </span><span class="java16">@Path</span><span class="java8">(</span><span class="java5">&#34;/&#34;</span><span class="java8">)<br />
&nbsp; </span><span class="java4">public </span><span class="java10">List&lt;Client&gt; list</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java10">...<br />
&nbsp; </span><span class="java8">}<br />
<br />
&nbsp; </span><span class="java16">@Get<br />
&nbsp; @Path</span><span class="java8">(</span><span class="java5">&#34;/client&#34;</span><span class="java8">)<br />
&nbsp; </span><span class="java4">public </span><span class="java10">Client show</span><span class="java8">(</span><span class="java10">Client client</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java10">...<br />
&nbsp; </span><span class="java8">}<br />
 <br />
&nbsp; </span><span class="java16">@Delete<br />
&nbsp; @Path</span><span class="java8">(</span><span class="java5">&#34;/client&#34;</span><span class="java8">)<br />
&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">remove</span><span class="java8">(</span><span class="java10">Client client</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp; </span><span class="java10">...<br />
&nbsp; </span><span class="java8">}<br />
&nbsp; <br />
&nbsp; </span><span class="java16">@Put<br />
&nbsp; @Path</span><span class="java8">(</span><span class="java5">&#34;/client&#34;</span><span class="java8">)<br />
&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">update</span><span class="java8">(</span><span class="java10">Client client</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp; </span><span class="java10">...<br />
&nbsp; </span><span class="java8">}<br />
&nbsp; <br />
}</span></code></div>
	    	<span class="paragraph">As you can see, we used HTTP methods + a specific URI to identify each method
in our Java class.</span>
	    	<span class="paragraph">We must be <strong class="definition">very careful</strong> when creating hyperlinks and HTML forms, because web browsers
currently support only <em class="italic">POST</em> and <em class="italic">GET</em> methods.</span>
	    	<span class="paragraph">For that reason, requests for methods <em class="italic">DELETE</em>, <em class="italic">PUT</em> etc should be created
through JavaScript, or by adding an extra parameter called <strong class="definition">_method</strong>.</span>
	    	<span class="paragraph">This parameter will overwrite the real HTTP method being invoked.</span>
	    	<span class="paragraph">The following example creates a link to show one client's data:</span>
	    	<div class="xml"><code class="xml"><span class="textag">&lt;a</span>&nbsp;<span class="texattrib">href=</span><span class="texvalue">"/client?client.id=5"</span><span class="textag">&gt;</span><span class="texnormal">show&nbsp;client&nbsp;5</span><span class="textag">&lt;/a&gt;</span></code></div>
	    	<span class="paragraph">Now an example on how to invoke the method to add a client:</span>
	    	<div class="xml"><code class="xml"><span class="textag">&lt;form</span>&nbsp;<span class="texattrib">action=</span><span class="texvalue">"/client"</span>&nbsp;<span class="texattrib">method=</span><span class="texvalue">"post"</span><span class="textag">&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;input</span>&nbsp;<span class="texattrib">name=</span><span class="texvalue">"client.name"</span>&nbsp;<span class="textag">/&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;input</span>&nbsp;<span class="texattrib">type=</span><span class="texvalue">"submit"</span>&nbsp;<span class="textag">/&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal"></span><span class="textag">&lt;/form&gt;</span></code></div>
	    	<span class="paragraph">Notice that if we want to remove a cliente using the <em class="italic">DELETE</em> HTTP method, we have
to use the <code class="inlineCode">_method</code> parameter, since browsers still don't support that kind
of requests:</span>
	    	<div class="xml"><code class="xml"><span class="textag">&lt;form</span>&nbsp;<span class="texattrib">action=</span><span class="texvalue">"/client"</span>&nbsp;<span class="texattrib">method=</span><span class="texvalue">"post"</span><span class="textag">&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;input</span>&nbsp;<span class="texattrib">name=</span><span class="texvalue">"_method"</span>&nbsp;<span class="texattrib">value=</span><span class="texvalue">"DELETE"</span>&nbsp;<span class="texattrib">type=</span><span class="texvalue">"hidden"</span>&nbsp;<span class="textag">/&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;input</span>&nbsp;<span class="texattrib">name=</span><span class="texvalue">"client.id"</span>&nbsp;<span class="texattrib">value=</span><span class="texvalue">"5"</span>&nbsp;<span class="texattrib">type=</span><span class="texvalue">"hidden"</span>&nbsp;<span class="textag">/&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;input</span>&nbsp;<span class="texattrib">type=</span><span class="texvalue">"remove&nbsp;client&nbsp;5"</span>&nbsp;<span class="textag">/&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal"></span><span class="textag">&lt;/form&gt;</span></code></div>
		

<h3 class="section">@Path</h3>
	    	<span class="paragraph">The <code class="inlineCode">@Path</code> annotation allows you to specify custom access URIs to your controller methods.
The basic usage of the annotation is to specify a fixed URI. The following example shows
how to customize the access URI for a method that accepts <em class="italic">POST</em> requests only. The URI
we want to specify is <strong class="definition">/client</strong>:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">ClientController </span><span class="java8">{<br />
<br />
&nbsp; </span><span class="java16">@Path</span><span class="java8">(</span><span class="java5">&#34;/client&#34;</span><span class="java8">)<br />
&nbsp; </span><span class="java16">@Post <br />
&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">add</span><span class="java8">(</span><span class="java10">Client client</span><span class="java8">) {<br />
&nbsp; }<br />
&nbsp;&nbsp;&nbsp; <br />
}</span></code></div>
	    	<span class="paragraph"><strong class="title">Path with variable injection</strong>
Sometimes we want the <em class="italic">uri</em> to include, for example, the unique identifier of
my resource.</span>
	    	<span class="paragraph">Suppose a client controller application where the client's unique identifier (primary key)
is a number. We can map our URIs as <em class="italic">/client/{client.id}</em>, so we can visualize each client.</span>
	    	<span class="paragraph">That is, if we access the URI <em class="italic">/client/2</em>, the <strong class="definition">show</strong> method will be invoked
and the <em class="italic">client.id</em> parameter will be set to <strong class="definition">2</strong>. If the URI <em class="italic">/client/1717</em> is
accessed, the same method will be invoked with the <strong class="definition">1717</strong> value.</span>
	    	<span class="paragraph">That way we can create unique URIs to identify different resources in our application.
See the mentioned example:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">ClientController </span><span class="java8">{<br />
<br />
&nbsp; </span><span class="java16">@Get<br />
&nbsp; @Path</span><span class="java8">(</span><span class="java5">&#34;/client/{client.id}&#34;</span><span class="java8">)&nbsp; <br />
&nbsp; </span><span class="java4">public </span><span class="java10">Cliente show</span><span class="java8">(</span><span class="java10">Client client</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java10">...<br />
&nbsp; </span><span class="java8">}<br />
&nbsp; <br />
}</span></code></div>
	    	<span class="paragraph">You can go further and set several parameters through the URI:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">ClientController </span><span class="java8">{<br />
<br />
&nbsp; </span><span class="java16">@Get<br />
&nbsp; @Path</span><span class="java8">(</span><span class="java5">&#34;/client/{client.id}/show/{section}&#34;</span><span class="java8">)&nbsp; <br />
&nbsp; </span><span class="java4">public </span><span class="java10">Client show</span><span class="java8">(</span><span class="java10">Client client, String section</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java10">...<br />
&nbsp; </span><span class="java8">}<br />
&nbsp; <br />
}</span></code></div>
	    	<span class="paragraph"><strong class="title">Paths with wildcards</strong></span>
	    	<span class="paragraph">You can also use the * wildcard as a selection method for your URI. The following
example ignores anything that comes after the word <em class="italic">photo/</em> :</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">ClientController </span><span class="java8">{<br />
<br />
&nbsp; </span><span class="java16">@Get<br />
&nbsp; @Path</span><span class="java8">(</span><span class="java5">&#34;/client/{client.id}/photo/*&#34;</span><span class="java8">)&nbsp; <br />
&nbsp; </span><span class="java4">public </span><span class="java10">File photo</span><span class="java8">(</span><span class="java10">Client client</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java10">...<br />
&nbsp; </span><span class="java8">}<br />
&nbsp; <br />
}</span></code></div>
	    	<span class="paragraph">And now a similar code, but used to download a specific photo from a client:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">ClientController </span><span class="java8">{<br />
<br />
&nbsp; </span><span class="java16">@Get<br />
&nbsp; @Path</span><span class="java8">(</span><span class="java5">&#34;/client/{client.id}/photo/{photo.id}&#34;</span><span class="java8">)&nbsp; <br />
&nbsp; </span><span class="java4">public </span><span class="java10">File photo</span><span class="java8">(</span><span class="java10">Client client, Photo photo</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java10">...<br />
&nbsp; </span><span class="java8">}<br />
&nbsp; <br />
}</span></code></div>
	    	<span class="paragraph">Sometimes you want the parameter to include the <strong class="definition">/</strong> character. In that case,
you should use the pattern {...*}:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">ClientController </span><span class="java8">{<br />
<br />
&nbsp; </span><span class="java16">@Get<br />
&nbsp; @Path</span><span class="java8">(</span><span class="java5">&#34;/client/{client.id}/download/{path*}&#34;</span><span class="java8">)&nbsp; <br />
&nbsp; </span><span class="java4">public </span><span class="java10">File download</span><span class="java8">(</span><span class="java10">Client client, String path</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java10">...<br />
&nbsp; </span><span class="java8">}<br />
&nbsp; <br />
}</span></code></div>
	    	<span class="paragraph"><strong class="title">Specifying priorities for your paths</strong></span>
	    	<span class="paragraph">It is possible for some URIs to be handled by more than one method in our class:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">PostController </span><span class="java8">{<br />
<br />
&nbsp; </span><span class="java16">@Get<br />
&nbsp; @Path</span><span class="java8">(</span><span class="java5">&#34;/post/{post.author}&#34;</span><span class="java8">)<br />
&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">show</span><span class="java8">(</span><span class="java10">Post post</span><span class="java8">) { </span><span class="java10">... </span><span class="java8">}<br />
<br />
&nbsp; </span><span class="java16">@Get<br />
&nbsp; @Path</span><span class="java8">(</span><span class="java5">&#34;/post/current&#34;</span><span class="java8">)<br />
&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">current</span><span class="java8">() { </span><span class="java10">... </span><span class="java8">}<br />
}</span></code></div>
	    	<span class="paragraph">The URI <code class="inlineCode">/post/current</code> can be handled by both <code class="inlineCode">show</code> and <code class="inlineCode">current</code> methods.
But I don't want to invoke the <code class="inlineCode">show</code> method with that URI, 
what I want is VRaptor to test the <code class="inlineCode">current</code>
path first, avoiding the invocation of the <code class="inlineCode">show</code> method.</span>
	    	<span class="paragraph">In order to do that, we can define priorities for <code class="inlineCode">@Path</code>s, so VRaptor will first
test paths with higher priority, in other words, paths with lower priority values.</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">PostController </span><span class="java8">{<br />
<br />
&nbsp; </span><span class="java16">@Get<br />
&nbsp; @Path</span><span class="java8">(</span><span class="java10">priority = </span><span class="java7">2</span><span class="java10">, value = </span><span class="java5">&#34;/post/{post.author}&#34;</span><span class="java8">)<br />
&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">show</span><span class="java8">(</span><span class="java10">Post post</span><span class="java8">) { </span><span class="java10">... </span><span class="java8">}<br />
<br />
&nbsp; </span><span class="java16">@Get<br />
&nbsp; @Path</span><span class="java8">(</span><span class="java10">priority = </span><span class="java7">1</span><span class="java10">, value = </span><span class="java5">&#34;/post/current&#34;</span><span class="java8">)<br />
&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">current</span><span class="java8">() { </span><span class="java10">... </span><span class="java8">}<br />
}</span></code></div>
	    	<span class="paragraph">This way, the "/post/current" path will be tested before "/post/{post.author}" by VRaptor,
solving our problem.</span>
		

<h3 class="section">RoutesConfiguration</h3>
	    	<span class="paragraph">Finally, the most advanced way to configure access routes for your resources is
using a <strong class="definition">RoutesConfiguration</strong>.</span>
	    	<span class="paragraph">This component must be configured as application scoped and must implement the
<em class="italic">config</em> method:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Component<br />
@ApplicationScoped<br />
</span><span class="java4">public class </span><span class="java10">CustomRoutes </span><span class="java4">implements </span><span class="java10">RoutesConfiguration </span><span class="java8">{<br />
<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">config</span><span class="java8">(</span><span class="java10">Router router</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp; }<br />
<br />
}</span></code></div>
	    	<span class="paragraph">Having access to a <strong class="definition">Router</strong>, you can define access routes to methods. And the best
part is that the configuration is refactor-friendly, that is, if you change a method's name,
the configuration reflects the change, but the <em class="italic">uri</em> stays the same:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Component<br />
@ApplicationScoped<br />
</span><span class="java4">public class </span><span class="java10">CustomRoutes </span><span class="java4">implements </span><span class="java10">RoutesConfiguration </span><span class="java8">{<br />
<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">config</span><span class="java8">(</span><span class="java10">Router router</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">new </span><span class="java10">Rules</span><span class="java8">(</span><span class="java10">router</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">routes</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java10">routeFor</span><span class="java8">(</span><span class="java5">&#34;/&#34;</span><span class="java8">)</span><span class="java10">.is</span><span class="java8">(</span><span class="java10">ClientController.</span><span class="java4">class</span><span class="java8">)</span><span class="java10">.list</span><span class="java8">()</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; routeFor</span><span class="java8">(</span><span class="java5">&#34;/client/random&#34;</span><span class="java8">)</span><span class="java10">.is</span><span class="java8">(</span><span class="java10">ClientController.</span><span class="java4">class</span><span class="java8">)</span><span class="java10">.random</span><span class="java8">()</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
<br />
}</span></code></div>
	    	<span class="paragraph">You can also put parameters on the uri and they will be set directly on the method
parameters. You can also add restrictions to these parameters:</span>
	    	<div class="java"><code class="java">
<span class="java3">// show method receives a Client that has an id<br />
</span><span class="java10">routeFor</span><span class="java8">(</span><span class="java5">&#34;/client/{client.id}&#34;</span><span class="java8">)</span><span class="java10">.is</span><span class="java8">(</span><span class="java10">ClientController.</span><span class="java4">class</span><span class="java8">)</span><span class="java10">.show</span><span class="java8">(</span><span class="java4">null</span><span class="java8">)</span><span class="java10">;<br />
</span><span class="java3">// If I want to ensure that the parameter is a number:<br />
</span><span class="java10">routeFor</span><span class="java8">(</span><span class="java5">&#34;/client/{client.id}&#34;</span><span class="java8">)</span><span class="java10">.withParameter</span><span class="java8">(</span><span class="java5">&#34;client.id&#34;</span><span class="java8">)</span><span class="java10">.matching</span><span class="java8">(</span><span class="java5">&#34;\\d+&#34;</span><span class="java8">)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java10">.is</span><span class="java8">(</span><span class="java10">ClientController.</span><span class="java4">class</span><span class="java8">)</span><span class="java10">.show</span><span class="java8">(</span><span class="java4">null</span><span class="java8">)</span><span class="java10">;</span></code></div>
	    	<span class="paragraph">At last, you can choose the class and the method names in runtime, allowing us to
create extremely generic routes:</span>
	    	<div class="java"><code class="java">
<span class="java10">routeFor</span><span class="java8">(</span><span class="java5">&#34;/{webResource}/doSomething/{webMethod}&#34;</span><span class="java8">)</span><span class="java10">.is</span><span class="java8">(<br />
&nbsp;&nbsp;&nbsp; </span><span class="java10">type</span><span class="java8">(</span><span class="java5">&#34;br.com.caelum.projectname.{webResource}&#34;</span><span class="java8">)</span><span class="java10">, <br />
&nbsp;&nbsp;&nbsp; method</span><span class="java8">(</span><span class="java5">&#34;{webMethod}&#34;</span><span class="java8">))</span><span class="java10">;</span></code></div>
		

</div><!-- content -->
            
        </div><!-- content cnt -->
    </div><!-- content wrap-->
    
<%@include file="/footer.jsp" %>