<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="description=" content="The Anchor-otr brings a classic seafood experience to land locked Cincinnatians. From Maine sea scallops to grilled whole fish
              to fresh oysters flown in from the west and east coast,  chef/owner Derek dos Anjos's team serves high quality and sustainable seafood
              from the countries best suppliers.  Beach food classics such as  hush puppies and lobster rolls will transport you to your favorite spot along
              the coast. With a wine list chosen to compliment seafood, craft cocktails and a warm sense of hospitality, The Anchor-otr brings laid back
              extravagance to Washington Park in Over the Rhine.  The dining rooms custom charred wood walls, communal table seating and nautical lighting
              encourage a playful experience.">
        <title> The Anchor-OTR | ${page} </title>
    </head>
    <body>
        <h1> ${page} </h1>
    <c:if test="${page=='location'}">
        <div style='width:425px;margin:0 auto;' class="visible-phone visible-tablet hidden-desktop">
            <iframe width="425" height="350" 
                    frameborder="0" 
                    scrolling="no" 
                    marginheight="0" 
                    marginwidth="0" 
                    src="https://www.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Anchor+OTR,+1401+Race+Street,+Cincinnati,+OH+45202,+USA&amp;aq=0&amp;oq=Anchor+o&amp;sll=39.13634,-84.540401&amp;sspn=0.36802,0.724411&amp;ie=UTF8&amp;hq=Anchor&amp;hnear=1401+Race+St,+Cincinnati,+Hamilton,+Ohio+45202&amp;t=m&amp;fll=39.110566,-84.517211&amp;fspn=0.001438,0.00283&amp;st=110616160731137639226&amp;rq=1&amp;ev=zi&amp;split=1&amp;ll=39.110358,-84.51705&amp;spn=0.002914,0.00456&amp;z=17&amp;iwloc=A&amp;output=embed"
                    >

            </iframe>
            <br />
            <small>
                <a href="https://www.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Anchor+OTR,+1401+Race+Street,+Cincinnati,+OH+45202,+USA&amp;aq=0&amp;oq=Anchor+o&amp;sll=39.13634,-84.540401&amp;sspn=0.36802,0.724411&amp;ie=UTF8&amp;hq=Anchor&amp;hnear=1401+Race+St,+Cincinnati,+Hamilton,+Ohio+45202&amp;t=m&amp;fll=39.110566,-84.517211&amp;fspn=0.001438,0.00283&amp;st=110616160731137639226&amp;rq=1&amp;ev=zi&amp;split=1&amp;ll=39.110358,-84.51705&amp;spn=0.002914,0.00456&amp;z=17&amp;iwloc=A" style="color:#0000FF;text-align:left">
                    View Larger Map
                </a>
            </small>
        </div>
    </c:if>
    <c:if test="${page=='about'}">
        <p>
                The Anchor-otr brings a classic seafood experience to land locked Cincinnatians. From Maine sea scallops to grilled whole fish
                to fresh oysters flown in from the west and east coast,  chef/owner Derek dos Anjos's team serves high quality and sustainable seafood
                from the countries best suppliers.  Beach food classics such as  hush puppies and lobster rolls will transport you to your favorite spot along
                the coast. With a wine list chosen to compliment seafood, craft cocktails and a warm sense of hospitality, The Anchor-otr brings laid back
                extravagance to Washington Park in Over the Rhine.  The dining rooms custom charred wood walls, communal table seating and nautical lighting
                encourage a playful experience.		
            </p>
    </c:if>
    
</body>
</html>
