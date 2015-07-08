
<%@ page import="java.util.*, com.zoomlane.homes.dao.*" %>
<%@ include file="/template/includes.jsp" %>

<bean:define id="loadBaseJs" value="true" />
<bean:define id="loadSearchFormJs" value="true" />
<bean:define id="loadFlashJs" value="true" />
<bean:define id="loadJqueryAutocomplete" value="true" />
<bean:define id="loadFacebookJs" value="false" />

<bean:define id="pageMetaDescription"><bean:write name="site" property="seoName" /> Homes for Sale, <bean:write name="site" property="seoName" /> Real Estate.  Search for Houses, Condos, Condominiums, Multi Families and Townhouses for sale in <logic:iterate name="regions" id="region" indexId="counter"><c:if test="${counter > 0}">, </c:if><bean:write name="region" property="region" /></logic:iterate></bean:define>
<bean:define id="pageKeywords">homes for sale in <bean:write name="site" property="seoName" />, <bean:write name="site" property="seoName" /> real estate, <bean:write name="site" property="seoName" /> foreclosures, <bean:write name="site" property="stateShort" /> homes for sale, <bean:write name="site" property="stateShort" /> foreclosures, <bean:write name="site" property="stateShort" /> real estate, for sale, condos, homes, home, property, <bean:write name="site" property="seoName" /> homes, multi family<logic:iterate name="regions" id="region">, <bean:write name="region" property="region" /></logic:iterate></bean:define>

<bean:define id="firstNav" value="homes" />
<bean:define id="secondNav" value="region" />
<%@ include file="/template/header.jsp" %>

<div class="layout1">

    <div class="left_col">        

        <h1>Homes for Sale in <bean:write name="site" property="seoName" /></h1>

		<div style="margin-top: -10px;"><%@ include file="/ads/home_horizontal_links2.jsp" %><br /></div>
		
		<h2>Search Homes By Region</h2>
		
        <table width="100%">
            <tr>
            	
                <td valign="top" style="vertical-align: top;">
                    <ul class="map_list">
                    <logic:iterate name="regions" id="region" indexId="counter">
                        <zl:replaceEntity name="region">                        
                        	<li><a href="${region.regionUrl}" title="${region.region}, ${region.stateShort} Real Estate" id="region_${region.flashName}" onmouseover="highlight('${region.flashName}', '${region.region}')" onmouseout="lowlight()">${region.region}</a></li>                            
                        </zl:replaceEntity>
                    </logic:iterate>
                    </ul>
                    <br />
                    <p style="font-size:.8em;">Have specific towns, sizes, or other criteria in mind? Try our <a href="homes-for-sale">Advanced Search.</a></p>
                </td>
                <td style="width: 520px;" valign="top">
                   <%@ include file="/towns/inc_main_map.jsp" %>
                </td>
                
            </tr>
        </table> 

        <div style="padding: 5px 0"><%@ include file="/ads/home_banner.jsp" %></div>

        <logic:notEmpty name="site" property="recentArticles">
			<h2>Recent Real Estate Articles</h2>
            <div style="padding-bottom: 5px"><%@ include file="/ads/home_horizontal_links.jsp" %></div>
			<div class="wide_table" style="padding-bottom: 5px">
				<p>In addition to home listings, we offer a library of article and guides written by our experts. Here are some of our most recent articles:</p>
				<table style="border-bottom: 1px dotted #2C76AD; margin-bottom: 5px;">
					<colgroup>
						<col width="10%"></col>
						<col width="90%"></col>
					</colgroup>
					<logic:iterate name="site" property="recentArticles" id="article" length="3" indexId="rowCount">
						<c:if test="${rowCount % 2 != 0}"><tr class="odd"></c:if>
		        		<c:if test="${rowCount % 2 == 0}"><tr></c:if>
							<%@ include file="/section/inc_article_highlight.jsp" %>
						</tr>
		    		</logic:iterate>
				</table>
				
				<div style="padding-right: 10px;"><a href="content" title="More <bean:write name="site" property="state" /> Real Estate Articles" class="more">More Articles</a></div>
			</div>
			<br clear="all" />

			<%@ include file="/ads/home_banner2.jsp" %>
		</logic:notEmpty>
        
        <br clear="all" />
        <logic:iterate name="regions" id="region" indexId="counter">
            <logic:notEmpty name="region" property="recentListings">
                <h2>New Homes for Sale in <bean:write name="site" property="seoName" /> - <bean:write name="region" property="region" /></h2>
                <logic:iterate name="region" property="recentListings" id="listing" length="4" indexId="index">
                    <bean:define name="listing" property="town" id="town"/>
                    <%@ include file="/listings/inc_listing_highlight.jsp" %>
                    <zl:replaceEntity name="town">
                        <div class="viewMore"><a href="${town.url}">${town.town}, ${town.stateShort} Real Estate</a></div>
                    </zl:replaceEntity>
                    <br clear="all" />
                </logic:iterate>
                <zl:replaceEntity name="region">
                    <div class="viewMore"><a href="${region.regionUrl}" title="${region.region}, ${region.stateShort} Real Estate">more ${region.region}, ${region.stateShort} Real Estate</a></div>
                </zl:replaceEntity>
                <br clear="all" />
                <br />
            </logic:notEmpty>
                   
        </logic:iterate>
    </div>
    <div class="right_col">

			<%--
       			<c:if test="${site.code != 'socal'}">
	       			<zl:replaceEntity name="site">
		                <div class="box" style="margin-top: 15px; padding-top: 20px; background: #aad8fb;">
		                	<h3 style="display:inline;border:none;padding: 5px 0 0 0; margin-left: 10px;">About Us</h3>
		                	<div style="float: right; margin-top: -10px; margin-right: 10px;">
								<logic:notEmpty name="site" property="facebookUrl">
									<a href="${site.facebookUrl}" title="${site.siteName} Facebook"><img src="images/icon/facebook.png" /></a>
								</logic:notEmpty>
								<logic:notEmpty name="site" property="twitterUrl">
									<a href="${site.twitterUrl}" title="${site.siteName} Twitter"><img src="images/icon/twitter.png" /></a>
								</logic:notEmpty>
								<logic:notEmpty name="site" property="googlePlusUrl">
									<a href="${site.googlePlusUrl}" title="${site.siteName} Google Plus"><img src="images/icon/google-plus.png" /></a>
								</logic:notEmpty>
								<logic:notEmpty name="site" property="youtubeUrl">				
									<a href="${site.youtubeUrl}" title="${site.siteName} Youtube"><img src="images/icon/youtube.png" /></a>
								</logic:notEmpty>
							</div>
		                	<div class="content" style="border-top:#2c76ad solid 2px; width: 190px; padding: 10px 10px 0 10px; margin-top: 5px;">
		                		<p>${site.siteName} is a full service brokerage firm serving all of ${site.seoName}. We pride ourselves in having the best real
								estate agents in the state who value honesty and integrity above closing a sale. Buying a home is one of the biggest decisions of
								your life so we work hard to provide with the best information and advice as possible.</p>
								<a href="about-us" class="more">Read more about us</a>
		                	</div>
		                </div>
		            </zl:replaceEntity>
	            </c:if>
                --%>

                <%@ include file="/ads/home_side_square.jsp" %><br /><br />

				<div class="box">
				
						<c:choose>
						<c:when test="${site.code == 'ma'}">
						<h3>Take Our User Survey</h3></br>
						<div class="savedListingStatus" >
							<p style="text-align: center">
							Provide your feedback for a chance to <strong>win a $50 gift certificate from 
							Amazon.com.</strong>
							</p>
							<div class="cta_button" style="text-align: center; width: 100px;margin-left: 45px">
								<a title="Create a free account" href="http://fluidsurveys.com/surveys/citystream/siteusers/?collector=56822" target="_blank">Start 
								Survey</a>
							</div>
						</div>
						</c:when>
						<c:when test="${site.code == 'texas'}">
						<h3>Take Our User Survey</h3></br>
						<div class="savedListingStatus" >
							<p style="text-align: center">
							Provide your feedback for a chance to <strong>win a $50 gift certificate from 
							Amazon.com.</strong>
							</p>
							<div class="cta_button" style="text-align: center; width: 100px;margin-left: 45px">
								<a title="Create a free account" href="http://fluidsurveys.com/surveys/citystream/siteusers/?collector=56824" target="_blank">Start 
								Survey</a>
							</div>
						</div>
					
					</c:when>
					</c:choose>
				</div>

                <logic:equal name="site" property="showTransit" value="1">
                    <zl:replaceEntity name="site">
                    
                    <div class="box">
                    <h3>Search by <bean:write name="site" property="transitName" /></h3>
						<div class="content">
		                    <div style="text-align: center; padding: 0; margin: 0 0 10px; border:1px solid #c0c0c0">
		                        <a href="${site.transitUrl}" title="Search ${site.seoName} Homes For Sale near ${site.transitName}"><img src="images/transit/${site.transitUrl}/small_map.png" alt="Small ${site.transitName} Map" title="Search ${site.seoName} Real Estate near ${site.transitName}"/></a>
		                    </div>
		                    <ul>
		                        <logic:iterate name="transitLines" id="line">
		                            <zl:replaceEntity name="line">
		                            	<li><a href="${line.transitLineUrl}" title="Homes For Sale near ${site.transitName} - ${line.name}">Homes for Sale near ${line.name}</a></li>
		                            </zl:replaceEntity>
		                        </logic:iterate>        
		                    </ul>
		                </div>
		            </div>
                    
                    
                    </zl:replaceEntity>
                </logic:equal>        



                <%@ include file="/ads/home_vertical_links.jsp" %>					                        
                <c:if test="${site.code == 'socal'}">
		    		<div class="box">
		    			<h3>About Us</h3>
		    			<div class="content broker">
							<img src="images/logos/socal/lemark.png" style="padding-left: 10px;padding-bottom: 10px"/><br/>
		    				<b>Lemark Realty</b>
		    				<p>Broker: Negin Stern</p>
                            <p><a href="http://www.lemarcinvestments.com" style="font-size: 1em" rel="nofollow">www.lemarcinvestments.com</a></p>
		    				<p>CA DRE License: 01729055</p>
		    				<p style="margin-bottom: 0;">9465 Wilshire Blvd, Suite #300</p>
						<p>Beverly Hills, CA 90212</p
							<p>800.936.0529 Telephone</p>
							<p>800.936.0631 Fax</p>
		    			</div>
		    		</div>
		    	
		    	</c:if>
            				
				<div class="box">
                <h3>Town Profiles</h3>
                	<div class="content">
		                <logic:iterate name="regions" id="region" indexId="counter">
		                    <h4><bean:write name="region" property="region" /> Real Estate</h4>
		                    <ul class="list_grey">
		                    <logic:iterate name="region" property="popularTowns" id="town" length="10">
		                        <zl:replaceEntity name="town">
		                        <li><a href="${town.url}" title="${town.fullTownName} ${town.stateShort} Homes For Sale">${town.fullTownName} ${town.stateShort} Homes for Sale</a></li>
		                        </zl:replaceEntity>
		                    </logic:iterate>            
		                    </ul>
		                    <zl:replaceEntity name="region">
		                        <div class="viewMore" style="font-size: .8em;margin: 5px"><a href="${region.regionUrl}" title="${region.region} ${region.stateShort} Towns and Real Estate">more ${region.region} Towns</a> </div>
		                    </zl:replaceEntity>
		                </logic:iterate>
		            </div>
		        </div>
				
				<div class="box">
	                <logic:notEmpty name="site" property="homeLinks">
	                    <h3>Sites We Like</h3>
	                    <div class="content">
		                    <ul class="list_grey">
		                    <logic:iterate name="site" property="homeLinks" id="link">
		                        <zl:replaceEntity name="link">
		                            <li><a href="${link.url}">${link.anchorText}</a></li>
		                        </zl:replaceEntity>
		                    </logic:iterate>            
		                    </ul>
		                </div>
	                </logic:notEmpty>
	            </div>
								
				<div class="box">
                <h3>Quick Searches</h3>
                	<div class="content">
		                <logic:iterate name="regions" id="region" indexId="counter">
		                    <h4><bean:write name="region" property="region" /> Real Estate</h4>
		                    <ul class="list_grey">
		                    <logic:iterate name="region" property="popularTowns" id="town" length="5">
		                        <zl:replaceEntity name="town">
		                            <li><a href="${town.url}/condos-for-sale" title="${town.fullTownName} ${town.stateShort} Condos For Sale">${town.fullTownName} ${town.stateShort} Condos For Sale</a></li>
		                        </zl:replaceEntity>
		                    </logic:iterate>            
		                    </ul>
		                </logic:iterate>
		            </div>
		        </div>

				<%@ include file="inc_newest_listings.jsp" %>
				<%@ include file="inc_newest_listings_other_sites.jsp" %>

    </div>

</div>

<%@ include file="/template/footer.jsp" %>

