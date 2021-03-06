<#include "settings.ftl" />
<#import "../macro/spring_extension.ftl" as spring />

<#macro page_html>
    <@compress single_line=true>
        <#escape x as x?html>
            <#if isAjax?? && isAjax>
                <@page_body/>
            <#else>
                <!DOCTYPE html>
                <html lang="en_GB">
                    <head>
                        <@page_head/>
                    </head>
                    <#flush>
                    <body onunload="">

                        <@page_body/>

                        <@page_js/>
                    </body>

                </html>
            </#if>
        </#escape>
    </@compress>
</#macro>

<#macro page_head>
    <@page_meta/>
    <title>some silly title to have on this page></title>
    <@page_css/>
    <link rel="shortcut icon" href="/resources/icon/favicon.ico" />
    <link rel="apple-touch-icon" href="/resources/icon/apple-touch-icon.png" />
</#macro>

<#macro page_meta>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=yes" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="description" content="some silly description to have on this page" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
</#macro>

<#macro page_css>
    <#list cssResources["all"] as cssFile>
        <link rel="stylesheet" type="text/css" href="${cssFile}">
    </#list>
</#macro>

<#macro page_body>

</#macro>

<#macro page_js>
    <script type="text/javascript">
        window.onload = function() {
            setTimeout(function() {
                <#list jsResources["all"] as jsFile>
                    <#local node = "node_${jsFile_index}">
                    var ${node} = document.createElement('script');
                    ${node}.setAttribute('type', 'text/javascript');
                    ${node}.setAttribute('src', '${jsFile}');
                    document.body.appendChild(${node});
                </#list>
            }, 50);
        };
    </script>
</#macro>
